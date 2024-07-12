<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%
final String userName = "root";
final String password = "6209238834";
final String url = "jdbc:mysql://localhost:3306/passenger";
Connection conn = null;
PreparedStatement pst = null;
ResultSet rst = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userName, password);
    if (conn != null) {
        int id = Integer.parseInt(request.getParameter("tktid"));
        String Query = "SELECT * FROM details WHERE id = ?";
        pst = conn.prepareStatement(Query);
        pst.setInt(1, id);
        rst = pst.executeQuery();

        if (rst.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 40%;
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
        text-align: left;
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
     .button {
                    display: inline-block;
                    margin-top: 20px;
                    padding: 10px 20px;
                    font-size: 16px;
                    color: white;
                    background-color: #007bff;
                    border: none;
                    border-radius: 5px;
                    text-decoration: none;
                }
                .button:hover {
                    background-color: #0056b3;
                }
</style>
</head>
<body>
    <div class="container">
        <h2>Booking Details</h2>
        <table>
            <tr>
                <th>Passenger Name</th>
                <td><%= rst.getString(2) %></td>
            </tr>
            <tr>
                <th>Passenger Age</th>
                <td><%= rst.getInt(3) %></td>
            </tr>
            <tr>
                <th>Bus No</th>
                <td><%= rst.getString(4) %></td>
            </tr>
            <tr>
                <th>Bus Name</th>
                <td><%= rst.getString(5) %></td>
            </tr>
            <tr>
                <th>Fare</th>
                <td><%= rst.getInt(6) %></td>
            </tr>
            <tr>
                <th>Status</th>
                <td><%= rst.getString(7) %></td>
            </tr>
        </table>
        <a href="index.jsp" class="button">Back to Home</a>
    </div>
</body>
</html>
<%
        } else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID Not Found</title>
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
        text-align: center;
    }
    h3 {
        color: #333;
    }
</style>
</head>
<body>
    <div class="container">
        <h3>ID Not Found</h3>
    </div>
</body>
</html>
<%
        }
    } 
} catch (Exception e) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
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
        text-align: center;
    }
    h3 {
        color: #333;
    }
    pre {
        text-align: left;
        background-color: #eee;
        padding: 10px;
        border-radius: 5px;
        overflow-x: auto;
    }
</style>
</head>
<body>
    <div class="container">
        <h3>An error occurred while retrieving data.</h3>
        <pre><%= e.getMessage() %></pre>
    </div>
</body>
</html>
<%
    e.printStackTrace();
} 
%>
