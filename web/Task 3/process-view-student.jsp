<%-- 
    Document   : process-view-student
    Created on : Mar 30, 2020, 2:00:21 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Students</title>
        <style>
            body {
                margin: 0;
                font-family: helvetica;
            }


            table {
                padding: 10px;
                margin-left: auto;
                margin-right: auto;
                text-align: left;
                border-collapse: collapse;
                margin-bottom: 20px;
                margin-top: 20px;
            }

            td,
            th {
                padding: 10px;
                border: 1px solid black;
            }
            th{
                text-align: center;
            }

            a {

                padding: 7px;
                background-color: lightgrey;
                border-radius: 20px;
                text-decoration: none;
                color: black;

            }
            

            button {
                border-radius: 20px;
                border: none;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 5px;
                padding-bottom: 5px;
            }

            input {
                padding: 5px;
            }

            select {
                padding: 5px;
            }


        </style>
    </head>
    <body>
        <%
            //connect to database
            Class.forName("com.mysql.jdbc.Driver");

            //establsih database connection
            String myURL = "jdbc:mysql://localhost:3306/webstudent";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

//create statement to retrieve data in database
            Statement stmt = myConnection.createStatement();
            String sqlSelect = "select * from student";

            ResultSet rs = stmt.executeQuery(sqlSelect);

        %>

        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Faculty of Ocean Engineering Technology and Informatics</h2>
        </div>
        <div style="background-color: palegreen;padding: 20px;text-align: center">
            <h3>View Students</h3>
        </div>



            <div class="">
                <table>
                    <thead>
                        <tr>
                            <td colspan="4"></td>
                            <td style="text-align: right"><a href="add-student-form.jsp">Add new student</a></td>
                        </tr>
                        <tr>
                            <th>No</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            int i = 0;

                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(i + 1);
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString(2));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString(3));
                                out.print("</td>");
                                out.print("<td>");
                                out.print(rs.getString(4));
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<a href=process-update-student.jsp?id=" + rs.getString(1) + ">Update</a> "
                                        + "<a href=process-delete-student.jsp?id=" + rs.getString(1) + ">Delete</a>");
                                out.print("</td>");
                                out.print("</tr>");

                                i++;

                            }

                        %>

                    </tbody>
                </table>
            </div>
        
        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Universiti Malaysia Terengganu</h2>
        </div>


    </body>
</html>
