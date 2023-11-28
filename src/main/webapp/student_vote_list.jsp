<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자순위</title>
</head>
<body>
<table>
<%@include file="header.jsp" %>
<tr>
	<td>후보번호</td>
	<td>성명</td>
	<td>총득표수</td>
</tr>
<% 
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		String sql = "SELECT r.NO, r.NAME,COUNT(v.CHOICE_NO) as vote " +
				"FROM TBL_REGISTER r " +
				"LEFT JOIN TBL_VOTE v " + 
				"ON r.NO = v.CHOICE_NO " + 
				"GROUP BY r.NO, r.NAME " + 
				"ORDER BY COUNT(v.CHOICE_NO) DESC";
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%}
			con.close();
			stmt.close();
			rs.close();
	} catch (Exception e) {
		System.out.print(e);
	}%>

</table>
<%@include file="footer.jsp" %>
</body>
</html>