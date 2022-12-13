<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<title>로그인 에러: 비밀번호 오류 </title>
<style>
#fsize {
	font-size:150%;
}
#box {
  width:200px;
  height:30px;
  font-size:20px;
}
.middle {

	  height : 30px;

	  text-align : center;

	  line-height : 30px;

	}
</style>
	<!-- 정렬방법 url: https://hianna.tistory.com/674 -->
</head>
<body>

<div class="middle">

<a href="book.jsp"><img src="images/logo.png" width="250" style="float:left;"></a>

<div class="middle">
<div style="margin-right:250px;">
<h2>비밀번호 오류</h2>
<!-- 글자 여백 설정 url: https://clado.tistory.com/76 -->
<p style="color:red"> 비밀번호가 틀렸습니다. 비밀번호를 다시 확인하고 입력해주세요. </p>

</div>
<hr>
<center>
<form method="post" action="login.jsp">
	<p id="fsize">아이디</p>
	<input type="text" name="id"id="box">
	<p id="fsize">비밀번호</p>
	<input type="password" name="pw"id="box"></p>
	<input type="submit" value="로그인" style="height:50px; width:100px;background-color:skyblue;">
	<button type="button" onclick="location.href='join.html'"style="height:50px; width:100px;background-color:skyblue;" >회원가입</button >
</div>
</center>
<!-- 로그인 폼 pg.149 참고-->
</form>
</body>
</html>