<%-- 
    Document   : add-vehicle
    Created on : Apr 1, 2020, 4:29:24 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
    <%
        User e = (User) request.getSession().getAttribute("customer");
        int custid = e.getId();

    %>

    <head>
        <meta charset="UTF-8">
        <title>Lab 4: Exercise | Register Vehicle</title>
        <%@include file="insurance_css.jsp" %>
    </head>

    <body>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>Insurance Management System &#64;2020</h2>
        </div>
        <div style="background-color: skyblue;padding: 20px;text-align: center">
            <h3>My Vehicle Registration Form</h3>
        </div>
        <div class="navbar">
            <a href="dashboard.jsp">Home</a>
        </div>

        <div style="padding: 20px;text-align: center">
            <fieldset>
                <form action="process-vehicle.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <td colspan="2" style="text-align: left"> <a href="dashboard.jsp">Back</a></td>
                            </tr>
                            <tr>
                                <td>Plat Number:</td>
                                <td><input type="text" name="plate"></td>
                            </tr>
                            <tr>
                                <td>Type:</td>
                                <td style="text-align: left"><input id="car" type="radio" name="type" value="Car">
                                    <label for="car">Car</label><br /><br />
                                    <input id="motor" type="radio" name="type" value="Motorcycle">
                                    <label for="motor">Motorcycle</label></td>
                            </tr>
                            <tr>
                                <td>Brand:</td>
                                <td>
                                    <select name="brand">
                                        <option value="Proton">Proton</option>
                                        <option value="Perodua">Perodua</option>
                                        <option value="Lexus">Lexus</option>
                                        <option value="Mercedes">Mercedes</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Marketprice (MYR):</td>
                                <td><input type="text" name="marketPrice"></td>
                            </tr>


                            <tr>
                        <input type="hidden" name="custid" value="<%=custid%>"/>
                        <td colspan="2" style="text-align: center"><button type="reset">Reset</button> <button  name="operation" value="add" type="submit">Register</button> </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
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