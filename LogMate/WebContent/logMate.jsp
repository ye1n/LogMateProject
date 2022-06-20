<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>header{display: none;}</style>
<section class="start-page">
	<table border="1">
		<h1 style="font-size: 48px;">LogMate</h1><br>
		<tr>
			<td>회원이신가요?</td>
			<td>회원이 아니신가요?</td>
		</tr>
		<tr>
			<td><button id="btn" onclick="location.href='<%=request.getContextPath()%>/mainPage.jsp';">로그인</button></td>
			<td><button id="btn" onclick="location.href='<%=request.getContextPath()%>/login-logout-proc/join.jsp';">회원가입</button></td>
		</tr>
	</table>
</section>
<%@ include file="footer.jsp"%>