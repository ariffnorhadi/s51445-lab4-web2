<%-- 
    Document   : process-update-student
    Created on : Mar 30, 2020, 5:52:16 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>


<%@page import="java.sql.*"%>
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
            table {
                border-collapse: collapse;
                padding: 10px;
                text-align: center;
                margin-left: auto;
                margin-right: auto;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            td,
            th {
                border: 1px solid;
                padding: 7px;
            }

        </style>
    </head>

    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));

            //Step 1: Get required information
            String fName = "";
            String lName = "";
            String email = "";

//Step 2: Load JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

//Step 3: Establish the database connection
            String myURL = "jdbc:mysql://localhost:3306/webstudent";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

//Step 4: Execute and manipulate query
            Statement stmt = myConnection.createStatement();
            String mySQLquery = "select * from student where id=" + id;
            ResultSet rs = stmt.executeQuery(mySQLquery);

//popoulate through the index and set the value into the slected variblabl
            while (rs.next()) {
                fName = rs.getString(2);
                lName = rs.getString(3);
                email = rs.getString(4);
            }
//close connection

            myConnection.close();


        %>

        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Faculty of Ocean Engineering Technology and Informatics</h2>
        </div>
        <div style="background-color: palegreen;padding: 20px;text-align: center">
            <h3>Updating Students</h3>
        </div>
        <form action="process-update-student-2.jsp">
            <input type="hidden" name="hidid" value="<%=id%>"/>
            <table>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="updateFname" value="<%=fName %>"/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="updateLname" value="<%=lName %>"/></td></tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="updateEmail" value="<%=email %>"/></td>
                    </tr>
                </tbody>
                <tr>
                    <td colspan="2" style="text-align: center"><button type="submit" >Update</button></td>

                </tr>
            </table>

        </form>

        <div style="background-color: greenyellow;padding: 20px;text-align: center">
            <h2>Universiti Malaysia Terengganu</h2>
        </div>

    </body>

</html>