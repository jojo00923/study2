<%@page import="com.Study.member.vo.Member"%>
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
  
    <c:set var="msg">서지연, 나혜진, 조아라, 이민경, 김연임, 남솔, 한재은 </c:set>
    <c:set var="msg2"> <h4>어느새 빗물이 내눈가에 고이고 감았던 눈물이 어쩌구.</h4>
    		<b style="color:blue;font-size: 130%;">나 존재 화이팅</b>
    		<script>alert("불금불금부룹룹ㄹ불"); //location.href="http://www.daum.net";</script>
    		</c:set>
<pre> <!-- 부트스트랩쓰고 pre쓰면 꾸며줌 -->
${msg}

<!-- 306p c:forTokens 태그 -->

<c:forTokens items="${msg}" delims="," var="m" varStatus="st">
${st.count}, ${m}
</c:forTokens>

${msg2}

<!-- 311p c:out 태그 -->

<c:out value="${msg2}"  />
<%-- <c:out value="${msg2}"  escapeXml="false"/> --%>
<!-- escapeXml="false" 하면 화면에 안나옴.하지만 나오게하려고 c:out 쓰는거니 보통 쓸일 없음.-->

msg3=<c:out value="${msg3}" default="N/A" /> 
<!-- default="N/A" 는 기본으로 나오는 값인데 지금 msg3에 값이 없으므로 화면에는
msg3="N/A" 라고 나온다.-->

   
<!-- 313p c:catch 태그 -->

<c:set var="member" value='<%=new Member("hong", "길동", "1234", "050-0000-4445", "hong@daum.net", 10) %>' />
<!-- Member에 정보 넣을때는 자바영역이라서 " "로 묶어야 인식됨. -->

<c:catch var="ex"> <!-- 예외 발생한 걸 ex에 담아줌 -->
${member.mem_name}
${member.mem_id3} <!-- 여기에서 오류나서 바로 빠져나감. 뒤에꺼도 출력안됨. -->
${member.mem_pwd}

</c:catch>
히휴~~~
</pre>

<c:if test="${not empty ex }"> <!-- ex에 뭔가가 담겨있으면 익셉션 발생한거야~  -->
	예외발생 : ${ex.message}
</c:if>
	
<%-- 
${member.mem_yoou} <!-- 이건 찾음. 근데 없으니깐 오류남 -->
${member222.mem_yoou} <!-- 빈문자열로 찍힘, 오류안남 -->
 --%>

  </body>
</html>


























