<%-- 
    Document   : list-student
    Created on : Mar 24, 2020, 12:40:18 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Task2.student" %>
<%@page import="java.util.*" %>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>View</title>
        <style>
            body {
                font-family: helvetica;
            }
            a{

                padding: 7px;
                background-color:lightgrey;
                border-radius: 20px;
                text-decoration: none;
                color: black;

            }

            table {
                text-align: center;
                border-collapse: collapse;
                margin-left: auto;
                margin-right: auto;
                margin-top: 20px;
            }

            td,
            th {
                padding: 10px;
                border: 2px solid;
            }

            button {
                padding-left: 15px;
                padding-right: 15px;
                padding-bottom: 5px;
                padding-top: 5px;
                border: none;
                border-radius: 10px
            }

            .navbar {
                margin: 5px;
                text-align: center;
            }

        </style>
    </head>

    <body>
        <div class="navbar"><button>Home</button>
        </div>

        <%
            ArrayList<student> students = (ArrayList<student>) session.getAttribute("pelajar");
            String command = request.getParameter("command");
            //out.print("Command is: " + command);
            if (command.equalsIgnoreCase("Add")) {
                students.add(new student(request.getParameter("txtName"), request.getParameter("txtMatricsNo"),
                        request.getParameter("programme")));
            } else if (command.equalsIgnoreCase("Update")) {
                session.getAttribute("pelajar");
                int id = Integer.parseInt(request.getParameter("id"));
                students.get(id).setName(request.getParameter("updatename"));
                students.get(id).setMatrics(request.getParameter("updatematrics"));
                students.get(id).setProgramme(request.getParameter("updateProgramme"));

            }
            else if(command.equalsIgnoreCase("Delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                students.remove(id);
            }

        %>

        <%!

        %>

        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Matrics</th>
                    <th>Programs</th>
                    <th colspan="2">Action(s)</th>
                </tr>
            </thead>
            <tbody>
                <%                        
                    for (int idx = 0; idx < students.size(); idx++) {

                        out.print("<tr>");
                        out.print("<td>");
                        out.print(idx + 1);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(students.get(idx).getName());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(students.get(idx).getMatrics());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(students.get(idx).programType());
                        out.print("</td>");
                        out.println("<td><a href=update-student.jsp?id="
                                + idx + ">Update</a>"
                                + "|" + "<a href=delete-student.jsp?id="
                                + idx + " onclick=\"return confirm"
                                + "('Are you sure you want to delete?')\">Delete</a>"
                                + "</td></tr>");
                        out.print("</tr>");

                    }
                    session.setAttribute("pelajar", students);
                %>


            </tbody>
        </table>





    </body>

</html>
