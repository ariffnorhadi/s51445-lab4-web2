<%-- 
    Document   : membershipRegistration
    Created on : Mar 24, 2020, 10:40:19 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Task 1: Calling class from JSP</title>
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

        </style>
    </head>

    <body>
        <div style="background-color: pink;padding: 20px;text-align: center">
            <h2>Polo Club Membership Registration</h2>
        </div>

        <div style="padding: 20px;text-align: center">Membership Registration Form<br><br>
            <fieldset>
                <form action="membershipFeedback.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="txtFirstName"></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input type="text" name="txtLastName"></td>
                            </tr>
                            <tr>
                                <td>IC Number:</td>
                                <td><input type="text" name="txtICno"></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><input type="text" name="txtEmail"></td>
                            </tr>
                            <tr>
                                <td>Membership Type:</td>

                                <td><input type="radio" id="regMem" name="type" value="1"><label for="regMem">Regular Member</label>
                                    <input type="radio" id="vipMem" name="type" value="2">
                                    <label for="vipMem">VIP Member</label></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><button type="reset">Cancel</button> <button type="submit">Submit</button> </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>

    </body>

</html>

