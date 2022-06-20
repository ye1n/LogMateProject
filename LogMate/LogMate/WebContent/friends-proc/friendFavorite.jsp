<%@page import="vo.FriendVO"%>
<%@page import="dao.FriendDAO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	FriendDAO dao = new FriendDAO();
	
	String myid = request.getParameter("myid");
	String friendid = request.getParameter("friendid");
	String favorite = request.getParameter("favorite");
	
	FriendVO vo = new FriendVO(myid, friendid, favorite);
	int cnt = dao.UpdateFriend(vo);

	if(cnt > 0){
%>
	<script type="text/javascript">
		alert('즐겨찾기가 수정되었습니다.');
		location.href="<%=request.getContextPath()%>/friends-proc/friendsList.jsp?id=<%=myid%>";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert('즐겨찾기 수정에 실패했습니다.');
		history.go(-1);
	</script>
<%
	}
%>

<%@ include file="../footer.jsp"%>