<%@page import="com.Study.member.vo.Member"%>
<%@page import="com.Study.util.FileUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>16/jstlFunction</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 

  </head>
  <body>
  	<c:set var="msg" value="hello 오늘은 금요일 하하" />
  	
  	${fn:length(msg)} <br> <!-- 항목개수나 문자열 길이 리턴해줌  -->
  	${fn:toUpperCase(msg)} <br> <!-- 대문자로 변환 -->
  	${fn:contains(msg, "금요일") } <br> <!-- "" '' 둘다 가능, msg에 금요일이 있으면 true, 없으면 false -->
  	${fn:replace(msg, '하하', '히히')} <br> <!-- 교체 -->
  
  	<c:forEach items="${fn:split(msg, ' ')}" varStatus="st" var="ss"> <!-- split: b(공백)를 기준으로 a(msg)를 분리해줘~ -->
  		${ss}, ${st.count} , ${st.current} <br> <!-- 현재 만든 배열이 없어서 current(items를 통해서 하나하나 반환하는거....) 활용  -->
  	</c:forEach>	
  	
  	
  	<c:set var="member" value='<%=new Member("hong", "길동", "1234", "050-0000-4445", "hong@daum.net", 10) %>' />
  	id = ${member.mem_id} <br>
  	id = ${member.getMem_id()} <br>
  	
  	${member.setMem_id("Nolja")} <br> <!-- 값 세팅만 하고 -->
  	id = ${member.mem_id} <br> <!-- 출력은 얘가 한거야 -->
  	
	${FileUtil.fancySize(15245558)} <br>  <!-- ==> FileUtil import받아 14.5Mb가 나온당..-->
	
<!--274p 람다식 사용하기  -->

	${greaterThen = (a,b) -> a > b ? true : false; '' } <!--값을 넣어준것 = 함수 선언 -->
	
	${greaterThen(3,2)} <br> 	<!--3이 2보다 크므로 true 출력 = 함수 호출-->
	
	
	${factorial = (n) -> n == 1 ? 1 : n * factorial(n-1); '' }
	
	${factorial(5)} <br> <!-- n이 1일때까지  n * factorial(n-1)이 호출됨 -->
	
	<!--해설
	 
	1: 5 *
			4 *
				3 *
					2 *
						1
  	 -->

	size < 1024 ? size += "bytes" : ( size < 10485760 ? size /1024.0 += "kb" : size / 10485760.0 += "Mb" ) <br> <!-- el식에서는 문자열 더할때 +=으로 연결. -->  	 
	${fancy = (size) -> size < 1024 ? size += "bytes" : ( size < 10485760 ? size /1024.0 += "kb" : size / 10485760.0 += "Mb" ) ; ''} <!-- 람다식으로 표현한 것.-->
	
	${fancy(202455541)} <br>  	 

	<!-- 문제 : 람다식 만들어보기 -->
	<c:set var="dan" value="7" />
	<ul>
	<c:forEach begin="1" end="9" var="j" >
	<c:forEach begin="1" end="9" var="i" >
		${gugu = (j, i) -> j * i;''} 
		<li>${j += "*" += i += "=" += gugu(j,i)}</li>
	</c:forEach>
	</c:forEach>
	</ul>	

  </body>
</html>














































