<%@page import="vo.FriendVO"%>
<%@page import="dao.FriendDAO"%>
<%@page import="dao.LogDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	LogDAO lDao = new LogDAO();
	String Id = request.getParameter("friendid");
	MemberVO mVo = lDao.MemberList(Id);
	String id = (String) session.getAttribute("logOK");
	FriendDAO fDao = new FriendDAO();
	FriendVO fVo = new FriendVO(id, Id, "N");
%>
	<script>changeTheme('<%=lDao.GetNowThemeColor(id)%>');</script>
<%
	int cnt = fDao.AddFriend(fVo);

	if(cnt > 0){
%>
	<script type="text/javascript">
		alert('친구를 추가했습니다.');
		location.href="<%=request.getContextPath()%>/friends-proc/friendsList.jsp?id=<%= id %>"
	</script>
<%		
	}else{
%>
	<script type="text/javascript">
		alert('친구 추가에 실패했습니다.');
		history.go(-1);
	</script>
<%
	}
%>

<%@ include file="../footer.jsp"%>