<%@page import="vo.PostVO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	PostDAO pDao = new PostDAO();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	
	PostVO pVo = new PostVO(0, title, content, writer);
	
	int cnt = pDao.AddPost(pVo);
	
	if (cnt > 0){
%>
	<script type="text/javascript">
		alert('작성이 완료되었습니다.');
		history.go(-2);
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert('작성에 실패했습니다.');
		history.go(-1);
	</script>
<%
	}
%>

<%@ include file="../footer.jsp"%>