<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생회장 후보</title>
</head>
<body>
<%@include file="header.jsp"%>
	<h3>후보조회</h3>
	<% try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		String sql = "SELECT TBL_REGISTER.NO, "+
				"TBL_REGISTER.NAME, " +
				"TBL_PARTNER.P_CLASS, " +
				"TBL_PARTNER.P_PARTNER, " +
				"TBL_REGISTER.SCHOOL, " + 
				"TBL_REGISTER.JUMIN, " + 
				"TBL_REGISTER.MAJOR, " +
				"TBL_PARTNER.P_TEL1, " +
				"TBL_PARTNER.P_TEL2, " +
				"TBL_PARTNER.P_TEL3 " +
				"FROM TBL_REGISTER INNER JOIN TBL_PARTNER " +
				"ON TBL_REGISTER.Code = TBL_PARTNER.P_CODE";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<table>
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>반</td>
			<td>파트너</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>전공학년반</td>
			<td>전화번호</td>
		</tr>
		<%
		while(rs.next()) {
			String school = "";
			if(rs.getString(5).equals("1")) {
				school = "중졸";
			} else if(rs.getString(5).equals("2")) {
				school = "고졸";
			} else if(rs.getString(5).equals("3")) {
				school = "전문대졸";
			} else if(rs.getString(5).equals("4")) {
				school = "대졸";
			} else if(rs.getString(5).equals("5")) {
				school = "석사수료";
			} else if(rs.getString(5).equals("6")) {
				school = "석사취득";
			} else if(rs.getString(5).equals("7")) {
				school = "박사수료";
			} else if(rs.getString(5).equals("8")) {
				school = "박사취득";
			}
			
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=school%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%>-<%=rs.getString(9)%>-<%=rs.getString(10)%></td>
			</tr>
		<%}
		}catch(Exception e) {
			System.out.println(e);
		}
		%>
	</table>
	<%@include file="footer.jsp"%>
</body>
</html>