<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");

	String sql = "INSERT INTO TBL_VOTE VALUES(?,?,?,?,?,?)";

	PreparedStatement pstmt = con.prepareStatement(sql);

	String jumin = request.getParameter("jumin");
	String Name = request.getParameter("Name");
	String choice_no = request.getParameter("choice_no");
	String time = request.getParameter("time");
	String area = request.getParameter("area");
	String confirm = request.getParameter("confirm");

	pstmt.setString(1, jumin);
	pstmt.setString(2, Name);
	pstmt.setString(3, choice_no);
	pstmt.setString(4, time);
	pstmt.setString(5, area);
	pstmt.setString(6, confirm);

	pstmt.executeUpdate();

	pstmt.close();
	con.close();
	
	%>
		<script type="text/javascript">
			alert("투표가 정상적으로 처리되었습니다.");
			location.href="main.jsp";
		</script>
	<%
}catch(Exception e) {%>
	<script type="text/javascript">
		alert("투표가 정상적으로 처리되지 않았습니다. 다시 시도해주세요");
	</script>
<%}
%>
</body>
</html>