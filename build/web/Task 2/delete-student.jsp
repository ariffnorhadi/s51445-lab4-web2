<%-- 
    Document   : add-new-student
    Created on : Mar 24, 2020, 12:36:24 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="lab4.Task2.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Delete</title>
        <style>
            body {
                margin: 0;
                font-family: helvetica;
            }

            div {
                border: 1px solid black;
            }

            table {
                padding: 10px;
                margin-left: auto;
                margin-right: auto;
                text-align: left;
            }

            td {
                padding: 10px;
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
        <div style="background-color: pink;padding: 20px;text-align: center">
            <h2>Student's Registration Form</h2>
        </div>
        <%
            ArrayList<student> students = (ArrayList<student>) session.getAttribute("pelajar");
            session.setAttribute("pelajar", students);
            int id = Integer.parseInt(request.getParameter("id"));
        %>

        <div style="padding: 20px;text-align: center">Registration Form<br><br>
            <fieldset>
                <form action="list-student.jsp">
                    <table>
                        <tbody>

                            <tr>
                                <td>Name:</td>
                                <td><%=students.get(id).getName()%></td>
                            </tr>
                            <tr>
                                <td>Matrics No:</td>
                                <td><%=students.get(id).getMatrics()%></td>
                            </tr>
                            <tr>
                                <td>Bachelor Programe:</td>
                                <td><%= students.get(id).getProgramme()%></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><button type="submit">Cancel</button> <button type="submit"value="Delete" name="command">Delete</button> </td>
                        <input type="hidden" name="id" value="<%=id%>">
                        </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>

    </body>

</html>

