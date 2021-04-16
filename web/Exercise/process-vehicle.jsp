<%-- 
    Document   : process-vehicle
    Created on : Apr 20, 2020, 9:18:53 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body>

        <%

            String option = request.getParameter("operation");
            VehicleDAO vdao = new VehicleDAO();
            User e = (User) request.getSession().getAttribute("customer");
            int cust_id = e.getId();
            out.print("Customer ID : " + cust_id);//this is correct. this print current id of current user. tested already
            //Step 1: Get required information
            int result;

            switch (option) {
                case "add":
                    String plate = request.getParameter("plate");
                    String type = request.getParameter("type");
                    String brand = request.getParameter("brand");
                    String smarketprice = request.getParameter("marketPrice");
                    double marketPrice = Double.parseDouble(smarketprice);

                    Vehicle a = new Vehicle(cust_id, marketPrice, plate, type, brand);
                    result = vdao.addVehicle(a);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Registration is successful');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");

                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Registration Unsuccessful');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    }
                    break;

                case "update":

                    String vid = request.getParameter("vehid");
                    int vehid = Integer.parseInt(vid);
                    String Uplate = request.getParameter("plate");
                    String Utype = request.getParameter("type");
                    String Ubrand = request.getParameter("brand");
                    String dprice = request.getParameter("marketPrice");
                    double price = Double.parseDouble(dprice);

                    Vehicle u = new Vehicle(vehid, cust_id, Uplate, Utype, Ubrand, price);

                    result = vdao.updateVehicle(u);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Updated Succesfully');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");

                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to update. Please try again');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    }
                    break;

                case "delete":
                    String sDelVid = request.getParameter("id");
                    int Delvehid = Integer.parseInt(sDelVid);
                    Vehicle d = vdao.getVehicle(Delvehid);
                    result = vdao.deleteVehicle(d);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Deleted Succesfully');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Fail to delete. Please try again.');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    }

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