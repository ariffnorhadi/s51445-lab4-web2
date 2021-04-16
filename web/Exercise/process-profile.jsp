<%-- 
    Document   : process-profile
    Created on : Apr 12, 2020, 9:47:46 PM
    Author     : ariff
--%>

<%@page import="lab4.Exercise.UserDAO"%>
<%@page import="lab4.Exercise.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%

            String option = request.getParameter("operation");
            String sid = request.getParameter("txtid");
            int id = Integer.parseInt(sid);
            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String nric = request.getParameter("txtnric");
            String password = request.getParameter("txtpassword");

//prepare data
            User user = new User(email, password, name, nric, id);
            UserDAO userdao = new UserDAO();

            int result;
            switch (option) {
                case "update":
                    result = userdao.update(user);

                    if (result > 0) {
//                        out.print(result);
//                        out.println("<script>");
//                        out.println("alert(\"Profile has been updated!!\");");
//                        out.println("</script>");
//                        session.setAttribute("customer", user);
//                        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
//                        rd.include(request, response);
                        // response.sendRedirect(request.getContextPath() + "/Exercise/process/dashboard.jsp");

                        session.setAttribute("customer", user);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Profile has been updated');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");

                    } else {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to update profile. Please try again.');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    }
                    break;
                case "delete":
                    response.sendRedirect("delete-profile.jsp");
                    break;
                case "confirmDelete":
                    result = userdao.deleteProfile(user);
                    if (result > 0) {
                        session = request.getSession();
                        session.invalidate();
                        //response.sendRedirect("homepage.jsp");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your profile has been permanently deleted. You will be redirected to our homepage.');");
                        out.println("location='homepage.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to delete profile. Please try again.');");
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