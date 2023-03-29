<%@page import = "java.sql.*" %> <% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Dashboard</title>
		<meta charset="utf-8" />
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1"
		/>
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

			/* #id{
width: 45%;

} */
			.btn-primary {
				/* width: 20%; */
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
				margin-left: 400px;
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
		</style>
	</head>
	<body>
            <%! public class Items {

                    String URL
                            = "jdbc:mysql://localhost:3306/inventory";
                    String USERNAME = "root";
                    String PASSWORD = "root";
                    Connection connection = null;
                    PreparedStatement selectItems = null;
                    ResultSet resultSet = null;

                    public Items() {
                        try {
                            connection
                                    = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                            selectItems
                                    = connection.prepareStatement("SELECT * FROM ITEMS;");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public ResultSet getItems() {
                        try {
                            resultSet = selectItems.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return resultSet;
                    }
                }
                Items i = new Items();
                ResultSet rs = i.getItems();
                int id = 0; %>
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
						<li class="active"
							><a href="addNewPO.jsp">Add new PO</a></li
						>
                                                <li><a href="ViewPO.jsp">View PO</a></li>
						<li
							><a href="addExistingItem.jsp"
								>Add Item to Stock</a
							></li
						>
						<li><a href="ViewStock.jsp">View Stock</a></li>
						<li><a href="RemoveStocks.jsp">Remove Stock</a></li>
						<li><a href="GenrateReport.jsp">Generate Report</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row content">
				<div class="col-sm-3 sidenav hidden-xs">
					<h2> </h2>
					<ul class="nav nav-pills nav-stacked">
						<li class="active"
							><a href="addNewPO.jsp">Add new PO</a></li
						>
                                                <li><a href="ViewPO.jsp">View PO</a></li>
						<li
							><a href="addExistingItem.jsp"
								>Add Item to Stock</a
							></li
						>
						<li><a href="ViewStock.jsp">View Stock</a></li>
						<li><a href="RemoveStocks.jsp">Remove Stock</a></li>
						<li
							><a href="GenrateReport.jsp">Generate Report</a></li
						> </ul
					><br />
				</div>
				<br />
				<div class="col-sm-1"> </div>
				<div class="col-sm-7 border-right">
					<div class="p-3 py-5">
						<div
							class="d-flex justify-content-between align-items-center mb-3"
						>
							<h3 class="text-center">Add new PO</h3><br />
						</div>
						<form
							action="addPO.jsp"
							method="post"
						>
							<div class="row mt-2">
								<div class="col-md-6"
									><label class="labels">Item.No</label>
									<% while(rs.next()){ id =
									Integer.parseInt(rs.getString("ITEM_NO"))+1;
									} %>
									<input
										type="number"
										class="form-control"
										value="<%= id %>"
										name="ITEM_NO"
                                                                                required
									/>
								</div>
								<div class="col-md-6"
									><label class="labels">Item Name</label
									><input
										type="text"
										class="form-control"
										value=""
										name="ITEM_NAME"
                                                                                required
								/></div>
							</div>
							<div class="row mt-2">
								<div class="col-md-6">
									<label class="labels">Price</label>
									<input
										type="number"
										class="form-control"
										value=""
										min="0"
										name="PRICE"
                                                                                required
									/>
								</div>
								<div class="col-md-6"
									><label class="labels">Qty</label
									><input
										type="number"
										class="form-control"
										value=""
										min="0"
										name="QUANTITY"
                                                                                required
								/></div>
								<!-- <div class="col-md-6"><label class="labels"></label><input type="date" class="form-control" value="" ></div> -->
							</div>
							<div class="row mt-2">
								<div class="col-md-6"
									><label class="labels"
										>Entry Time and Date</label
									><input
										type="datetime-local"
										class="form-control"
										value=""
										name="ENTRY"
                                                                                required
								/></div>
								<div class="col-md-6"
									><label class="labels">Tax</label
									><input
										type="number"
										class="form-control"
										value=""
										min="0"
										name="TAX"
                                                                                required
								/></div>
							</div>
							<div class="row mt-3">
								<div class="col-md-6"
									><label class="labels"
										>Manufacture-Date</label
									><input
										type="date"
										class="form-control"
										value=""
										name="MFD"
								/></div>
								<div class="col-md-6"
									><label class="labels">Expiry-Date</label
									><input
										type="date"
										class="form-control"
										value=""
										name="EXP"
								/></div>
								<div class="col-md-6"
									><label class="labels">Vendor Name</label
									><input
										type="text"
										class="form-control"
										value=""
										name="VENDOR_NAME"
								/></div>
								<div class="col-md-6"
									><label class="labels"
										>Vendor Mobile.no</label
									><input
										type="number"
										class="form-control"
										value=""
										name="VENDOR_PHONE"
								/></div>
								<div class="col-md-12"
									><label class="labels">Company Name</label
									><input
										type="text"
										class="form-control"
										value=""
										name="COMP_NAME"
                                                                                required
								/></div>
								<div class="col-md-12"
									><label class="labels"
										>Product Description</label
									><input
										type="text"
										class="form-control"
										value=""
										name="PRODUCT_DESC"
								/></div>
								<div class="col-md-12"
									><label class="labels">Specification</label
									><input
										type="text"
										class="form-control"
										value=""
										name="SPECIFICATION"
								/></div>
								<div class="col-md-12"
									><label class="labels"
										>Imported Purchase</label
									>
									<select
										class="form-control"
										id="exampleFormControlSelect1"
										name="IMPORTED"
									>
										<option value="YES">YES</option>
										<option value="NO">NO</option>
									</select>
								</div>
								<input
									type="text"
									class="form-control"
									name="DEPT"
									value="TRANSPORT"
									style="visibility: hidden"
								/>
								<input
									type="submit"
									id="button"
									class="btn btn-primary btn-md text-center m-b-20"
									name="submit"
									value="+ Add new PO"
								/>
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
	</body>
</html>

<!-- INSERT INTO EXAMPLE VALUES (12345); -->
