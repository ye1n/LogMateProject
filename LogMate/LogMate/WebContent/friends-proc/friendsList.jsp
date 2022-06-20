<%@page import="dao.LogDAO"%>
<%@page import="dao.FriendDAO"%>
<%@page import="vo.FriendVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	FriendDAO fDao = new FriendDAO();
	LogDAO lDao = new LogDAO();
	String Id = request.getParameter("id");

	ArrayList<FriendVO> list = fDao.FriendList(Id);
%>
<script>changeTheme('<%=lDao.GetNowThemeColor(Id)%>');</script>
<section class="friend-list-form">
	<h2>친구 목록</h2>
<%
	if(list.isEmpty()){
%>
	<h3>친구가 없습니다.</h3>
	<a class="no-id" onclick="history.go(-1);">돌아가기</a>
<%
	}else{
%>
	<form action="<%=request.getContextPath()%>/friends-proc/friendFavorite.jsp" name="friends" method="post">
		<table border="1">
			<tr>
				<th>친구 아이디</th>
				<th>즐겨찾기</th>
				<th>삭제</th>
			</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
				FriendVO vo = list.get(i);
				String friendid = vo.getFriendid();
				String myid = vo.getMyid();	
		%>
			<tr>
				<td><input type="hidden" name="myid" value="<%= myid %>" readonly> <input type="hidden" name="friendid" value="<%= friendid %>" readonly><%= friendid %></td>
			<% 
				if(vo.getFavorite().equals("Y")){
			%>
				<td><a href="<%=request.getContextPath()%>/friends-proc/friendFavorite.jsp?favorite=N&friendid=<%=friendid%>&myid=<%=myid%>">해제</a></td>
			<%
				}else{
			%>
				<td><a href="<%=request.getContextPath()%>/friends-proc/friendFavorite.jsp?favorite=Y&friendid=<%=friendid%>&myid=<%=myid%>">등록</a></td>
			<%
				}
			%>
				<td><input type="button" id="btn" onclick="location.href='<%=request.getContextPath()%>/friends-proc/friendDelete.jsp?id=<%=Id%>&friendid=<%=friendid%>';" value="삭제"></td>
			</tr>
		<%
			}
		%>
		</table>
	</form>
<%
	}
%>
</section>

<%@ include file="../footer.jsp"%>