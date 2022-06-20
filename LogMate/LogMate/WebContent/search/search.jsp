<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="search">
	<form action="<%=request.getContextPath()%>/search/searchProc.jsp" name="searchForm">
		<table>
			<tr>
				<td><input type="text" id="search" placeholder="검색하실 친구의 아이디를 입력해주세요." name="friendid"></td>
				<td><span class="material-symbols-outlined" id="icons" onclick="check()">search</span></td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
	function check() {
		if (document.searchForm.friendid.value == "") {
			alert('검색할 친구의 아이디를 정확히 입력해주세요.')
			document.searchForm.friendid.focus()
			return;
		}
		document.searchForm.submit()
	}
</script>