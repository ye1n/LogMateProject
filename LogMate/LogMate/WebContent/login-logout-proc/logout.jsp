<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="../header.jsp"%><%	String id = (String) session.getAttribute("logOK");	//session 속성(logOK)을 제거함 : session.removeAttribute(); 또는 session.invalidate();	if (!id.isEmpty()) {		session.invalidate();		response.sendRedirect("../logMate.jsp");	}%></body></html>