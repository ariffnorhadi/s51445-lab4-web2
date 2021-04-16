<%-- 
    Document   : process-reg-login
    Created on : Apr 20, 2020, 6:32:46 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body>

        <%
            //Load Driver            
            Class.forName("com.mysql.jdbc.Driver");

            //Establish connection to database
            String myURL = "jdbc:mysql://localhost:3306/insurance";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

            String option = request.getParameter("operation");
            switch (option) {

                case "register":

                    //Registration Process
                    //Get required information
                    String email = request.getParameter("txtEmail");
                    String password = request.getParameter("txtPass");

                    //String passwordRpt = request.getParameter("txtPassRpt");
                    String name = request.getParameter("txtName");
                    String nric = request.getParameter("txtNric");
                    User u1 = new User(email, password, name, nric);
                    //            u1.setEmail(email);
                    //            u1.setPassword(password);
                    //            u1.setName(name);
                    //            u1.setNric(nric);

                    //Set query
                    String sqlInsert = "insert into customer (cust_email,cust_password,cust_name,cust_ic) values"
                            + "(?,?,?,?)  ";
                    PreparedStatement pstmt = myConnection.prepareStatement(sqlInsert);

                    //Set value
                    pstmt.setString(1, u1.getEmail());
                    pstmt.setString(2, u1.getPassword());
                    pstmt.setString(3, u1.getName());
                    pstmt.setString(4, u1.getNric());

                    //to check if username/email is already used
                    Statement stmt = myConnection.createStatement();
                    String sqlSelect = "select * from customer";
                    ResultSet rs = stmt.executeQuery(sqlSelect);
                    String dbEmail = "";

                    while (rs.next()) {
                        if (email.equals(rs.getString(2))) {
                            dbEmail = "used";
                            continue;
                        }

                    }
                    // out.print(dbEmail);

                    if (email.isEmpty() || password.isEmpty() || name.isEmpty() || nric.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details');");
                        out.println("location='homepage.jsp';");
                        out.println("</script>");
                    } else if (dbEmail.equals("used")) {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Email is already used');");
                        out.println("location='homepage.jsp';");
                        out.println("</script>");

                    } else {
                        if (!pstmt.execute()) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Registration Successful');");
                            out.println("location='homepage.jsp';");
                            out.println("</script>");
                        } else {
//                    out.print("<script>alert(\"Registration Unsuccessful\")</script>");
//                    RequestDispatcher req = request.getRequestDispatcher("homepage.jsp");
//                    req.include(request, response);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Registration Unsuccessful');");
                            out.println("location='homepage.jsp';");
                            out.println("</script>");
                        }
                    }
                    break;
                case "login":

                    //Get required information
                    //Log in Process
                    String logEmail = request.getParameter("txtLogEmail");
                    String logPass = request.getParameter("txtLogPass");
                    String sqlSelectCust = "select * from customer where cust_email=? and "
                            + "cust_password=?";
                    pstmt = myConnection.prepareStatement(sqlSelectCust);
                    pstmt.setString(1, logEmail);
                    pstmt.setString(2, logPass);

                    rs = pstmt.executeQuery();

                    if (logEmail.isEmpty() || logPass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details');");
                        out.println("location='homepage.jsp';");
                        out.println("</script>");
                    } else if (rs.next()) {
                        int id = rs.getInt(1);
                        String cust_email = rs.getString(2);
                        String cust_password = rs.getString(3);
                        String cust_name = rs.getString(4);
                        String cust_ic = rs.getString(5);

                        User user = new User(cust_email, cust_password, cust_name, cust_ic, id);
                        request.getSession().setAttribute("customer", user);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Welcome');");
                        out.println("location='dashboard.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Email or password is incorrect');");
                        out.println("location='homepage.jsp';");
                        out.println("</script>");
                    }

                    break;

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