<%@page import="com.Study.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!--     <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script> -->

  </head>
  <body>
mem_id = <%=request.getParameter("mem_id") %> <br>
el mem_id = ${param.mem_id} <br> <!-- 가지고온 정보를 화면에 뿌림. el 표현식. -->
   
<!--수치연산자 258p  -->    
${1000 + 4} <br>   
${20 / 4} <br>   
${20 % 3} <br> 
${20 mod 3} <br>    

<!-- 비교연산자  -->
${4 > 3} <br> 
${4 gt 3} <br>

<!-- 논리연산자 -->
${4 gt 3 and 1 eq 1} <br> 
${4 > 3 && 1 == 1} <br> 
<%
	//String abc = "hello";
	request.setAttribute("abc", "hello");
%>

<!-- empty 연산자  -->
\${empty abc} = ${empty abc} <br> <!-- empty연산자. 비어있으면 true  -->
${empty param.mem_id} <br>

<!-- 비교 선택 연산자 262p -->
${ 4 > 5 ? '4가 크네요' : '4가 작네요'} <br>

<!-- 문자열 연결 -->
<%
	Member member = new Member("hong", "길동아빠", "1234", "010-5545-6665", "gildong@naver.com", 1020);
	Member member2 = new Member("nolja", " 놀자", "1234", "010-5545-6663", "nolja@naver.com", 0);
	
	request.setAttribute("member", member); //앞은 키, 뒤는 값 담은 객체 member
	session.setAttribute("member", member2 );
%>
<!--pageContext 사용자요청까지, request, session, application   -->
\${member.mem_id} = ${member.mem_id} <br> <!-- 가까운 곳에서 가져오기 때문에 hong, nolja 중 hong 나옴 -->
<!-- request에서 가져오고 싶으면 requestScope.member.mem_id라고 쓰면됨. 어차피 젤 가까운게 request니깐 보통 안씀~-->
\${requestScope.member.mem_id} = ${requestScope.member.mem_id} <br>
<!-- session에서 가져오고 싶으면 sessionScope.member.mem_id라고 쓰면됨. 254p  -->
\${sessionScope.member.mem_id} = ${sessionScope.member.mem_id} <br>
${member.mem_name}의 마일리지는  ${member.mem_mileage}입니다. <br>
${member.mem_name += '의 마일리지는 ' += member.mem_mileage += "입니다." } <br>

<!-- 컬렉션 -->
${arr = [1,2,3,4,5]; ''} <br />
\${arr[2] } = ${arr[2] } <br>
<hr>

<!-- 할당연산자 -->
${var1 = 1004; var2 = 100 ; '' } <br> <!--맨 마지막것만 나오니깐 빈문자열('')쓰면 공백 나옴.  -->
값은 = ${var1}, ${var1 + var2 } <br>

<hr>
<!-- 표현식  -->
<%=member.getMem_name() %> <br>
<%=member2.getMem_name() %> <br>
<!-- el표기법은, 꼭 속성을 넣고 해줘야함. -->
<hr>
${arr1 = ["길동아빠","소향엄마","놀자"];'' } <!-- list형식  -->
${arr2 = {'name' : '홍길동', 'age' : 20 } ; ''} <!-- map형식 -->

\${arr1[2]} = ${arr1[2]} <br> <!-- list  -->
\${arr2['name']} = ${arr2['name']} &nbsp&nbsp&nbsp&nbsp  \${arr2.name} = ${arr2.name} <br> <!-- map 에서는 키를 []안에 넣어도 되고 . 으로 연결해도 된다. -->

  </body>
</html>
















