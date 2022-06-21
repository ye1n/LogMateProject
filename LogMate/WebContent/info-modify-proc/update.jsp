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
				<td><input type="password" name="pwd" value="<%= vo.getPwd() %>"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwdc" value="<%= vo.getPwd() %>"></td>
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
				<th>테마 변경</th>
				<td>
				<%
					String nowTheme = dao.GetNowThemeColor(Id);
					if(nowTheme.equals("grey")) {
				%>
					<input type="radio" name="theme" value="grey" checked="checked">grey
					<input type="radio" name="theme" value="pink" >pink
					<input type="radio" name="theme" value="yellow">yellow
					<input type="radio" name="theme" value="skyblue">skyblue
					<input type="radio" name="theme" value="purple">purple
					<input type="radio" name="theme" value="beige">beige
				<%
					} else if(nowTheme.equals("pink")){
				%>
					<input type="radio" name="theme" value="grey">grey
					<input type="radio" name="theme" value="pink" checked="checked">pink
					<input type="radio" name="theme" value="yellow">yellow
					<input type="radio" name="theme" value="skyblue">skyblue
					<input type="radio" name="theme" value="purple">purple
					<input type="radio" name="theme" value="beige">beige
				<%
					} else if(nowTheme.equals("yellow")){
				%>
					<input type="radio" name="theme" value="grey">grey
					<input type="radio" name="theme" value="pink">pink
					<input type="radio" name="theme" value="yellow" checked="checked">yellow
					<input type="radio" name="theme" value="skyblue">skyblue
					<input type="radio" name="theme" value="purple">purple
					<input type="radio" name="theme" value="beige">beige
				<%
					} else if(nowTheme.equals("skyblue")){
				%>
					<input type="radio" name="theme" value="grey">grey
					<input type="radio" name="theme" value="pink">pink
					<input type="radio" name="theme" value="yellow">yellow
					<input type="radio" name="theme" value="skyblue" checked="checked">skyblue
					<input type="radio" name="theme" value="purple">purple
					<input type="radio" name="theme" value="beige">beige
				<%
					} else if(nowTheme.equals("purple")){
				%>
					<input type="radio" name="theme" value="grey">grey
					<input type="radio" name="theme" value="pink">pink
					<input type="radio" name="theme" value="yellow">yellow
					<input type="radio" name="theme" value="skyblue">skyblue
					<input type="radio" name="theme" value="purple" checked="checked">purple
					<input type="radio" name="theme" value="beige">beige
				<%
					} else if(nowTheme.equals("beige")){
				%>
					<input type="radio" name="theme" value="grey">grey
					<input type="radio" name="theme" value="pink">pink
					<input type="radio" name="theme" value="yellow">yellow
					<input type="radio" name="theme" value="skyblue">skyblue
					<input type="radio" name="theme" value="purple">purple
					<input type="radio" name="theme" value="beige" checked="checked">beige
				<%
					}
				%>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btn" value="정보 수정" onclick="check()"></td>
			</tr>
		</table>
	</form>
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
		if(document.updateForm.pwd.value.length < 4){
			alert('비밀번호를 4자리 이상 입력해주세요.')
			document.registerForm.pwd.focus()
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