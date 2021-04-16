<%-- 
    Document   : change-password-form
    Created on : Apr 19, 2020, 10:23:54 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <%@include file="insurance_css.jsp" %>
    </head>
    <body>
        <h1 style="text-align: center">Hello, Home! Stay at Home. Stay Safe</h1>
        <div class="navbar">
            <a href="dashboard.jsp">Home</a>
        </div>
        <form action="process-password.jsp">
            <table>
                <tr>
                    <td>Current password</td>
                    <td><input name="currentpass" type="password"/> </td>
                </tr>
                <tr>
                    <td>New password</td>
                    <td><input name="newpass" type="password"/> </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <button type="reset">Reset</button> <button type="submit">Save</button>
                    </td>
                </tr>

            </table>

        </form>
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