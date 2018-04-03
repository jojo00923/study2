<%@page import="com.Study.board.service.BoardServiceImpl"%>
<%@page import="com.Study.member.service.MemberServiceImpl"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLSyntaxErrorException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
  
	<title>title</title>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<jsp:useBean id="board" class="com.Study.board.vo.Board"></jsp:useBean> <!-- 파라미터 이름과 세터가 같으면 자동입력되게하는것. request.getParameter 대신 사용. -->
<jsp:setProperty property="*" name="board"/>
		<%	
			BoardServiceImpl boardService = new BoardServiceImpl();
			board.setBo_ip(request.getRemoteAddr());/*작성자 제목 패스워드 이메일 내용 아이피 6개가 남겨서 레지스트 보드로간다.  */
		
			int result = boardService.registBoard(board);
			
			if(result > 0){
		%>
	
	
			<script type="text/javascript">
				alert("회원가입 성공하셨습니다");
				location.href="boardList.jsp";
			</script>
					<%
				}else{//업데이트 할것이 없음 //실패
					%>
					<div class="row">
						업데이트 항목이 없습니다.<br>

					</div>
					<%
				}
			%>
	</div><!--컨테이너 종료-->
</body>
</html>