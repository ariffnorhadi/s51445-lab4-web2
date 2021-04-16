<%-- 
    Document   : dashboard-header
    Created on : Apr 22, 2020, 11:04:01 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Exercise.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body>
        <%
            User customer = (User) request.getSession().getAttribute("customer");
            int custid = customer.getId();
            String cust_name = customer.getName();

        %>

        <div style="background-color:slateblue;padding: 20px;text-align: center">
            <h2>Insurance Management System &#64;2020</h2>
        </div>

        <div style="background-color:skyblue;padding: 20px;text-align: center;">
            <h3>Welcome back, <%=cust_name%></h3>
        </div>
        <div class="navbar">
            <a href="dashboard.jsp">Home</a>
            <a href="process-logout.jsp">Log Out</a>
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