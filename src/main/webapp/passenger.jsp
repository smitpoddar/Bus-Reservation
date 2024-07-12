<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
final String userName = "root";
final String password = "6209238834";
final String url = "jdbc:mysql://localhost:3306/busReservation";
Connection conn ;
PreparedStatement pst;
ResultSet rst;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userName, password);
    if (conn !=null){
        int id = Integer.parseInt(request.getParameter("id"));
        String Query = "select * from busDatails where busId= ?";
        pst = conn.prepareStatement(Query);
        pst.setInt(1, id);
        rst = pst.executeQuery();
        while(rst.next()){
            %>
            
            <div class="container">
                <center>
                    <h2>Passenger Details</h2>
                    <hr>
                    <form method="post" action="register.jsp">
                        <table>
                            <tr>
                                <td>Bus Name</td>
                                <td><input type="text" value="<%=rst.getString(3) %>" name="busname" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <td>Bus No</td>
                                <td><input type="text" value="<%=rst.getString(2) %>" name="busno" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <td>Bus Fare</td>
                                <td><input type="text" value="<%=rst.getInt(6) %>" name="fare" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <td>Passenger Name</td>
                                <td><input type="text" placeholder="Enter Name" id="name" name="name" required/></td>
                            </tr>
                            <tr>
                                <td>Passenger Age</td>
                                <td><input type="text" placeholder="Enter Age" id="age" name="age" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="button-container">
                                    <button type="submit">Submit</button>
                                    <button type="reset">Reset</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </center>
            </div>
            <% 
        }
    }
} catch (Exception e) {
    e.printStackTrace();
} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passenger Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        margin-top: 30px;
    }
    h2 {
        color: #333;
    }
    hr {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    td {
        padding: 10px;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .button-container {
        text-align: center;
    }
    button {
        padding: 10px 15px;
        margin: 5px;
        border: none;
        background-color: #3498db;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }
    button[type="reset"] {
        background-color: #d9534f;
    }
    button:hover {
        opacity: 0.8;
    }
</style>
</head>
<body>
</body>
</html>
