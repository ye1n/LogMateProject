<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	LogDAO lDao = new LogDAO();
	String Id = request.getParameter("id");
%>
<script>changeTheme('<%=lDao.GetNowThemeColor(Id)%>');</script>
<section class="writeForm">
	<h2>글 쓰기</h2>
	<form action="<%=request.getContextPath()%>/write/writeInsert.jsp" name="writeForm" method="post">
		<p>작성자 : <input class="writer" type="text" name="writer" value="<%=Id%>"> 님</p>
		<table border="1">
			<tr>
				<td><input type="text" class="title" maxlength="30" placeholder="제목은 30자 이내로 입력해주세요" name="title"></td>
			</tr>
			<tr>
				<td><textarea class="content" maxlength="500" rows="20" cols="50" placeholder="내용은 500자 이내로 입력해주세요" name="content"></textarea></td>
			</tr>
			<tr>
				<td><input id="btn" type="button" value="작성" onclick="check()"></td>
			</tr>
		</table>
	</form>
</section>

<script type="text/javascript">
	function check() {
		if (document.writeForm.title.value = "") {
			alert('제목을 입력해주세요');
			document.writeForm.title.focus();
			return;
		}
		if (document.writeForm.content.value = "") {
			alert('내용을 입력해주세요');
			document.writeForm.content.focus();
			return;
		}
		document.writeForm.submit();
	}
</script>

<%--@ include file="../footer.jsp" --%>