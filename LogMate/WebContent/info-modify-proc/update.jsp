<%@page import="vo.MemberVO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	LogDAO dao = new LogDAO();
	String Id = request.getParameter("id");
	MemberVO vo = dao.MemberList(Id);
%>
<script>changeTheme('<%=dao.GetNowThemeColor(Id)%>');</script>
<section class="update-form">
	<h2>내 정보 수정</h2>
	<form action="updateProc.jsp" name="updateForm" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=vo.getName()%>"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="<%=vo.getId()%>" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwdc"></td>
			</tr>
			<tr>
				<th>별명</th>
				<td><input type="text" name="nickname" value="<%=vo.getNickname()%>"></td>
			</tr>
			<tr>
				<th>한 줄 소개</th>
				<td><input type="text" name="intro" value="<%= vo.getIntro() %>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btn" value="정보 수정" onclick="check()"></td>
			</tr>
		</table>
	</form>
	<!--<div>테마<br>
		<input class="theme" type="button" value="default" onclick="defaultTheme(this)">
		<input class="theme" type="button" value="dark" onclick="blackTheme(this)">
		<input class="theme" type="button" value="skyblue" onclick="skyblueTheme(this)">
	</div>-->
</section>
<script type="text/javascript">
	function check() {
		if(document.updateForm.name.value==""){
			alert('이름이 입력되지 않았습니다.')
			document.updateForm.name.focus()
			return
		}
		if(document.updateForm.pwd.value==""){
			alert('비밀번호가 입력되지 않았습니다.')
			document.updateForm.pwd.focus()
			return
		}
		if(document.updateForm.pwdc.value==""){
			alert('비밀번호 확인이 입력되지 않았습니다.')
			document.updateForm.pwdc.focus();
			return
		}else if(document.updateForm.pwdc.value != document.updateForm.pwd.value){
			alert('비밀번호가 일치하지 않습니다.')
			document.updateForm.pwdc.focus()
			return
		}
		if(document.updateForm.nickname.value==""){
			alert('별명이 입력되지 않았습니다.')
			document.updateForm.nickname.focus();
			return
		}
		if(document.updateForm.intro.value==""){
			alert('한 줄 소개가 입력되지 않았습니다.')
			document.updateForm.intro.focus();
			return
		}
		document.updateForm.submit()
	}

</script>
<%@ include file="../footer.jsp"%>