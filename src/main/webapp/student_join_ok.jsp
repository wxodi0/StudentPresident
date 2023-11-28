<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
			
			String sql = "INSERT INTO TBL_REGISTER VALUES(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			String number = request.getParameter("Number");
			String name = request.getParameter("Name");
			String code = request.getParameter("Code");
			String school = request.getParameter("School");
			String jumin1 = request.getParameter("Jumin1");
			String jumin2 = request.getParameter("Jumin2");
			
			String jumin = jumin1 + jumin2;
			
			String major = request.getParameter("Major");
			
			pstmt.setString(1, number);
			pstmt.setString(2, name);
			pstmt.setString(3, code);
			pstmt.setString(4, school);
			pstmt.setString(5, jumin);
			pstmt.setString(6, major);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();			
			%>
			<script type="text/javascript">
				alert("후보등록이 완료되었습니다.");
				self.location.href="student_list.jsp";
			</script>
			<%
			
		}catch(Exception e) {%>
			<script type="text/javascript">
				<%
					System.out.println(e.toString());
				%>
				alert("후보등록에 실패하였습니다.");
				self.location.href="student_join.jsp";
			</script>
		<%
		}
	%>
</body>
</html>