<%@page import="vo.MemberVO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	LogDAO dao = new LogDAO();

	String id = request.getParameter("id");
	int result = dao.GetId(id);
	
	// 아이디 중복 체크에서 통과
	if(result > 0){
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String intro = request.getParameter("intro");
		
		MemberVO vo = new MemberVO(name, id, pwd, nickname, intro);
		int cnt = dao.JoinMember(vo);
			
		if(cnt > 0){
	%>
		<script type="text/javascript">
			alert('회원가입에 성공했습니다.');
			location.href="<%=request.getContextPath()%>/mainPage.jsp";
		</script>
<%			
		}else{
	%>
		<script type="text/javascript">
			alert('회원가입에 실패했습니다.');
			history.go(-1);
		</script>
<%
		}
	// 아이디 중복 체크에서 불통과
	}else {
%>
	<script type="text/javascript">
		alert('아이디가 중복입니다. 다른 아이디를 입력해 주세요');
		history.go(-1);
	</script>
<%
	}
%>

<%@ include file="../footer.jsp"%>