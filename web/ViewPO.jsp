<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Output form</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
        />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {
                height: 550px;
            }

            /* Set gray background color and 100% height */
            .sidenav {
                background-color: #f1f1f1;
                height: 100vh;
                position: sticky;
            }

            .container-fluid {
                margin-left: 10px;
                /* box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; */
                /* border-radius: 2px; */
                /* height: 500px; */
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #001a39;
            }

            .profile-button {
                background: #001a39;
                box-shadow: none;
                border: none;
            }

            .profile-button:hover {
                background: #682773;
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none;
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }

            .labels {
                font-size: 11px;
            }

            .add-experience:hover {
                background: #ba68c8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #ba68c8;
            }

            /* button */

            .btn-primary {
                background-color: #4099ff;
                border-color: #4099ff;
                color: #fff;
                cursor: pointer;
                -webkit-transition: all ease-in 0.3s;
                transition: all ease-in 0.3s;
            }
            .btn {
                border-radius: 2px;
                text-transform: capitalize;
                font-size: 15px;
                padding: 10px 19px;
                cursor: pointer;
            }
            .m-b-20 {
                margin-bottom: 20px;
            }
            .btn-md {
                margin-top: 25px;
                /* margin-left: 400px; */
                padding: 10px 16px;
                font-size: 15px;
                line-height: 23px;
            }
            .btn-google {
                color: #545454;
                background-color: #ffffff;
                box-shadow: 0 1px 2px 1px #ddd;
            }
            /* On small screens, set height to 'auto' for the grid */
            @media screen and (max-width: 767px) {
                .row.content {
                    height: auto;
                }
                .btn-md {
                    margin-left: 120px;
                    padding: 10px 16px;
                    font-size: 15px;
                    line-height: 23px;
                }
            }

            /* icon */
            .gg-add-r {
                box-sizing: border-box;
                position: relative;
                display: block;
                width: 22px;
                height: 22px;
                border: 2px solid;
                border-radius: 4px;
            }

            .gg-add-r::after,
            .gg-add-r::before {
                content: "";
                display: block;
                box-sizing: border-box;
                position: absolute;
                width: 10px;
                height: 2px;
                background: currentColor;
                border-radius: 5px;
                top: 8px;
                left: 4px;
            }

            .gg-add-r::after {
                width: 2px;
                height: 10px;
                top: 4px;
                left: 8px;
            }
                /* table */

            .my-custom-scrollbar {
                margin-left: 50px;
                margin-right: 50px;
                position: relative;
                height: 500px;
                overflow: scroll;
            }
            .table-wrapper-scroll-y {
                display: block;
            }
            th {
                background-color: #4099ff;
                color: white;
            }
            .table-give-border{
                border: 2px solid black;
            }
        </style>
	</head>
	<body>
            <%!
            public class Items{
                String URL = "jdbc:mysql://localhost:3306/inventory";
                String USERNAME = "root";
                String PASSWORD = "root";
                
                Connection connection = null;
                PreparedStatement selectItems = null;
                ResultSet resultSet = null;

                public Items(){
                    try{
                        connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectItems = connection.prepareStatement("SELECT * FROM ITEMS WHERE STATUS = '0';");
                    }
                    catch(SQLException e){
                        e.printStackTrace();
                    }
                }
                public ResultSet getItems(){
                    try{
                    resultSet = selectItems.executeQuery();
                    }
                    catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
        %>
        <%            
            Items i = new Items();
            ResultSet rs = i.getItems();
        %>
		<nav class="navbar navbar-inverse visible-xs">
			<div class="container-fluid">
				<div class="navbar-header">
					<button
						type="button"
						class="navbar-toggle"
						data-toggle="collapse"
						data-target="#myNavbar"
					>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a
						class="navbar-brand"
						href="#"
					>
					</a>
				</div>
				<div
					class="collapse navbar-collapse"
					id="myNavbar"
				>
					<ul class="nav navbar-nav">
						<li"><a href="addNewPO.jsp">Add new PO</a>
						<li
							><a href="addExistingItem.jsp"
								>Add Item to Stock</a
							></li
						>
						<li class="active"
							><a href="ViewStock.jsp">View Stock</a></li
						>
						<li><a href="RemoveStocks.jsp">Remove Stock</a></li>
						<li
							><a href="GenrateReport.jsp"
								>Generate Report</a
							></li
						>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-3 sidenav hidden-xs">
					<h2> </h2>
					<ul class="nav nav-pills nav-stacked">
						<li><a href="addNewPO.jsp">Add new PO</a></li>
                                                <li class="active"><a href="ViewPO.jsp">View PO</a></li>
						<li
							><a href="addExistingItem.jsp"
								>Add Item to Stock</a
							></li
						>
						<li
							><a href="ViewStock.jsp">View Stock</a></li
						>
						<li><a href="RemoveStocks.jsp">Remove Stock</a></li>
						<li
							><a href="GenrateReport.jsp"
								>Generate Report</a
							></li
						> </ul
					><br />
				</div>
				<div class="col-sm-9"><br>
					<h2 class="text-center">View Stocks</h2>
					<br /><br>
					<div class="table-give-border my-custom-scrollbar">
						<table class="table table-bordered table-striped mb-0">
							<thead>
								<tr>
									<th scope="col">Item.NO</th>
									<th scope="col">Item-Name</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Entry Time-Date</th>
									<th scope="col">Tax</th>
									<th scope="col">Manufacture-Date</th>
									<th scope="col">Expiry-Date</th>
									<th scope="col">Vendor Name</th>
									<th scope="col">Vendor Ph.No</th>
									<th scope="col">Company Name</th>
									<th scope="col">Product Description</th>
									<th scope="col">Specification</th>
									<th scope="col">Imported Purchase</th>
								</tr>
							</thead>
							<tbody>
                                                            <%
                                                                while(rs.next()){
                                                            %>
								<tr>
									<td scope="row"><%=rs.getString("ITEM_NO")%></th>
									<td><%=rs.getString("ITEM_NAME")%></td>
									<td><%=rs.getString("PRICE")%></td>
									<td><%=rs.getString("QUANTITY")%></td>
									<td><%=rs.getString("ENTRY")%></td>
									<td><%=rs.getString("TAX")%></td>
									<td><%=rs.getString("MFD")%></td>
									<td><%=rs.getString("EXP")%></td>
									<td><%=rs.getString("VENDOR_NAME")%></td>
									<td><%=rs.getString("VENDOR_PHONE")%></td>
									<td><%=rs.getString("COMP_NAME")%></td>
									<td><%=rs.getString("PRODUCT_DESC")%></td>
									<td><%=rs.getString("SPECIFICATION")%></td>
									<td><%=rs.getString("IMPORTED")%></td>
								</tr>
                                                            <%}%>
							</tbody>
						</table>
					</div>
				</div>
				<!-- <div class="col-sm-1"></div> -->
			</div>
		</div>
	</body>
</html>
