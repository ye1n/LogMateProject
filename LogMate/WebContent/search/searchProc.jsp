<%@page import="dao.FriendDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	LogDAO dao = new LogDAO();
	FriendDAO fDao = new FriendDAO();
	String Id = request.getParameter("friendid");
	MemberVO vo = dao.MemberList(Id);

	//30분이 지나면 새로고침할 때 자동으로 로그아웃되고 로그인 페이지로 가는 코드
	String id = (String) session.getAttribute("logOK");
	
	//친구가 추가되어있는지 확인하는 코드
	int confirm_friend = fDao.GetFriend(id, Id);
%>
	<script>changeTheme('<%=dao.GetNowThemeColor(id)%>');</script>
<%	
	if (id != null) {
		if (vo.getId() == null) {
%>
		<h3>해당 아이디를 가진 친구가 없습니다.</h3>
		<a class="no-id" onclick="history.go(-1);">돌아가기</a>
<%
		} else if (id.equals(vo.getId())) {
%>
		<script type="text/javascript">
			location.href = "../mainPage.jsp"
		</script>
<%
		} else {
%>
		<section>
			<h2>친구 검색</h2>
			<table border="1" class="friends-list-table">
				<tr>
					<th>아이디</th>
					<th>별명</th>
					<th>소개글</th>
<%
					if(confirm_friend == -1){
%>
					<th>추가</th>
<%
					}else{
%>
					<th>삭제</th>
<%
					}
%>
				</tr>
				<tr>
					<td><%=vo.getId()%></td>
					<td><%=vo.getNickname()%></td>
					<td><%=vo.getIntro()%></td>
<%
					if(confirm_friend == -1){
%>
					<td>
						<a href="<%= request.getContextPath() %>/friends-proc/friendInsert.jsp?friendid=<%= vo.getId() %>" id="btn">추가</a>
					</td>
<%
					}else{
%>
					<td><input type="button" id="btn" onclick="location.href='<%=request.getContextPath()%>/friends-proc/friendDelete.jsp?id=<%=id%>&friendid=<%=Id%>';" value="삭제"></td>
<%
					}
%>
				</tr>
			</table>
		</section>
<%
		}
	} else {
%>
	<script type="text/javascript">
		location.href = "../mainPage.jsp";
	</script>
<%
	}
%>
<%@ include file="../footer.jsp"%>