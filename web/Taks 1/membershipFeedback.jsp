<%-- 
    Document   : membershipRegistration
    Created on : Mar 24, 2020, 10:40:19 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab4.Task1.Membership" %>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Task 1</title>
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
            <h2>Membership is processing</h2>

            <%!
                Membership m1 = new Membership();


            %>
            <% String fName = request.getParameter("txtFirstName");
                String lName = request.getParameter("txtLastName");
                String icno = request.getParameter("txtICno");
                String email = request.getParameter("txtEmail");
                String stype = request.getParameter("type");
                int type = Integer.parseInt(stype);
                m1.setFname(fName);
                m1.setLname(lName);
                m1.setIcno(icno);
                m1.setEmail(email);
                m1.setType(type);

            %>
        </div>

        <div style="padding: 20px;text-align: center">Registration Successful. Below is your details<br><br>
            <fieldset>
                <form action="membershipRegistration.jsp">
                    <table>
                        <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><%=m1.getFname()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><%=m1.getLname() %></td>
                            </tr>
                            <tr>
                                <td>IC Number:</td>
                                <td><%=m1.getIcno() %></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><%=m1.getEmail() %></td>
                            </tr>
                            <tr>
                                <td>Membership Type:</td>

                                <td>
                                    <%= m1.getMemberType() %></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><button type="submit">Back to Registration Form</button> </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </fieldset>
        </div>

    </body>

</html>

