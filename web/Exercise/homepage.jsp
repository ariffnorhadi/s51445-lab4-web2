<%-- 
    Document   : homepage
    Created on : Mar 30, 2020, 2:54:27 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insurance | Homepage</title>
        <%@include file="insurance_css.jsp" %>
    </head>

    <body>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2> Insurance Management System &#64;
                2020</h2>
        </div>
        <div style="background-color:skyblue;padding: 20px;text-align: center;font-weight: bolder">
            <h3> My Form Registration</h3>
        </div>
        <div class="row">
            <div class="">
                <form action="process-reg-login.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <th> Email</th>
                                <td> <input type="text" name="txtEmail" placeholder="example@mail.com" /> </td>
                            </tr>
                            <tr>
                                <th> Password</th>
                                <td> <input type="password" name="txtPass" /> </td>
                            </tr>

                            <tr>
                                <th>Name</th>
                                <td> <input type="text" name="txtName" /> </td>
                            </tr>
                            <tr>
                                <th>NRIC</th>
                                <td> <input type="text" name="txtNric" placeholder="981124015783" /> </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="2"> <button name="operation" value="register" type="submit" style="font-size: 15px"> Register Now</button> </td>
                            </tr>

                        </tbody>
                    </table>
                </form>
            </div>
            <div class="login">
                <form action="process-reg-login.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <th> Email</th>
                                <td> <input type="text" name="txtLogEmail" placeholder="example@mail.com" autofocus="" /> </td>
                            </tr>
                            <tr>
                                <th> Password</th>
                                <td> <input type="password" name="txtLogPass" /> </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="2"> <button name="operation" value="login" type="submit">Log In</button> </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2> &copy;
                Universiti Malaysia Terengganu</h2>
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
