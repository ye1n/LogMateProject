<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<body>
	<section class="join-form">
		<form action="joinProc.jsp" name="registerForm" method="post">
			<h2>회원가입</h2>
			<span>*</span>은 필수입니다.
			<table border="1">
				<tr>
					<th>이름<span>*</span></th>
					<td colspan="2"><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>아이디<span>*</span></th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호<span>*</span></th>
					<td colspan="2"><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>비밀번호 확인<span>*</span></th>
					<td colspan="2"><input type="password" name="pwdc"></td>
				</tr>
				<tr>
					<th>별명<span>*</span></th>
					<td><input type="text" name="nickname"></td>
				</tr>
				<tr>
					<th>한 줄 소개<span>*</span></th>
					<td><input type="text" name="intro"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="button" id="btn" onclick="check()" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</section>

	<%@ include file="../footer.jsp"%>

	<script type="text/javascript">
	function check() {
		if(document.registerForm.name.value==""){
			alert('이름이 입력되지 않았습니다.')
			document.registerForm.name.focus()
			return
		}
		if(document.registerForm.id.value==""){
			alert('아이디가 입력되지 않았습니다.')
			document.registerForm.id.focus()
			return
		}
		if(document.registerForm.pwd.value==""){
			alert('비밀번호가 입력되지 않았습니다.')
			document.registerForm.pwd.focus()
			return
		}
		if(document.registerForm.pwd.value.length < 4){
			alert('비밀번호를 4자리 이상 입력해주세요.')
			document.registerForm.pwd.focus()
			return
		}
		if(document.registerForm.pwdc.value==""){
			alert('비밀번호 확인이 입력되지 않았습니다.')
			document.registerForm.pwdc.focus();
			return
		}else if(document.registerForm.pwdc.value != document.registerForm.pwd.value){
			alert('비밀번호가 일치하지 않습니다.')
			document.registerForm.pwdc.focus()
			return
		}
		if(document.registerForm.nickname.value==""){
			alert('별명이 입력되지 않았습니다.')
			document.registerForm.nickname.focus();
			return
		}
		if(document.registerForm.intro.value==""){
			alert('소개글이 입력되지 않았습니다.')
			document.registerForm.intro.focus();
			return
		}
		document.registerForm.submit()
	}
</script>