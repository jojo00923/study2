<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/ index.jsp</title>
</head>
<body>


<h2>A-Ra 사이트에 오신 걸 환영합니다</h2>

내용

<p>
<a href="11/Login.jsp">로그인</a>
<a href="11/viewSession.jsp">viewSession 으로</a>
<%-- <%=request.getParameter("moon") %>
</p>
<%
	//현재 속성에 저장된 lastUser를 출력
	String lastUser = (String)application.getAttribute("lastUser");//속성은 object 사용자가 뭘 꺼낼지 몰라서 최고조상받음.
	if(lastUser != null){
%>
	마지막 접속자 IP : <%=lastUser %>
<%		
	}
%> --%>



</body>
</html>