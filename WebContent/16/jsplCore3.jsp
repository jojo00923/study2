<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>타이틀을 입력하세요.</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 

  </head>
  <body>
<!-- 308p URL 처리 태그  -->
  
	<a href="<%=request.getContextPath() %>/15/memberList.jsp">회원목록</a> <!-- 표현식으로 하는 방법 -->
	<%-- <a href="${pageContext.request.contextPath}/15/memberList.jsp">회원목록</a> <!-- el식으로 하는 방법  -->
	<a href='<c:url value="/15/memberList.jsp" />' >회원목록</a> <!-- url로 하는 방법  --> --%>
	
	<img alt="" src="/image/IMG_3628.jpeg" width="200px"> <br> <!-- 연결안하면 안되는거 보여주기 위한 예시 -->

	<img alt="" src="<c:url value="/image/IMG_3628.jpeg" />" width="200px"> <br> <!-- url 방법2 -->
	
	<a href="/study/common/download.do?id=234&path=board" class="btn btn-sm btn-primary" > <!-- dowm버튼1 -->
		<span class="glyphicon glyphicon-save"> Down </span>
	</a> <br>
	
	<c:url var="downUrl" value="/common.download.do"> <!-- dowm버튼2 var에 담고 -->
		<c:param name="id" value="234" />
		<c:param name="path" value="board" />
	</c:url>	
	
	<a href="${downUrl}" class="btn btn-sm btn-primary" > <!-- dowm버튼2 출력 -->
		<span class="glyphicon glyphicon-save"> Down </span>
	</a> <br>
	
	
   
  </body>
</html>





