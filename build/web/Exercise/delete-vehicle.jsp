<%-- 
    Document   : delete-vehicle
    Created on : Apr 23, 2020, 12:04:07 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Exercise.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body>
        <%
            String sid = request.getParameter("id");
            int vehid = Integer.parseInt(sid);
            VehicleDAO vdao = new VehicleDAO();
            Vehicle d = vdao.getVehicle(vehid);
            int result = vdao.deleteVehicle(d);
            if (result > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Vehicle is deleted');");
                out.println("location='dashboard.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Unable to delete. Please try again.');");
                out.println("location='dashboard.jsp';");
                out.println("</script>");
            }


        %>
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