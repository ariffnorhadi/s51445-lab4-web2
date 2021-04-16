<%-- 
    Document   : delete-profile
    Created on : Apr 22, 2020, 3:07:03 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Exercise.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard | Insurance</title>
        <%@include file="insurance_css.jsp" %>
    </head>
    <%

        User e = (User) request.getSession().getAttribute("customer");
        String email = e.getEmail();
        String name = e.getName();
        String nric = e.getNric();

        //connect to database
        Class.forName("com.mysql.jdbc.Driver");

        //establsih database connection
        String myURL = "jdbc:mysql://localhost:3306/insurance";
        Connection myConnection = DriverManager.getConnection(myURL, "root", "");


    %>

    <body>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>Insurance Management System &#64;2020</h2>
        </div>

        <div style="background-color:skyblue;padding: 20px;text-align: center;font-weight: bolder">
            <h3>Welcome back, </h3>
        </div>
        <div class="navbar">
            <a href="dashboard.jsp">Home</a>
            <a href="process-logout.jsp">Log Out</a>
        </div>

        <div class="main">
            <form action="process-profile.jsp" style="text-align: center">

                <div class="">

                    <table>
                        <h4>My Profile</h4>
                        <tr>
                            <td colspan="6" style="text-align: center">
                                <%=name%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: center">
                                <%= email%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="text-align: center">
                                <%= nric%>
                            </td>
                        </tr>
                        <%

                            Statement stmt = myConnection.createStatement();
                            String sqlExists = "SELECT COUNT(1) FROM vehicle WHERE cust_id=" + e.getId();
                            ResultSet rsExist = stmt.executeQuery(sqlExists);
                            int record = 0;
                            if (rsExist.next()) {
                                record = rsExist.getInt(1);
                            }

                            if (record == 0) {
                                out.print("<p>You have no registered vehicle at the moment.</p>");

                            } else {
                                out.print("<tr>");
                                out.print("<th>No</th>");
                                out.print("<th>Plate</th>");
                                out.print("<th>Type</th>");
                                out.print("<th>Brand</th>");
                                out.print("<th>Marketprice (MYR)</th>");
                                out.print("</tr>");

                            }
                            String sqlSelectVeh = "select * from vehicle where cust_id=" + e.getId();
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
                                out.print(rs.getString(5));
                                out.print("</td>");
                                out.print("</tr>");
                                i++;
                            }

                            out.print("</tbody>");


                        %>
                    </table>
                    <!--      <input type="hidden" value="" name="txtid" />
                          <input type="hidden" value="" name="txtpassword" /> -->

                    <br><br>
                    <input type="hidden" name="txtid" value="<%=e.getId()%>"/>
                    <input type="hidden" name="txtemail" value="<%=email%>"/>
                    <input type="hidden" name="txtname" value="<%=name%>"/>
                    <input type="hidden" name="txtnric" value="<%=nric%>"/>
                    <input type="hidden" name="txtpassword" value="<%=e.getPassword()%>"/>
                    <button onclick="return confirm('Again, are you sure you want to do this?')" name="operation" value="confirmDelete" style="width: 100%" class="delete">Yes, I want to delete everything now.</button>
                </div>


            </form>

        </div>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>&copy; Universiti Malaysia Terengganu</h2>
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

