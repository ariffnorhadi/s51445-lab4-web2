<%-- 
    Document   : process-update-student-2
    Created on : Mar 30, 2020, 11:12:40 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
            int id = Integer.parseInt(request.getParameter("hidid"));

            //Step 1: Get required information
            String fName = request.getParameter("updateFname");
            String lName = request.getParameter("updateLname");
            String email = request.getParameter("updateEmail");

//Step 2: Load JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

//Step 3: Establish the database connection
            String myURL = "jdbc:mysql://localhost:3306/webstudent";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

//Step 4: Execute and manipulate query
            String mySQLquery = "update student set first_name=?,last_name=?,email=? where id=?";
            PreparedStatement ps = myConnection.prepareStatement(mySQLquery);

//set value
            ps.setString(1, fName);
            ps.setString(2, lName);
            ps.setString(3, email);
            ps.setInt(4, id);

            if (ps.executeUpdate() != 0) {

                request.getRequestDispatcher("process-view-student.jsp").include(request, response);
            } else {
                out.print("fail");
            }

            myConnection.close();


        %>

        <<!--  <form action="process-view-student.jsp">
              
               <table>
                   <tbody>
                       <tr>
                           <td>First Name</td>
                           <td><input type="text" name="updateFname" value="<%=fName%>"/></td>
                       </tr>
                       <tr>
                           <td>Last Name</td>
                           <td><input type="text" name="updateLname" value="<%=lName%>"/></td></tr>
                       <tr>
                           <td>Email</td>
                           <td><input type="text" name="updateEmail" value="<%=email%>"/></td>
                       </tr>
                   </tbody>
                   <tr>
                       <td colspan="2" style="text-align: center"><button type="submit" >Update</button></td>
   
                   </tr>
               </table>
   
           </form> -->

       

    </body>

</html>
