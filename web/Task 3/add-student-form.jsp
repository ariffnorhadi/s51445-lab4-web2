<%-- 
    Document   : add-student-form
    Created on : Mar 29, 2020, 2:02:50 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Task 3: CRUD in JSPs | Add Student</title>
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
        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Faculty of Ocean Engineering Technology and Informatics</h2>
        </div>
        <div style="background-color: palegreen;padding: 20px;text-align: center">
            <h3>Register Student</h3>
        </div>

        <div style="padding: 20px;text-align: center">
            <fieldset>
                <form action="process_add_student.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="txtFname"></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input type="text" name="txtLname"></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="txtEmail"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><button type="reset">Cancel</button> <button type="submit">Submit</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>
        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Universiti Malaysia Terengganu</h2>
        </div>
    </body>

</html>

