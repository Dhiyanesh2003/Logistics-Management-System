<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    int QUANTITY=Integer.parseInt(request.getParameter("QUANTITY"));
    int QUANTITY_=Integer.parseInt(request.getParameter("QUANTITY_"));
    String ITEM_NO=request.getParameter("ITEM_NO");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/INVENTORY", "root", "root");
        Statement st=conn.createStatement();
        
        if(QUANTITY==QUANTITY_){
        
            String sql ="UPDATE ITEMS SET QUANTITY = '"+QUANTITY+"', STATUS = '1' WHERE ITEM_NO = '"+ITEM_NO+"' ;";

            int i=st.executeUpdate(sql);

            System.out.println(sql);
            if(i>0){
                Date now = new Date();
                String pattern = "yyyy-MM-dd hh:mm:ss";
                SimpleDateFormat formatter = new SimpleDateFormat(pattern);
                String mysqlDateString = formatter.format(now);
                String sql1 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS) VALUES ("+ITEM_NO+", "+QUANTITY+", '"+mysqlDateString+"', 1);";
                
                int i1 = st.executeUpdate(sql);
                
                if(i1>0){
                %>
                <h1><%= i1 %></h1>
<!--                <script>
                    alert("PO have been added to stock");
                    window.location.replace("http://localhost:8084/INVENTORY/ViewStock.jsp");
                </script>-->
                <% 
                }
            }
            else{
                %>
                <script>
                    alert("Error ! Please Try again !");
                    window.location.replace("http://localhost:8084/INVENTORY/ViewStock.jsp");
                </script>
                <% 
            }
        }
        else if(QUANTITY<QUANTITY_){
            
            int QUANT = QUANTITY_ - QUANTITY;
            String sql ="UPDATE ITEMS SET QUANTITY = '"+QUANTITY+"', STATUS = '1' WHERE ITEM_NO = '"+ITEM_NO+"' ;";

            int i=st.executeUpdate(sql);

            System.out.println(sql);
            Date now = new Date();
            String pattern = "yyyy-MM-dd hh:mm:ss";
            SimpleDateFormat formatter = new SimpleDateFormat(pattern);
            String mysqlDateString = formatter.format(now);
            if(i>0){
                
                String sql1 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS) VALUES ("+ITEM_NO+", "+QUANTITY+", '"+mysqlDateString+"', 1);";
                
                int i1 = st.executeUpdate(sql1);
                
                if(i1>0){
                    String sql2 = "INSERT INTO REPORT (ITEM_NO, QUANTITY, DATE, STATUS) VALUES ("+ITEM_NO+", "+QUANT+", '"+mysqlDateString+"', -1);";
                
                    int i2 = st.executeUpdate(sql2);

                    if(i2>0){  
                        %>
                        <script>
                            alert("Stock added - <%=QUANTITY%>\nStock returned - <%=QUANT%>");
                            window.location.replace("http://localhost:8084/INVENTORY/ViewStock.jsp");
                        </script>
                        <%
                    }
                }
            }
            else{
            %>
            <script>
                alert("Cannot add stock more than given quantity !");
                window.location.replace("http://localhost:8084/INVENTORY/RemoveStocks.jsp");
            </script>
            <%
            }
        }
        else{
            %>
            <script>
                alert("Cannot add stock more than given quantity !");
                window.location.replace("http://localhost:8084/INVENTORY/addExistingItem.jsp");
            </script>
            <%
        }
    }
    catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
 %>