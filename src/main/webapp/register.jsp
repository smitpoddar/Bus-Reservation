<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
final String userName = "root";
final String password = "6209238834";
final String url = "jdbc:mysql://localhost:3306/passenger";
Connection c;
PreparedStatement pst;
ResultSet rst;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");//registering
    c = DriverManager.getConnection(url, userName, password);//loading
    if (c != null) {
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String busno = request.getParameter("busno");
        String busname = request.getParameter("busname");
        String fare = request.getParameter("fare");

        String Query = "insert into details(name, age, busNo, busName, fare, status) values(?,?,?,?,?,?)";
        pst = c.prepareStatement(Query, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, name);
        pst.setString(2, age);
        pst.setString(3, busno);
        pst.setString(4, busname);
        pst.setString(5, fare);
        pst.setString(6, "Reserved");
        pst.executeUpdate();
        
        ResultSet generatedKeys = pst.getGeneratedKeys();
        int generatedId = 0;
        if (generatedKeys.next()) {
            generatedId = generatedKeys.getInt(1);
        }
%>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Reservation Confirmation</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f9;
                    color: #333;
                    text-align: center;
                    padding: 50px;
                }
                .container {
                    background: white;
                    border-radius: 8px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                    max-width: 500px;
                    margin: 0 auto;
                    padding: 20px;
                }
                h1 {
                    color: #4CAF50;
                }
                h2 {
                    color: #555;
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
                <h1>Your details has been submitted.</h1>
                <h2>Your Reservation ID is: <%= generatedId %></h2>
                <a href="index.jsp" class="button">Back to Home</a>
            </div>
        </body>
        </html>
<%
    }
} catch (Exception e) {
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Server Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                text-align: center;
                padding: 50px;
            }
            h1 {
                color: #ff5722;
            }
        </style>
    </head>
    <body>
        <h1>Server is temporarily down.</h1>
    </body>
    </html>
<%
    e.printStackTrace();
}
%>
