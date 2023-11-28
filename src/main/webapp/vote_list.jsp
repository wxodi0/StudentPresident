<%@page import="oracle.jdbc.oracore.OracleTypeOPAQUE"%>
<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표결과조회</title>
</head>
<body>
<%@include file="header.jsp"%>
<%

try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	String sql = "select * from TBL_VOTE";
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
%>
<table>
	<tr>
		<td>이름</td>
		<td>생년월일</td>
		<td>성별</td>
		<td>후보번호</td>
		<td>투표시간</td>
		<td>유권자확인</td>
	</tr>
	<%
		
		while(rs.next()) {
			String jumin = rs.getString(1) ;
			
			String juminY = jumin.substring(0,2);
			String juminM = jumin.substring(2,4);
			String juminD = jumin.substring(4,6);
			
			String gender = jumin.substring(6,7);
			System.out.println(gender);
			if(Integer.parseInt(gender) % 2 == 0) {
				gender = "여";
			}else {
				gender = "남";
			}
			
			String Name = rs.getString(2);
			String choice_no = rs.getString(3);
			String time = rs.getString(4);
			String area = rs.getString(5);
			
			String confirm = rs.getString(6);
			
			if(confirm.equals("Y")) {
				confirm = "확인";
			} else if(confirm.equals("N")){
				confirm = "미확인";
			}
			
	%>
		<tr>
			<td><%=Name %></td>
			<td><%=juminY%>년<%=juminM%>월<%=juminD%>일생</td>
			<td><%=gender %></td>
			<td><%=choice_no %></td>
			<td><%=time.substring(0,2) %>:<%=time.substring(2,4) %></td>
			<td><%=confirm %></td>
		</tr>
	<%}
		stmt.close();
		con.close();
		rs.close();
	}catch(Exception e) {
		System.out.println(e);
	}
	%>
</table>
<%@include file="footer.jsp" %>
</body>
</html>