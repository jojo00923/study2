<%@page import="com.Study.member.vo.Member"%>
<%@page import="com.Study.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<fmt:setLocale value="en"/>
<fmt:bundle basename="resource.message" > <!-- prefix 쓰면 반복으로 쓰이는것 생략가능-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>타이틀</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<div class="page-header">
	<h2><fmt:message key="MEMBER.TITLE" /></h2>
</div>
<%
	String mem_id = request.getParameter("mem_id");
	MemberServiceImpl memberService = new MemberServiceImpl();
	Member member = memberService.getMember(mem_id);//service에 문자열 줘야되기때문에 mem_id쓴건데 별의미없음.딴걸로써도됨.
	
	request.setAttribute("mem", member);
%>
<div class="row">

<table class="table ">
	<tbody>
	<c:if test="${! empty mem}">
	
		<tr>
			<th><fmt:message key="MEMBER.ID" /></th>
			<fmt:message key="MEMBER.MESSAGE" var="msg">
				<fmt:param value="${mem.mem_name}" />
				<fmt:param value="${mem.mem_mileage}" />
			</fmt:message>
			<td title="${msg}">${mem.mem_id}</td>
		</tr>	
		<tr>
			<th><fmt:message key="MEMBER.NAME" /></th>
			<td>${mem.mem_name}</td>
		</tr>	
		<tr>
			<th><fmt:message key="MEMBER.PHONE" /></th>
			<td>${mem.mem_phone}</td>
		</tr>	
		<tr>
			<th><fmt:message key="MEMBER.EMAIL" /></th>
			<td>${mem.mem_email}</td>
		</tr>	
		<tr>
			<th>가입일</th>
			<td>${mem.reg_date}</td>
		</tr>	
		</c:if>								
		<c:if test="${empty mem}">
			<tr>
				<td><fmt:message key="MEMBER.NOTFOUND" /></td>
			</tr>
		</c:if>	
	</tbody>
</table>
</div>

<div class="row">
	<div class="col-md-6">
		<a href="memberList.jsp" class="btn btn-sm btn-warning"><fmt:message key="MEMBER.LIST" /></a>
	</div>
	<div class="col-md-6">
		<a href="memberEdit.jsp?mem_id=<%=mem_id%>" class="btn btn-sm btn-primary"><fmt:message key="MEMBER.SUBMIT" /></a>
	</div>

</div>

</div>
</body>
</fmt:bundle>
</html>