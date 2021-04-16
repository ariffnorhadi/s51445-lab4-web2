<%-- 
    Document   : process-password
    Created on : Apr 19, 2020, 10:51:28 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.User"%>
<%@page import="lab4.Exercise.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            User e = (User) request.getSession().getAttribute("customer");
            int id = e.getId();
            String email = e.getEmail();
            String dbPass = e.getPassword();
            String name = e.getName();
            String nric = e.getNric();

            String inputCurrentPass = request.getParameter("currentpass");
            String newpass = request.getParameter("newpass");

            if (inputCurrentPass.isEmpty() || newpass.isEmpty()) {
                out.print("<script>");
                out.print("alert(\"Please fill in all details\")");
                out.print("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("change-password-form.jsp");
                rd.include(request, response);
            } else if (!inputCurrentPass.equals(dbPass)) {
                out.print("<script>");
                out.print("alert(\"Current password is incorrect\")");
                out.print("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("change-password-form.jsp");
                rd.include(request, response);
            } else {
                dbPass = newpass;

                User eNew = new User(email, dbPass, name, nric, id);
                UserDAO dao = new UserDAO();

                int result = dao.updatePass(eNew);
                if (result > 0) {
                    out.print("<script>");
                    out.print("alert(\"Password is changed succesfully\")");
                    out.print("</script>");
                    session.setAttribute("customer", eNew);
                    RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                    rd.include(request, response);

                } else {
                    out.print("<script>");
                    out.print("alert(\"Change password unsuccessful. Please try again.\")");
                    out.print("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                    rd.include(request, response);
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