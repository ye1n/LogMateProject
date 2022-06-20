<%@page import="dao.FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	FriendDAO dao = new FriendDAO();
	String myid = request.getParameter("id");
	String friendid = request.getParameter("friendid");

	int cnt = dao.DeleteFriend(myid, friendid);

	if (cnt > 0) {
%>
	<script type="text/javascript">
		alert('삭제가 완료되었습니다.');
		location.href = "<%=request.getContextPath()%>/friends-proc/friendsList.jsp?id=<%=myid%>";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert('삭제에 실패했습니다.');
		history.go(-1);
	</script>
<%
	}
%>
<%@ include file="../footer.jsp"%>