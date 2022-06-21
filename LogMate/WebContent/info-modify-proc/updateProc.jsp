<%@page import="vo.MemberVO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	LogDAO dao = new LogDAO();
	
	String name = request.getParameter("name");
	String Id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String nickname = request.getParameter("nickname");
	String intro = request.getParameter("intro");
	
	/* 선택한 테마 가져옴 */
	String theme = request.getParameter("theme");
	dao.UpdateThemeColor(Id, theme);

	MemberVO vo = new MemberVO(name, Id, pwd, nickname, intro);

	int cnt = dao.UpdateMember(vo);

	if (cnt > 0) {
%>
	<script>
		alert('정보수정에 성공하였습니다.');
		location.href="<%=request.getContextPath()%>/mainPage.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert('정보수정에 실패했습니다.');
		history.go(-1);
	</script>
<%
	}
%>

<%@ include file="../footer.jsp"%>