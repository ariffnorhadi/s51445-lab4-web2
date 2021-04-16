<%-- 
    Document   : process-logout
    Created on : Apr 19, 2020, 2:55:24 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        session = request.getSession();
        session.invalidate();

        out.print("<script>");
        out.print("alert(\"Log Out Successfull\")");
        out.print("</script>");

        RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
        rd.include(request, response);


    %>
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