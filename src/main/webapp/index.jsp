<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bus Reservation</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: auto;
        overflow: hidden;
        padding: 20px;
        background: #fff;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        margin-top: 30px;
    }
    h2 {
        text-align: center;
        color: #333;
        padding-bottom: 10px;
        border-bottom: 2px solid #3498db;
    }
    .busDetails {
        margin: 20px 0;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 1em;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #3498db;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    a {
        text-decoration: none;
        color: #3498db;
    }
    a:hover {
        text-decoration: underline;
    }
    form {
        margin-top: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
    }
    form label {
        font-size: 1em;
        color: #333;
    }
    form input[type="text"] {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1em;
    }
    form button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #3498db;
        color: #fff;
        font-size: 1em;
        cursor: pointer;
    }
    form button:hover {
        background-color: #2980b9;
    }
</style>
</head>
<body>
<center>
<form action="fetch.jsp" method="get">
    <label for="studentId">Enter Ticket ID:</label>
    <input type="text" id="tktid" name="tktid"/>
    <button type="submit">Search</button>
</form>
<div class="container">
    <h2>Bus Dashboard</h2>
    <div class="busDetails">
    <br>
<table>
<tr>
<th>Bus Id</th>
<th>Bus No</th>
<th>Bus Name</th>
<th>To Place</th>
<th>From Place</th>
<th>Fare</th>
<th>Booking</th>
</tr>
<%
final String userName = "root";
final String password = "6209238834";
final String url = "jdbc:mysql://localhost:3306/busReservation";
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userName, password);
    String sql = "SELECT * FROM busDatails";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    while (rs.next()) {
%>
<tr>
<td><%= rs.getInt("busId") %></td>
<td><%= rs.getString("busNo") %></td>
<td><%= rs.getString("busName") %></td>
<td><%= rs.getString("toPlace") %></td>
<td><%= rs.getString("fromPlace") %></td>
<td><%= rs.getString("fare") %></td>
<td><a href="passenger.jsp?id=<%=rs.getInt("busId")%>">Book here</a></td>
</tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
    </div>
    </div>
    </center>
</body>
</html>
