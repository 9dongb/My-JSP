<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<title>동빈도서관 회원탈퇴</title>
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
<%@ page import="java.sql.*"%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("pw");
%>
<% 
Connection con = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt1 = null;
//String driverName = "org.gjt.mm.mysql.Driver";
String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/library";
ResultSet rs = null;
ResultSet rs1 = null;

// 로그인 기능 참고 url : https://happy-inside.tistory.com/entry/JSP-JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EB%A7%8C%EB%93%A4%EA%B8%B0-4%EA%B0%95-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0
	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "root", "1234");
		String sql = "select passwd from student where ID = ?";
		String sql1 = "delete from student where ID = ?";
		pstmt = con.prepareStatement(sql);
		pstmt1 = con.prepareStatement(sql1);
	
		pstmt.setString(1, id); // 첫번째 물음표에 매개변수로 받아온 id를 대입한다.
		pstmt1.setString(1, id); // 첫번째 물음표에 매개변수로 받아온 id를 대입한다.
		
		rs = pstmt.executeQuery(); // 쿼리 실행 결과 rs에 저장한다.
		
		if (rs.next()) {
			if(rs.getString(1).equals(passwd)){
				int rowCount = pstmt1.executeUpdate();
				response.sendRedirect("http://localhost:8080/MyJspPage/delete_ok.jsp");
		
					}else{
						response.sendRedirect("http://localhost:8080/MyJspPage/errorPw.jsp");
					}
			response.sendRedirect("http://localhost:8080/MyJspPage/errorId.jsp");
						}
		} catch (Exception e) {
			out.println("오류가 발생했습니다.");
			out.println(e.toString());
			e.printStackTrace();
			} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
			}
			%>
			

<center>
<div class="middle">
<img src="images/logo.png" width="250" style="float:left;">
<div class="middle">
<div style="margin-right:250px;">
<h2>동빈도서관 회원탈퇴</h2>
<!-- 글자 여백 설정 url: https://clado.tistory.com/76 -->
<p style="color:red"> 회원탈퇴에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요. </p>

</div>
<hr>
<form method="post" action="login.jsp">
	<p id="fsize">아이디</p>
	<input type="text" name="id"id="box">
	<p id="fsize">비밀번호</p>
	<input type="password" name="pw"id="box"></p>
	<input type="submit" value="회원탈퇴" style="height:50px; width:100px;background-color:red;">
	<button type="button" onclick="location.href='book.jsp'"style="height:50px; width:100px;background-color:skyblue;" >돌아가기</button >
</div>
</center>
</form>

</body>
</body>
</html>