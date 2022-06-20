<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<body>
	<section class="login-form">
		<form action="<%=request.getContextPath()%>/login-logout-proc/loginProc.jsp" name="loginForm" method="post">
			<h2>로그인 화면</h2>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" id="btn" value="로그인" onclick="check()"></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>
<script type="text/javascript">
function check() {
    if(document.loginForm.id.value==""){
        alert('아이디가 입력되지 않았습니다.')
        document.loginForm.id.focus()
        return
    }
    if(document.loginForm.pwd.value==""){
        alert('비밀번호가 입력되지 않았습니다.')
        document.loginForm.pwd.focus()
        return
    }
    document.loginForm.submit()
}
</script>