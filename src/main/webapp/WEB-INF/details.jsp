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
Connection conn ;
PreparedStatement pst;
ResultSet rst;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userName, password);
    if (conn !=null){
    	int id = Integer.parseInt(request.getParameter("studentId"));
    	String Query = "select * from register where id = ?";
    	pst = conn.prepareStatement(Query);
    	pst.setInt(1, id);
    	rst = pst.executeQuery();
    	if(rst.next()){
    		%>
    		<center>
    		<h3>Id Found</h3>
    		<hr>
    		<table border ="10">
    		<tr>
    		<td>Student Name</td>
    		<td><%=rst.getString(2) %></td>
    		</tr>
    		<tr>
    		<td>Student Roll No</td>
    		<td><%=rst.getString(3) %></td>
    		</tr>
    		<tr>
    		<td>Student Email</td>
    		<td><%=rst.getString(4) %></td>
    		</tr>
    		<tr>
    		<td>Student Department</td>
    		<td><%=rst.getString(5) %></td>
    		</tr>
    		<tr>
    		<td>Student Course Enrolled</td>
    		<td><%=rst.getString(6) %></td>
    		</tr>
    		</table>
    		</center>
    		<%
    	}else{
    		%>
    		<h3>Id Not Found</h3>
    		<%
    	}
    }
} catch (Exception e) {
	e.printStackTrace();
} 
%>