<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 페이지</title>
</head>
<body>
<%@include file="header.jsp" %>
<form name="stdJoin" method="post" action="student_join_ok.jsp">
	<table>
		<tr>
			<td>후보번호</td>
			<td><input name="Number" type="text"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input name="Name" type="text"></td>
		</tr>
		<tr>
			<td>팀번호</td>
			<td>
				<select name="Code">
					<option value="" disabled selected>==팀번호를 선택하세요==</option>
					<option value="P1">1팀</option>
					<option value="P2">2팀</option>
					<option value="P3">3팀</option>
					<option value="P4">4팀</option>
					<option value="P5">5팀</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>학력</td>
			<td>
				<select name="School">
					<option value="" disabled selected>==학력를 선택하세요==</option>
					<option value="1">중졸</option>
					<option value="2">고졸</option>
					<option value="3">전문대졸</option>
					<option value="4">대졸</option>
					<option value="5">석사수료</option>
					<option value="6">석사취득</option>
					<option value="7">박사수료</option>
					<option value="8">박사취득</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td><input name="Jumin1" type="text" maxlength="6">-<input name="Jumin2" type="text" maxlength="7"></td>
		</tr>
		<tr>
			<td>전공학년반</td>
			<td><input name="Major" type="text"></td>
		</tr>
		<tr>
			<td><input type="button" onClick="joinOk()" value="등록"></td>
		</tr>
	</table>
	<a href="main.jsp">홈으로</a>
</form>
<%@include file="footer.jsp" %>
<script type="text/javascript">
		function joinOk() {
			if(document.stdJoin.Number.value == "") {
				document.stdJoin.Number.focus();
				alert("후보번호를 입력해주세요");
				return false;
			} else if(document.stdJoin.Code.value == "") {
				alert("팀번호를 입력해주세요");
				document.stdJoin.Code.focus();
			} else if(document.stdJoin.School.value == "") {
				alert("학력을 선택해주세요");
				document.stdJoin.School.focus();
			} else if(document.stdJoin.Jumin1.value == "") {
				alert("주민등록번호 앞자리를 입력해주세요");
				document.stdJoin.Jumin1.focus();
			} else if(document.stdJoin.Jumin2.value == "") {
				alert("주민등록번호 뒷자리를 입력해주세요");
				document.stdJoin.Jumin2.focus();
			} else if(document.stdJoin.Major.value == "") {
				alert("전공학년 반을 입력해주세요");
				document.stdJoin.Major.focus();
			} else {
				document.stdJoin.submit();
			}
		}
		
</script>
</body>
</html>