<%@page import="vo.MemberVO"%>
<%@page import="dao.LogDAO"%>
<%@page import="vo.FriendVO"%>
<%@page import="vo.FavoriteVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("logOK");
	FriendDAO fDao = new FriendDAO();
	LogDAO lDao = new LogDAO();
	
	ArrayList<FavoriteVO> list = fDao.FavoriteList(id);
	
	MemberVO mVo = lDao.MemberList(id);
	String nickname = mVo.getNickname();
	String intro = mVo.getIntro();

	if (id == null) { 	// 로그인이 되어있지 않다면
	response.sendRedirect(request.getContextPath() + "/login-logout-proc/login.jsp");

	} else { 			// 로그인이 되어있다면
	String nowThemeColor = lDao.GetNowThemeColor(id);
%>
<script>changeTheme('<%=nowThemeColor%>');</script>
<div class="main-page">

	<div class="menu-close">
		<div class="favorite-friend">
			<div class="f-f-list">
			<!-- 즐겨찾기 친구 보이기 -->
		<%
			if (!list.isEmpty()) {
				for (int i = 0; i < list.size(); i++) {
					FavoriteVO fVo = list.get(i);
					if (fVo.getFavorite().equals("Y")) {
		%>
						<a href="#" class="f-f"><%=fVo.getNickname()%></a>
		<%
					}
				}
			} else {
		%>
				<a class="n-f" href="<%=request.getContextPath()%>/friends-proc/friendsList.jsp?id=<%=id%>">+</a>
		<%
			}
		%>
			</div>
		</div>
		<span class="material-symbols-outlined" id="menu-btn" onclick="openPop()">menu</span>
	</div>
	<div class="board">
		<div class="my-info">
			<div><span><%=nickname%>&nbsp;</span> <span> | </span> <span>&nbsp;<%=intro%></span></div>
			<div><a href="<%=request.getContextPath()%>/write/writeForm.jsp?id=<%=id%>">+ 새 글 쓰기</a></div>
		</div>
		<div class="post">
			<div id="post-list">
		<%
			for (int i = 0; i < 3; i++) {
		%>
				<figure><img alt="img1" src="<%=request.getContextPath()%>/img/img1.jfif"></figure>
				<figure><img alt="img2" src="<%=request.getContextPath()%>/img/img2.jfif"></figure>
				<figure><img alt="img3" src="<%=request.getContextPath()%>/img/img3.jfif"></figure>
				<figure><img alt="img4" src="<%=request.getContextPath()%>/img/img4.jfif"></figure>
				<figure><img alt="img5" src="<%=request.getContextPath()%>/img/img5.jfif"></figure>
				<figure><img alt="img6" src="<%=request.getContextPath()%>/img/img6.jfif"></figure>
				<figure><img alt="img7" src="<%=request.getContextPath()%>/img/img7.jfif"></figure>
				<figure><img alt="img8" src="<%=request.getContextPath()%>/img/img8.jfif"></figure>
				<figure><img alt="img9" src="<%=request.getContextPath()%>/img/img9.jfif"></figure>
		<%
			}
		%>
			</div>
		</div>
	</div>

	<!-- 검색바 코드 -->
	<%@ include file="./search/search.jsp" %>
	
	<!-- 여기부터 서브 페이지 -->
	<div class="menu-open">
		<div class="menu-list">
			<a href="<%=request.getContextPath()%>/info-modify-proc/update.jsp?id=<%=id%>">마이페이지</a>
			<a href="<%=request.getContextPath()%>/friends-proc/friendsList.jsp?id=<%=id%>">친구 목록</a>
			<a href="<%=request.getContextPath()%>/login-logout-proc/logout.jsp">로그아웃</a>
		</div>
		<span class="material-symbols-outlined" id="close-btn" onclick="exitPop()">close</span>
	</div>
	<!-- 여기까지 서브 페이지 -->
</div>
<%
	}
%>
<%@ include file="./footer.jsp"%>