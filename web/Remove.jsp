<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    int STATUS=Integer.parseInt(request.getParameter("status"));
    int ID=Integer.parseInt(request.getParameter("ID"));
    String ITEM_NO=request.getParameter("ITEM_NO");
    int QUANTITY=Integer.parseInt(request.getParameter("QUANTITYY"));
    int qty = QUANTITY;
    try
    {
        Date now = new Date();
        String pattern = "yyyy-MM-dd hh:mm:ss";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String mysqlDateString = formatter.format(now);
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/INVENTORY", "root", "root");
        Statement st=conn.createStatement();
        
        PreparedStatement selectId = conn.prepareStatement("SELECT * FROM ITEMS WHERE ITEM_NO = '"+ITEM_NO+"' AND STATUS = 1;");
        ResultSet rs = selectId.executeQuery();
        if(rs != null){
            while(rs.next()){
                qty = Integer.parseInt(rs.getString("QUANTITY"));
            }
        }
        if(QUANTITY==qty){
            int QUANTS = qty - QUANTITY;
        
            String sql ="UPDATE ITEMS SET QUANTITY = '"+QUANTS+"', STATUS = '2' WHERE ITEM_NO = '"+ITEM_NO+"' ;";

            int i=st.executeUpdate(sql);

            System.out.println(sql);
            if(i>0){
                String sql1 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS, EMP_ID) VALUES ("+ITEM_NO+", "+QUANTITY+", '"+mysqlDateString+"', '"+STATUS+"', '"+ID+"' );";
                
                int i1 = st.executeUpdate(sql);
                
                if(i1>0){
                    String redirectURL = "http://localhost:8084/INVENTORY/ViewStock.jsp";
                    response.sendRedirect(redirectURL);  
                }
            }
            else{
                String redirectURL = "http://localhost:8084/INVENTORY/RemoveStocks.jsp";
                response.sendRedirect(redirectURL);
            }
        }
        else if(QUANTITY<qty){
            
            int QUANT = qty - QUANTITY;
            String sql ="UPDATE ITEMS SET QUANTITY = '"+QUANT+"' WHERE ITEM_NO = '"+ITEM_NO+"' ;";

            int i=st.executeUpdate(sql);

            System.out.println(sql);
            if(i>0){
                
                String sql1 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS) VALUES ("+ITEM_NO+", "+QUANTITY+", '"+mysqlDateString+"', '"+STATUS+"');";
                
                int i1 = st.executeUpdate(sql1);
                
                if(i1>0){
                    String redirectURL = "http://localhost:8084/INVENTORY/ViewStock.jsp";
                    response.sendRedirect(redirectURL); 
                }
            }
            else{
                String redirectURL = "http://localhost:8084/INVENTORY/RemoveStocks.jsp";
                response.sendRedirect(redirectURL);
            }
        }
        else{
            %>
            <script>
                alert("Cannot remove stock more than given quantity !");
                window.location.replace("http://localhost:8084/INVENTORY/RemoveStocks.jsp");
            </script>
            <%
        }
    }
    catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
 %>