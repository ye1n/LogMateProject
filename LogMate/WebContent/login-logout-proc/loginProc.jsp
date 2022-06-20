<%@page import="vo.LoginVO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	LogDAO dao = new LogDAO();

	String Id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	LoginVO vo = dao.Login(Id);

	if (Id.equals(vo.getId()) && pwd.equals(vo.getPwd())) {
		session.setMaxInactiveInterval(8640);
		session.setAttribute("logOK", Id);

		response.sendRedirect("../mainPage.jsp");
	} else {
%>
	<script type="text/javascript">
		alert('아이디 또는 비밀번호를 잘못 입력했습니다.');
		history.go(-1);
	</script>
<%
	}
%>
<%@ include file="../footer.jsp"%>