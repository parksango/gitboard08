<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String subject, name, memo, email, time;
  subject = request.getParameter("subject");
  name = request.getParameter("name");
  memo = request.getParameter("memo");
  email = request.getParameter("email");
  time = request.getParameter("time");
  
  String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  String DB_URL = "jdbc:mysql://localhost:3306/board";
  String USERNAME = "root";
  String PASSWORD = "root";
  Class.forName(JDBC_DRIVER);
  Connection con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
  Statement stmt = con.createStatement();
  String sql = "INSERT INTO message(subject, name, time, memo, email)";
        sql += "values('"+subject+"', '"+name+"', '"+time+"', '"+memo+"', '"+email+"')";
  stmt.executeUpdate(sql);
%>
<h3>게시글 등록 되었습니다.</h3>
<a href="list.jsp">리스트 보기</a>
</body>
</html>