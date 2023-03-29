package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class addNewPO_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
                        selectItems = connection.prepareStatement("SELECT * FROM ITEMS;");
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

            Items i = new Items();
            ResultSet rs = i.getItems();
            int id = 0;
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\t<head>\n");
      out.write("\t\t<title>Dashboard</title>\n");
      out.write("\t\t<meta charset=\"utf-8\" />\n");
      out.write("\t\t<meta\n");
      out.write("\t\t\tname=\"viewport\"\n");
      out.write("\t\t\tcontent=\"width=device-width, initial-scale=1\"\n");
      out.write("\t\t/>\n");
      out.write("\t\t<link\n");
      out.write("\t\t\trel=\"stylesheet\"\n");
      out.write("\t\t\thref=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\"\n");
      out.write("\t\t/>\n");
      out.write("\t\t<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js\"></script>\n");
      out.write("\t\t<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\t/* Set height of the grid so .sidenav can be 100% (adjust as needed) */\n");
      out.write("\t\t\t.row.content {\n");
      out.write("\t\t\t\theight: 550px;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t/* Set gray background color and 100% height */\n");
      out.write("\t\t\t.sidenav {\n");
      out.write("\t\t\t\tbackground-color: #f1f1f1;\n");
      out.write("\t\t\t\theight: 100vh;\n");
      out.write("\t\t\t\tposition: sticky;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.container-fluid {\n");
      out.write("\t\t\t\tmargin-left: 10px;\n");
      out.write("\t\t\t\t/* box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; */\n");
      out.write("\t\t\t\t/* border-radius: 2px; */\n");
      out.write("\t\t\t\t/* height: 500px; */\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.form-control:focus {\n");
      out.write("\t\t\t\tbox-shadow: none;\n");
      out.write("\t\t\t\tborder-color: #001a39;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.profile-button {\n");
      out.write("\t\t\t\tbackground: #001a39;\n");
      out.write("\t\t\t\tbox-shadow: none;\n");
      out.write("\t\t\t\tborder: none;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.profile-button:hover {\n");
      out.write("\t\t\t\tbackground: #682773;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.profile-button:focus {\n");
      out.write("\t\t\t\tbackground: #682773;\n");
      out.write("\t\t\t\tbox-shadow: none;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.profile-button:active {\n");
      out.write("\t\t\t\tbackground: #682773;\n");
      out.write("\t\t\t\tbox-shadow: none;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.back:hover {\n");
      out.write("\t\t\t\tcolor: #682773;\n");
      out.write("\t\t\t\tcursor: pointer;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.labels {\n");
      out.write("\t\t\t\tfont-size: 11px;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.add-experience:hover {\n");
      out.write("\t\t\t\tbackground: #ba68c8;\n");
      out.write("\t\t\t\tcolor: #fff;\n");
      out.write("\t\t\t\tcursor: pointer;\n");
      out.write("\t\t\t\tborder: solid 1px #ba68c8;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t/* button */\n");
      out.write("\n");
      out.write("\t\t\t/* #id{\n");
      out.write("width: 45%;\n");
      out.write("\n");
      out.write("} */\n");
      out.write("\t\t\t.btn-primary {\n");
      out.write("\t\t\t\t/* width: 20%; */\n");
      out.write("\t\t\t\tbackground-color: #4099ff;\n");
      out.write("\t\t\t\tborder-color: #4099ff;\n");
      out.write("\t\t\t\tcolor: #fff;\n");
      out.write("\t\t\t\tcursor: pointer;\n");
      out.write("\t\t\t\t-webkit-transition: all ease-in 0.3s;\n");
      out.write("\t\t\t\ttransition: all ease-in 0.3s;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.btn {\n");
      out.write("\t\t\t\tborder-radius: 2px;\n");
      out.write("\t\t\t\ttext-transform: capitalize;\n");
      out.write("\t\t\t\tfont-size: 15px;\n");
      out.write("\t\t\t\tpadding: 10px 19px;\n");
      out.write("\t\t\t\tcursor: pointer;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.m-b-20 {\n");
      out.write("\t\t\t\tmargin-bottom: 20px;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.btn-md {\n");
      out.write("\t\t\t\tmargin-top: 20px;\n");
      out.write("\t\t\t\tmargin-left: 400px;\n");
      out.write("\t\t\t\tpadding: 10px 16px;\n");
      out.write("\t\t\t\tfont-size: 15px;\n");
      out.write("\t\t\t\tline-height: 23px;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t.btn-google {\n");
      out.write("\t\t\t\tcolor: #545454;\n");
      out.write("\t\t\t\tbackground-color: #ffffff;\n");
      out.write("\t\t\t\tbox-shadow: 0 1px 2px 1px #ddd;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\t/* On small screens, set height to 'auto' for the grid */\n");
      out.write("\t\t\t@media screen and (max-width: 767px) {\n");
      out.write("\t\t\t\t.row.content {\n");
      out.write("\t\t\t\t\theight: auto;\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\t.btn-md {\n");
      out.write("\t\t\t\t\tmargin-left: 120px;\n");
      out.write("\t\t\t\t\tpadding: 10px 16px;\n");
      out.write("\t\t\t\t\tfont-size: 15px;\n");
      out.write("\t\t\t\t\tline-height: 23px;\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t/* icon */\n");
      out.write("\t\t\t.gg-add-r {\n");
      out.write("\t\t\t\tbox-sizing: border-box;\n");
      out.write("\t\t\t\tposition: relative;\n");
      out.write("\t\t\t\tdisplay: block;\n");
      out.write("\t\t\t\twidth: 22px;\n");
      out.write("\t\t\t\theight: 22px;\n");
      out.write("\t\t\t\tborder: 2px solid;\n");
      out.write("\t\t\t\tborder-radius: 4px;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.gg-add-r::after,\n");
      out.write("\t\t\t.gg-add-r::before {\n");
      out.write("\t\t\t\tcontent: \"\";\n");
      out.write("\t\t\t\tdisplay: block;\n");
      out.write("\t\t\t\tbox-sizing: border-box;\n");
      out.write("\t\t\t\tposition: absolute;\n");
      out.write("\t\t\t\twidth: 10px;\n");
      out.write("\t\t\t\theight: 2px;\n");
      out.write("\t\t\t\tbackground: currentColor;\n");
      out.write("\t\t\t\tborder-radius: 5px;\n");
      out.write("\t\t\t\ttop: 8px;\n");
      out.write("\t\t\t\tleft: 4px;\n");
      out.write("\t\t\t}\n");
      out.write("\n");
      out.write("\t\t\t.gg-add-r::after {\n");
      out.write("\t\t\t\twidth: 2px;\n");
      out.write("\t\t\t\theight: 10px;\n");
      out.write("\t\t\t\ttop: 4px;\n");
      out.write("\t\t\t\tleft: 8px;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</style>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("            ");
      out.write("\n");
      out.write("\t\t<nav class=\"navbar navbar-inverse visible-xs\">\n");
      out.write("\t\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t<div class=\"navbar-header\">\n");
      out.write("\t\t\t\t\t<button\n");
      out.write("\t\t\t\t\t\ttype=\"button\"\n");
      out.write("\t\t\t\t\t\tclass=\"navbar-toggle\"\n");
      out.write("\t\t\t\t\t\tdata-toggle=\"collapse\"\n");
      out.write("\t\t\t\t\t\tdata-target=\"#myNavbar\"\n");
      out.write("\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t<a\n");
      out.write("\t\t\t\t\t\tclass=\"navbar-brand\"\n");
      out.write("\t\t\t\t\t\thref=\"#\"\n");
      out.write("\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div\n");
      out.write("\t\t\t\t\tclass=\"collapse navbar-collapse\"\n");
      out.write("\t\t\t\t\tid=\"myNavbar\"\n");
      out.write("\t\t\t\t>\n");
      out.write("\t\t\t\t\t<ul class=\"nav navbar-nav\">\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"\n");
      out.write("\t\t\t\t\t\t\t><a href=\"addNewPO.jsp\">Add new PO</a></li\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t<li\n");
      out.write("\t\t\t\t\t\t\t><a href=\"addExistingItem.jsp\"\n");
      out.write("\t\t\t\t\t\t\t\t>Add Item to Stock</a\n");
      out.write("\t\t\t\t\t\t\t></li\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"ViewStock.jsp\">View Stock</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"RemoveStocks.jsp\">Remove Stock</a></li>\n");
      out.write("\t\t\t\t\t\t<li\n");
      out.write("\t\t\t\t\t\t\t><a href=\"GenrateReport.jsp\"\n");
      out.write("\t\t\t\t\t\t\t\t>Generate Report</a\n");
      out.write("\t\t\t\t\t\t\t></li\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\n");
      out.write("\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t<div class=\"row content\">\n");
      out.write("\t\t\t\t<div class=\"col-sm-3 sidenav hidden-xs\">\n");
      out.write("\t\t\t\t\t<h2> </h2>\n");
      out.write("\t\t\t\t\t<ul class=\"nav nav-pills nav-stacked\">\n");
      out.write("\t\t\t\t\t\t<li class=\"active\"\n");
      out.write("\t\t\t\t\t\t\t><a href=\"addNewPO.jsp\">Add new PO</a></li\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t<li\n");
      out.write("\t\t\t\t\t\t\t><a href=\"addExistingItem.jsp\"\n");
      out.write("\t\t\t\t\t\t\t\t>Add Item to Stock</a\n");
      out.write("\t\t\t\t\t\t\t></li\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"ViewStock.jsp\">View Stock</a></li>\n");
      out.write("\t\t\t\t\t\t<li><a href=\"RemoveStocks.jsp\">Remove Stock</a></li>\n");
      out.write("\t\t\t\t\t\t<li\n");
      out.write("\t\t\t\t\t\t\t><a href=\"GenrateReport.jsp\"\n");
      out.write("\t\t\t\t\t\t\t\t>Generate Report</a\n");
      out.write("\t\t\t\t\t\t\t></li\n");
      out.write("\t\t\t\t\t\t> </ul\n");
      out.write("\t\t\t\t\t><br />\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<br />\n");
      out.write("\t\t\t\t<div class=\"col-sm-1\"> </div>\n");
      out.write("\t\t\t\t<div class=\"col-sm-7 border-right\">\n");
      out.write("\t\t\t\t\t<div class=\"p-3 py-5\">\n");
      out.write("\t\t\t\t\t\t<div\n");
      out.write("\t\t\t\t\t\t\tclass=\"d-flex justify-content-between align-items-center mb-3\"\n");
      out.write("\t\t\t\t\t\t>\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"text-center\">Add new PO</h3><br />\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("                                                <form action=\"addPO.jsp\" method=\"post\">\n");
      out.write("                                                    <div class=\"row mt-2\">\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Item.No</label>\n");
      out.write("                                                                    ");

                                                                        while(rs.next()){
                                                                            id = Integer.parseInt(rs.getString("ITEM_NO"))+1;
                                                                        }
                                                                    
      out.write("                                                                \n");
      out.write("                                                                    <input\n");
      out.write("                                                                            type=\"number\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"");
      out.print( id );
      out.write("\"\n");
      out.write("                                                                            name=\"ITEM_NO\"\n");
      out.write("                                                                    />\n");
      out.write("                                                            </div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Item Name</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"text\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"ITEM_NAME\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"row mt-2\">\n");
      out.write("                                                            <div class=\"col-md-6\">\n");
      out.write("                                                                    <label class=\"labels\">Price</label>\n");
      out.write("                                                                    <input\n");
      out.write("                                                                            type=\"number\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            min=\"0\"\n");
      out.write("                                                                            name=\"PRICE\"\n");
      out.write("                                                                    />\n");
      out.write("                                                            </div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Qty</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"number\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            min=\"0\"\n");
      out.write("                                                                            name=\"QUANTITY\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <!-- <div class=\"col-md-6\"><label class=\"labels\"></label><input type=\"date\" class=\"form-control\" value=\"\" ></div> -->\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"row mt-2\">\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\"\n");
      out.write("                                                                            >Entry Time and Date</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"datetime-local\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"ENTRY\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Tax</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"number\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            min=\"0\"\n");
      out.write("                                                                            name=\"TAX\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"row mt-3\">\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Manufacture-Date</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"date\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"MFD\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Expiry-Date</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"date\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"EXP\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Vendor Name</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"text\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"VENDOR_NAME\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-6\"\n");
      out.write("                                                                    ><label class=\"labels\">Vendor Mobile.no</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"number\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"VENDOR_PHONE\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-12\"\n");
      out.write("                                                                    ><label class=\"labels\">Company Name</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"text\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"COMP_NAME\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-12\"\n");
      out.write("                                                                    ><label class=\"labels\"\n");
      out.write("                                                                            >Product Description</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"text\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"PRODUCT_DESC\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-12\"\n");
      out.write("                                                                    ><label class=\"labels\">Specification</label\n");
      out.write("                                                                    ><input\n");
      out.write("                                                                            type=\"text\"\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            value=\"\"\n");
      out.write("                                                                            name=\"SPECIFICATION\"\n");
      out.write("                                                            /></div>\n");
      out.write("                                                            <div class=\"col-md-12\"\n");
      out.write("                                                                    ><label class=\"labels\">Imported Purchase</label>\n");
      out.write("                                                                    <select\n");
      out.write("                                                                            class=\"form-control\"\n");
      out.write("                                                                            id=\"exampleFormControlSelect1\"\n");
      out.write("                                                                             name=\"IMPORTED\"\n");
      out.write("                                                                    >\n");
      out.write("                                                                            <option value=\"YES\">YES</option>\n");
      out.write("                                                                            <option value=\"NO\">NO</option>\n");
      out.write("                                                                    </select>\n");
      out.write("                                                            </div>\n");
      out.write("                                                            <input\n");
      out.write("                                                                type=\"text\"\n");
      out.write("                                                                class=\"form-control\"\n");
      out.write("                                                                name=\"DEPT\"\n");
      out.write("                                                                value=\"TRANSPORT\"\n");
      out.write("                                                                style=\"visibility: hidden;\"\n");
      out.write("                                                            />\n");
      out.write("                                                            <input\n");
      out.write("                                                                    type=\"submit\"\n");
      out.write("                                                                    id=\"button\"\n");
      out.write("                                                                    class=\"btn btn-primary btn-md text-center m-b-20\"\n");
      out.write("                                                                    name=\"submit\"\n");
      out.write("                                                                    value=\"+ Add new PO\"\n");
      out.write("                                                            />\n");
      out.write("                                                    </div>\n");
      out.write("                                                </form>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"col-sm-1\"></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!-- INSERT INTO EXAMPLE VALUES (12345); -->\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
