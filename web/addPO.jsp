<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String ITEM_NO=request.getParameter("ITEM_NO");
    String ITEM_NAME=request.getParameter("ITEM_NAME");
    String PRICE=request.getParameter("PRICE");
    String QUANTITY=request.getParameter("QUANTITY");
    String ENTRY=request.getParameter("ENTRY");
    String TAX=request.getParameter("TAX");
    String MFD=request.getParameter("MFD");
    String EXP=request.getParameter("EXP");
    String VENDOR_NAME=request.getParameter("VENDOR_NAME");
    String VENDOR_PHONE=request.getParameter("VENDOR_PHONE");
    String COMP_NAME=request.getParameter("COMP_NAME");
    String PRODUCT_DESC=request.getParameter("PRODUCT_DESC");
    String SPECIFICATION=request.getParameter("SPECIFICATION");
    String IMPORTED=request.getParameter("IMPORTED");
    String DEPT=request.getParameter("DEPT");
    String entry = "";
    for(int i=0;i<ENTRY.length();i++){
        if(ENTRY.charAt(i)=='T'){
            entry += " ";
        }
        else{
            entry += ENTRY.charAt(i);
        }
    }
    entry += ":00";
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/INVENTORY", "root", "root");
        Statement st=conn.createStatement();
        String sql ="INSERT INTO ITEMS (ITEM_NO, ITEM_NAME, PRICE, QUANTITY, ENTRY, TAX, MFD, EXP, VENDOR_NAME, VENDOR_PHONE, COMP_NAME, PRODUCT_DESC, SPECIFICATION, IMPORTED, DEPT) VALUES ('"+ITEM_NO+"','"+ITEM_NAME+"','"+PRICE+"','"+QUANTITY+"','"+entry+"','"+TAX+"','"+MFD+"','"+EXP+"','"+VENDOR_NAME+"','"+VENDOR_PHONE+"','"+COMP_NAME+"','"+PRODUCT_DESC+"','"+SPECIFICATION+"','"+IMPORTED+"', '"+DEPT+"');";
        
        int i=st.executeUpdate(sql);
        
        System.out.println(sql);
        if(i>0){
            Date now = new Date();
            String pattern1 = "yyyy-MM-dd hh:mm:ss";
            SimpleDateFormat formatter1 = new SimpleDateFormat(pattern1);
            String mysqlDateString1 = formatter1.format(now);
            String sql1 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS) VALUES ("+ITEM_NO+", "+QUANTITY+", '"+mysqlDateString1+"', 0);";
            
            int i1=st.executeUpdate(sql1);
            if(i1>0){
                %>
                <script>
                    alert("PO added successfully !! !");
                    window.location.replace("http://localhost:8084/INVENTORY/ViewPO.jsp");
                </script>
                <%
            }
        }
        else{
            String redirectURL = "http://localhost:8084/INVENTORY/addNewPO.jsp";
            response.sendRedirect(redirectURL);
        }
    }
    catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
 %>