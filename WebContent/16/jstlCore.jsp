<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Study.member.vo.Member"%>
<%@page import="com.Study.member.service.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    <!-- prefix에 쓴 거는 html로 안읽고 java로 인식함. -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>13/ memberList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<!-- === 아라누나 === -->

<!-- 아이 섬뜩해라~ -->
<!-- 아이 섬뜩해라~ -->
<!-- 아이 섬뜩해라~ -->
<!-- 아이 섬뜩해라~ -->
<!-- 아이 섬뜩해라~ -->

<!-- 우와 진짜 열심히한다~!! -->
<!-- 달라 달라~~~ 역시 달라~~~~ -->
<!-- 우와 진짜 열심히한다~!! -->
<!-- 달라 달라~~~ 역시 달라~~~~ -->
<!-- 우와 진짜 열심히한다~!! -->
<!-- 달라 달라~~~ 역시 달라~~~~ -->

<!--296p c:set 태그  -->
	<!-- jstl var로 시작하는 속성에는 el표기법을 사용하지 마세요. -->
    <c:set var="msg" value="1000"/> <!-- var:변수이름 value:담을 값 -->
    ${msg} <br>
    <c:set var="msg2" value="${msg +4}" />
    ${msg2} <br>
    
    <c:set var="member" value="<%=new Member()%>" /> <!-- jsp2.2형식. 객체 멤버 불러옴 -->
    <c:set target="${member}" property="mem_name" value="배고파요 ㅠ.ㅠ" /> <!-- 값을 세팅 -->
    <c:set target="${member}" property="mem_id" value="dkfk" />
    ${member.mem_name } <br>
    ${member.mem_phone = '042-454-7878'; '' } <!-- jsp2.3형식 -->
    ${member.mem_phone} <br>
    <hr>
<!--298p c:remove 태그  -->    
    <c:remove var="member"/>
    1: ${member.mem_name } <br>
    2: ${member.mem_phone} <br>
   
<!--299p c:if 태그  else는 없다! -->
	<c:set var="jumsu" value="89" />
	
	<c:if test="${jumsu > 90 && jumsu <= 100}">참 잘했어요*^^* <br> </c:if>   
	<c:if test="${jumsu gt 80 and jumsu le 90}">잘했어요^^ <br> </c:if>   
	<c:if test="${jumsu > 70 and jumsu le 80}">보통 <br> </c:if>   
	<c:if test="${jumsu <= 70}">너 때문에 못살아~~ <br> </c:if>   
   
<!-- 301p c:choose 태그  -->   
	<c:choose>
		<c:when test="${jumsu > 90 && jumsu <= 100 }" >
		나이스 샷 ${jumsu} <br>
		</c:when>
		<c:when test="${jumsu gt 80}">
		잘했어요^^ <br>
		</c:when>
		<c:when test="${jumsu > 70 }">
		보통 <br>
		</c:when>
		<c:otherwise>
		점수가 잘못되었거나... 70보다 작습니다.0
		</c:otherwise>
	</c:choose>
	
<!-- 303p c:forEach 태그  -->
<!-- 예시1 -->	
	<c:forEach var="i" begin="1" end="10" step="3"> <!--step은 기본이 1, 안적어도 됨, 몇씩 증가할 건지  -->
		${i} 배고파요오~~<br>
	</c:forEach>

<!-- 예시2 -->	
	<c:set var="sum" value="0" />             <!-- java식 : int sum = 0 -->
	<c:forEach var="i" begin="1" end="100">   <!-- java식 : for (int i = 1, i <= 100, i++){ -->
		<c:set var="sum" value="${sum + i}" /><!-- java식 : sum = sum + i -->
	</c:forEach>                              <!-- java식 : } -->
	1부터 100까지의 합 = ${sum} <br>
	<hr>
	
<!-- 예시3  -->	
	<%
		List<Member> list = new ArrayList();
		list.add(new Member("hong", "홍길동", "1234", "010-2458-7477", "hong@daum.net", 0));
		list.add(new Member("nolja", "야놀자", "1234", "010-2458-7477", "hong@daum.net", 0));
		list.add(new Member("sunja", "김순자", "1234", "010-2458-7477", "hong@daum.net", 0));
		
		request.setAttribute("members", list);
	%>
	<!----------------------------------------------------------------------------------------->
	<ul>
	<c:forEach var="user" items="${members}">
		<li>${user.mem_id} = ${user.mem_name} </li>
	
	</c:forEach>
    </ul>
    
    <!----------------------------------------------------------------------------------------->
    <ul>
	<c:forEach var="user" items="${members}" begin="1"> <!--begin="1"이면 index 1부터 속성값 출력됨  -->
		<li>${user.mem_id} = ${user.mem_name} </li>
	
	</c:forEach>
    </ul>
    
    <!----------------------------------------------------------------------------------------->
    
    
    <ul>
	<c:forEach var="user" items="${members}" begin="1" varStatus="st"> <!--varStatus="st": 반복을 도는 상태에 대한 정보를 관리 -->
		
		<c:if test="${st.first}" ><hr style='border-color: red; border-style:dotted;'></c:if>
		<li>${st.count}, ${st.index}, ${st.first}, ${st.current.mem_id}, ${user.mem_id} </li>
		<c:if test="${st.last}" ><hr style='border-color: blue; border-style:dotted;'></c:if>
		
	<!-- count는 몇번째 도는지, 인덱스번호, 첫번째면 true, 현재상태에서의 아이디, 유저의아이디 -->
	</c:forEach>
    </ul>
   
   
  </body>
</html>

















