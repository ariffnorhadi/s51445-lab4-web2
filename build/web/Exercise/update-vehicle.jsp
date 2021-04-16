<%-- 
    Document   : update-vehicle
    Created on : Apr 1, 2020, 4:38:50 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Lab 4: Exercise | Register Vehicle</title>
        <%@include file="insurance_css.jsp" %>
    </head>

    <body>

        <%

            String sid = request.getParameter("id");
            int vid = Integer.parseInt(sid);
            Vehicle u = new Vehicle(vid);
            VehicleDAO vdao = new VehicleDAO();
            u = vdao.getVehicle(vid);

        %>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>Insurance Management System &#64;2020</h2>
        </div>
        <div style="background-color: skyblue;padding: 20px;text-align: center">
            <h3>My Vehicle Registration Form</h3>
        </div>
        <div class="navbar">
            <a href="dashboard.jsp">Home</a>
        </div>

        <div class='main' style="padding: 20px;text-align: center">

            <form action="process-vehicle.jsp">
                <table>
                    <tbody>
                        <tr>
                            <td colspan="2" style="text-align: left"> <a href="dashboard.jsp">Back</a></td>
                        </tr>
                        <tr>
                            <td>Plat Number:</td>
                            <td><input type="text" name="plate" value="<%=u.getPlate()%>"></td>
                        </tr>
                        <tr>
                            <td>Type:</td>
                            <td style="text-align: left">
                                <%

                                    String value = u.getType();
                                    if (value.equals("Car")) {
                                        out.print("<input id='car' type='radio' name='type' value='Car' checked='checked'>");
                                        out.print("<label for='car'>Car</label><br /><br />");
                                        out.print("<input id='motor' type='radio' name='type' value='Motorcycle'>");
                                        out.print("<label for='motor'>Motorcycle</label></td>");
                                    } else {
                                        out.print("<input id='car' type='radio' name='type' value='Car'>");
                                        out.print("<label for='car'>Car</label><br /><br />");
                                        out.print("<input id='motor' type='radio' name='type' value='Motorcycle' checked='checked'>");
                                        out.print("<label for='motor'>Motorcycle</label></td>");
                                    }


                                %>
                            </td>
                        </tr>
                        <tr>
                            <td>Brand:</td>
                            <td>
                                <select name="brand">
                                    <option value="Proton" <%=((u.getBrand().equalsIgnoreCase("Proton")) ? "selected" : "")%>>Proton</option>
                                    <option value="Perodua" <%=((u.getBrand().equalsIgnoreCase("Perodua")) ? "selected" : "")%>>Perodua</option>
                                    <option value="Lexus" <%=((u.getBrand().equalsIgnoreCase("Lexus")) ? "selected" : "")%>>Lexus</option>
                                    <option value="Mercedes" <%=((u.getBrand().equalsIgnoreCase("Mercedes")) ? "selected" : "")%>>Mercedes</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Marketprice (MYR):</td>
                            <td><input type="text" name="marketPrice" value="<%=u.getPrice()%>"></td>
                        </tr>


                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input type="hidden" name="vehid" value="<%=u.getId()%>"/>
                                <button type="reset">Cancel</button> 
                                <button name="operation" value="update" type="submit">Save</button></td>

                        </tr>
                    </tbody>
                </table>
            </form>

        </div>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>&copy;Universiti Malaysia Terengganu</h2>
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