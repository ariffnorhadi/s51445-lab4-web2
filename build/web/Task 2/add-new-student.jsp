<%-- 
    Document   : add-new-student
    Created on : Mar 24, 2020, 12:36:24 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Task2.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Task 2: Sharing data between JSPs | Add Student</title>
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
            ArrayList<student> students = new ArrayList<>();
            students.add(new student("Abdullah Hafiz", "S11111", "1"));
            students.add(new student("Luqmanul Haqim", "S11112", "1"));
            students.add(new student("Fatimah Azzahra", "S11113", "1"));
            students.add(new student("Siti Aisyah Humayraa", "S11114", "2"));
            students.add(new student("Abdurrahman Auf", "S11115", "2"));
            students.add(new student("Auni Nasuha", "S11116", "2"));
            students.add(new student("Auni Aleesya", "S11117", "3"));
            students.add(new student("Amin Eusoff", "S11118", "3"));
            students.add(new student("Ammar Adam", "S11119", "3"));
            students.add(new student("Siti Hajar Aminah", "S11120", "2"));

            session.setAttribute("pelajar", students);

        %>

        <div style="padding: 20px;text-align: center">Registration Form<br><br>
            <fieldset>
                <form action="list-student.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <td>Name:</td>
                                <td><input type="text" name="txtName"></td>
                            </tr>
                            <tr>
                                <td>Matrics No:</td>
                                <td><input type="text" name="txtMatricsNo"></td>
                            </tr>
                            <tr>
                                <td>Bachelor Programe:</td>
                                <td><select name="programme">
                                        <option value="1">BSc Computer Science</option>
                                        <option value="2">BSc Medical</option>
                                        <option value="3">BSc Mathematics</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><button type="reset">Cancel</button> <button type="submit">Submit</button><br>
                                    <input type="hidden" value="Add" name="command"> </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>

    </body>

</html>

