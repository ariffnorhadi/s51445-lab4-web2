<%-- 
    Document   : dashboard-main
    Created on : Apr 22, 2020, 11:12:37 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Exercise.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body><%
        User customer = (User) request.getSession().getAttribute("customer");
        int custid = customer.getId();
        String cust_email = customer.getEmail();
        String cust_name = customer.getName();
        String cust_pass = customer.getPassword();
        String cust_nric = customer.getNric();

        //connect to database   
        Class.forName("com.mysql.jdbc.Driver");

        //establsih database connection
        String myURL = "jdbc:mysql://localhost:3306/insurance";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "");

        //create statement to retrieve data in database
        Statement stmt = myConnection.createStatement();
        String sqlSelectCust = "select * from customer where cust_id=" + custid;
        ResultSet rs2 = stmt.executeQuery(sqlSelectCust);
        %>

        <div class="main">
            <div class="">
                <h4>Me</h4>
                <form action="process-profile.jsp">
                    <table>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <a class="update" href="change-password-form.jsp">Change Password</a>
                            </td>
                        </tr>
                        <tbody>


                            <%                                while (rs2.next()) {
                                    out.print("<tr>");
                                    out.print("</tr>");
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print("Email");
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print("<input type=\"text\" name=\"txtemail\""
                                            + " value=\"" + cust_email + "\" >");
                                    out.print("</td>");
                                    out.print("</tr>");
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print("Name");
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print("<input type=\"text\" name=\"txtname\""
                                            + " value=\"" + cust_name + "\" >");
                                    out.print("</td>");
                                    out.print("</tr>");
                                    out.print("<tr>");
                                    out.print("<th>");
                                    out.print("NRIC");
                                    out.print("</th>");
                                    out.print("<td>");
                                    out.print("<input type=\"text\" name=\"txtnric\""
                                            + " value=\"" + cust_nric + "\" >");
                                    out.print("</td>");
                                    out.print("</tr>");

                                }

                            %>

                            <tr>
                                <th colspan="2" style="text-align: center">
                                    <button class='delete' name="operation" value="delete">Delete</button> 
                                    <button type="submit" name="operation" value="update">Update</button></th>

                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" value="<%=custid%>" name="txtid"/>
                    <input type="hidden" value="<%=cust_pass%>" name="txtpassword"/>
                </form>

            </div>
            <div class="">
                <h4>My Vehicle(s)</h4>
                <form action="process-vehicle.jsp">

                    <%

                        String sqlExists = "SELECT COUNT(1) FROM vehicle WHERE cust_id=" + custid;
                        ResultSet rsExist = stmt.executeQuery(sqlExists);
                        int record = 0;
                        if (rsExist.next()) {
                            record = rsExist.getInt(1);
                        }

                        if (record == 0) {
                            out.print("<p>You have no registered vehicle yet</p>");
                            out.print("<a class='update' href='add-vehicle.jsp'>Register My Vehicles</a>");

                        } else {
                            out.print("<tbody>");
                            out.print("<table>");
                            out.print("<thead style='text-align: center'>");
                            out.print("<tr>");
                            out.print("<th>No</th>");
                            out.print("<th>Plate</th>");
                            out.print("<th>Type</th>");
                            out.print("<th>Brand</th>");
                            out.print("<th>Marketprice (MYR)</th>");
                            out.print("<th>Actions <a class='update' href=add-vehicle.jsp>Add</a></th>");
                            out.print("</tr>");
                            out.print("</thead>");
                            out.print("<tbody>");

                        }
                        String sqlSelectVeh = "select * from vehicle where cust_id=" + custid;
                        ResultSet rs = stmt.executeQuery(sqlSelectVeh);
                        int i = 0;
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>");
                            out.print(i + 1);
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString(2));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString(3));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getString(4));
                            out.print("</td>");
                            out.print("<td>");
                            out.print(rs.getDouble(5));
                            out.print("</td>");
                            out.print("<td>");
                            out.print("<a class='update' href=update-vehicle.jsp?id=" + rs.getInt(1) + ">Update</a> ");
                            out.print("<button onclick='delete()' class='delete' name='operation' value='delete' id=" + rs.getString(1) + ">Delete</delete> ");
                            out.print("</td>");
                            out.print("</tr>");
                            i++;
                        }

                        out.print("</tbody>");
                        out.print("</table");

                    %>
                    <input type="hidden" value="<%=custid%>" name="custid"/>  
                </form>


                <script type="text/javascript">
                    function delete() {
                    if (confirm('Are you sure you want to do this?')) {
                    yourformelement.submit();
                    } else {
                    return false;
                    }
                    }
                    }

                </script>

            </div>
            <div class="">
                <h4>Insurance Quotation</h4>
                <form action="getInsuraneQuotation.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <th>Vehicle</th>
                                <td>
                                    <%

                                        VehicleDAO vdao = new VehicleDAO();

                                        List<Vehicle> vlist = vdao.getAllVehiclesbyCustID(custid);

                                        boolean notExist = vlist.isEmpty();

                                        if (notExist) {
                                            out.print("<select name='vehid'>");
                                            out.print("<option value='0'>");
                                            out.print("No registered vehicle");
                                            out.print("</option>");
                                            out.print("</select>");

                                        } else {
                                            out.print("<select name='vehid'>");
                                            for (int ix = 0; ix < vlist.size(); ix++) {
                                                out.print("<option value=" + vlist.get(ix).getId() + ">");
                                                out.print(vlist.get(ix).getPlate());
                                                out.print("</option>");
                                            }
                                            out.print("</select>");
                                        }


                                    %>
                                </td>
                            </tr>
                            <tr>
                                <th>Type</th>
                                <td><select name="type">
                                        <option value="1">Comprehensive</option>
                                        <option value="2">Third Party</option>

                                    </select></td>
                            </tr>
                            <tr>
                                <th>No Claim Discount (NCD)</th>
                                <td><select name="ncd">
                                        <option value="55">55%</option>
                                        <option value="35">35%</option>
                                        <option value="25">25%</option>
                                        <option value="10">10%</option>
                                    </select></td>
                            </tr>

                            <tr>
                                <td style="text-align: center" colspan="2">
                                    <button type="submit">Get Insurance Quotation</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->