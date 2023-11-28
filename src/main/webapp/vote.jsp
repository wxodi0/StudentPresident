<%@page import="java.sql.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

String sql = "SELECT no FROM TBL_REGISTER";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<form name="vote"  action="vote_ok.jsp" method="post">
	<h2>투표하기</h2>
	<table>
		<tr>
			<td>주민번호</td>
			<td><input name="jumin" type="text" maxlength="13" placeholder="주민번호"></td>
			<td>예)0403013000001</td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input placeholder="성명" name="Name" type="text"></td>
		</tr>
		<tr>
			<td>후보번호</td>
			<td>
				<select name="choice_no">
					<option value="" >==후보번호 선택==</option>
					<%
						while(rs.next()) {%>
							<option value=<%= rs.getString(1) %>><%= rs.getString(1) %></option>
						<%}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>투표시간</td>
			<td><input placeholder="ex)0511" name="time" type="text" placeholder="ex)0511"></td>
		</tr>
		<tr>
			<td>투표장소</td>
			<td><input placeholder="투표장소" name="area" type="text"></td>
		</tr>
		<tr>
			<td>유권자확인</td>
			<td>
				<input name="confirm" type="radio" value="N">확인
				<input name="confirm" type="radio" value="Y">미확인
			</td>
		</tr>
		<tr>
			<td><input type="button" onClick="vote_on()"value="투표하기"></td>
			<td><input type="button" onClick="reset()" value="다시쓰기"></td>
		</tr>
	</table>
	<a href="main.jsp">홈으로</a>
</form>
<%@include file="footer.jsp" %>

<script type="text/javascript">

	const fvote = document.vote;
	
	function reset() {
		alert("초기화 되었습니다. 다시 입력해주세요");
		location.href="vote.jsp";
	}
	function vote_on() {
		if(fvote.jumin.value =="") {
			alert("주민번호를 입력해주세요");
			fvote.jumin.focus();
		} else if(fvote.Name.value =="") {
			alert("이름을 입력해주세요");
			fvote.Name.focus();
		} else if(fvote.choice_no.value =="") {
			alert("후보를 선택해주세요.");
			fvote.choice_no.focus();
		} else if(fvote.time.value =="") {
			alert("오늘 날짜를 입력해주세요");
			fvote.time.focus();
		} else if(fvote.area.value =="") {
			alert("지역을 입력해주세요");
			fvote.area.focus();
		} else if(fvote.confirm.value =="") {
			alert("유권자 확인 여부를 선택해주세요");
			fvote.confirm.focus();
		} else {
			fvote.submit();
		}
	}
</script>
</body>
</html>