<%@page import="java.io.File"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

    <title>Doc</title>
    <style>
        body{
            background-color: rgb(245, 245, 245);
        }
        table{
            margin-top: 2%; 
        }
        img{
            margin-left: 20%;
            width: 60%;
        }
        center h1{
            font-weight: 700;
            font-size: 50px;
        }
        #btn{
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: 700;
        }
    </style>
</head>
<%!
    public class Status{
        public String getStatus(String stat){
            String status = "";
            int s = Integer.parseInt(stat);
            switch(s){
            case 0: status = "Initiated PO";
                    break;
            case 1: status = "Item added to Stock";
                    break;
            case 2: status = "Stock given to employee";
                    break;
            case -1: status = "Defective item was returned";
                    break;
            case -2: status = "Wastage";
                    break;
            }
            return status;
        }
    }
%>
<%
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/INVENTORY", "root", "root");
        Statement st=conn.createStatement();
        PreparedStatement selectId = conn.prepareStatement("select * from report where DATE between '"+start+"' and '"+end+"';");
        ResultSet rs = selectId.executeQuery();
        %>
        <body><br>
            <center class="image" >
                <h3><b>St. Joseph's Institute of Technology</b></h3>
                <h5>(St. Joseph's Group of Institutions)</h5>
                <h5><b>OMR, Chennai - 600 119</b></h3>
            </center><br>
        <center>
            <h4><b>
                Inventory Report
            </b></h4>
        </center>
            <div class="container">
                <div class="table-responsive">
                    <table id="tblData" class="table table-hover table-bordered">
                        <thead class="table-primary">
                            <tr>
                                <th scope="col">Item No</th>
                                <th scope="col">Item Name</th>
                                <th scope="col">Company Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Date and Time</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
        <%
        if(rs != null){
            while(rs.next()){
                Status s = new Status();
                String status = s.getStatus(rs.getString("status"));
                PreparedStatement selectId1 = conn.prepareStatement("select * from items where ITEM_NO = '"+rs.getString("ITEM_NO")+"';");
                ResultSet rs1 = selectId1.executeQuery();
                if(rs1 != null){
                    while(rs1.next()){
                %>
                            <tr>
                                <th scope="row"><%=rs.getString("ITEM_NO")%></th>
                                <td><%=rs1.getString("ITEM_NAME")%></td>
                                <td><%=rs1.getString("COMP_NAME")%></td>
                                <td><%=rs1.getString("PRICE")%></td>
                                <td><%=rs.getString("QUANTITY")%></td>
                                <td><%=rs.getString("DATE").substring(0,19)%></td>
                                <td><%=status%></td>
                            </tr>
                <%
                    break;
                    }
                }
            }
        }
        else{
            %>
            <script>
                alert("Error !");
                window.location.replace("http://localhost:8084/INVENTORY/RemoveStocks.jsp");
            </script>
            <%
        }
        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <br><br>
            <center>
                <%
                    if(request.getParameter("word")==null){
                %>
                <form action="report.jsp" method="post">
                    <input type="hidden" value="yes" name="word" />
                    <input type="hidden" value="<%=start%>" name="start" />
                    <input type="hidden" value="<%=end%>" name="end" />
                    <input type="submit" value="Download Report" />
                </form>
                <%
                    }
                %>
            </center>
            <br><br><br><br>
        <%
    }
    catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
    String a1 = request.getParameter("word");
    if (a1 != null) {
        if (a1.equals("yes")) {
            File filepath = new File("Report.doc");
            response.setContentType("application/vnd.ms-word");
            response.setHeader("Content-Disposition", "inline; filename=" + filepath);
        }
    }
        %>

</body>
</html>

                
<!--                    <tr>
                        <th scope="row"></th>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>-->
                