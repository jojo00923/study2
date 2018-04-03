<!--본체 중심이되는 파일  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page isErrorPage="true" %>     --%>
<%
	request.setCharacterEncoding("utf-8"); /* 스크립트 밑에다가해주면됨. 한글이나 영어아닌 문자 쓸때 화면 안깨지게 하도록 해주는것. */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/ index.jsp</title>

<style>
	#header {}
	#left {width:20%;float:left;}
	#contents {width:20%;float:left;}
	#footer {clear:both;}
	body, html {width:100%; height:100%;} 
</style>
</head>
<body style="width: 100%; height: 100%;">
	<div id="header">
		<!--메뉴영역 start top.jsp?age=36 -->
		<!--서블릿이 각각만들어짐. 얘를 만나면 결과를얘한테준다???????  -->
		<jsp:include page="/include/top.jsp" flush="false" />
		<!--메뉴영역 end-->
	</div>

	<div  id="left">
		<!--좌측메뉴 start-->
		<jsp:include page="/include/left.jsp" flush="false" />
		<!--좌측메뉴 end-->
	</div>

	<div  id="contents">
		<!--본문 start-->
		A-Ra 사이트입니다.
		<!--본문 end-->
	</div>

	<div  id="footer">
		<!--풋터 start-->

		<jsp:include page="/include/footer.jsp" flush="false" />

		<!--풋터 end-->
	</div>
</body>
</html>