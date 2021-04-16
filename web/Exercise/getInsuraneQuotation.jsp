<%-- 
    Document   : getInsuraneQuotation
    Created on : Apr 21, 2020, 10:20:41 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="lab4.Exercise.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
        <jsp:include page="insurance_css.jsp"/>
    </head>
    <body style="text-align: center" >
        <jsp:include page="dashboard-header.jsp"/>
        <jsp:include page="dashboard-main.jsp"/>
        <div class="quotation">

            <%

                out.print("For educational purpose only");
                out.print("<br>");

                String sVehID = request.getParameter("vehid");
                int qVehID = Integer.parseInt(sVehID);
                String qType = request.getParameter("type");
                String qNcd = request.getParameter("ncd");

                if (qVehID == 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please register a vehicle');");
                    out.println("location='dashboard.jsp';");
                    out.println("</script>");
                }
                out.print("Vehicle ID: " + qVehID);
                Vehicle q = new Vehicle(qVehID);
                VehicleDAO vdao = new VehicleDAO();

//            Connection connection = MySQL.getConnection();
//            Statement stmt = connection.createStatement();
//            String sqlSelect = "select * from vehicle where veh_id=" + qVehID;
//            ResultSet rs = stmt.executeQuery(sqlSelect);
//            if (rs.next()) {
//                q.setPlate(rs.getString(2));
//                q.setType(rs.getString(3));
//                q.setBrand(rs.getString(4));
//                q.setPrice(rs.getDouble(5));
//                q.setCust_id(rs.getInt(6));
//
//            }
                q = vdao.getVehicle(qVehID);

                out.print("<br>");
                out.print(q.getPlate());

                InsuranceQuotation insQuo = new InsuranceQuotation(qVehID, qType, qNcd);
                InsuranceQuotationDAO qDao = new InsuranceQuotationDAO();

            %>
            <h4 style="text-align: center">Hello, Home! Stay at Home. Stay Safe</h4>

            <table>
                <tbody>
                    <tr>
                        <th>Plat Number</th>
                        <td><%=q.getPlate()%></td>
                    </tr>
                    <tr>
                        <th>Coverage</th>
                        <td>
                            <%
                                String type = insQuo.getType();
                                if (type.equals("1")) {
                                    out.print("Comprehensive");
                                } else {
                                    out.print("Third Party");
                                }


                            %>
                        </td>
                    </tr>
                    <tr>
                        <th>NCD</th>
                        <td><%=insQuo.getNcd()%>%</td>
                    </tr>
                    <tr>
                        <th>Marketprice (MYR)</th>
                        <td><%=q.getPrice()%></td>
                    </tr>
                    <tr>
                        <th>Insurance Amount</th>
                        <td><%=qDao.calculateQuotation(insQuo)%></td>
                    </tr>
                    <tr>
                        <th>6% SST</th>
                        <td>
                            <%
                                double sst = 0.06 * q.getPrice();
                                out.print(sst);
                            %>
                        </td>
                    </tr>
                    <tr>
                        <th>Total (Include 6% SST)</th>
                        <td>
                            <%=qDao.calculateQuotation(insQuo) + sst%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <jsp:include page="dashboard-footer.jsp"/>
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