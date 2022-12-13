<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<title>수정 정보 확인</title>
<style>
table.pyo {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border: 1px solid #ccc;
  margin: 20px 10px;
}
table.pyo thead {
  border-right: 1px solid #ccc;
  border-left: 1px solid #ccc;
  background: #e7708d;
}
table.pyo thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
}
table.pyo tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #fcf1f4;
}
table.pyo td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

a{
text-decoration-line: none;
}

</style>
<%--표 스타일 url : https://nanati.me/html_css_table_design/ --%>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<% String id = request.getParameter("name"); %> 
<% String pw = request.getParameter("pw"); %> 

<a href="book.jsp"><img src="images/logo.png" width="250" style="float:left;"></a>

<center>
<div style="margin-right:250px">
<!-- 글자 여백 설정 url: https://clado.tistory.com/76 -->
<p style="color:blue"> '<%=id %>'님의 비밀번호가 변경되었습니다. </p>
</div>

<a href="logout.html"><img src='images/logout.png' style="float:right;"></a>
<a href="mypage.html"><img src='images/mypage.png' style="float:right;"></a><br>


<hr>
<h2>비밀번호 변경 내역</h2>


</form>

<%
   Connection con = null;
   PreparedStatement pstmt = null;
   String driverName = "com.mysql.jdbc.Driver";
   String dbURL = "jdbc:mysql://localhost:3306/library";
   String sql = "select * from student where id like ?";
   String name = request.getParameter("name") + "%";
   int rowCount = 0;
   
   try{
      Class.forName(driverName);
      con = DriverManager.getConnection(dbURL,"root","1234");
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,name);
      ResultSet result = pstmt.executeQuery();
%>
	<table class="pyo">
	<tr>
		<th align=center><b>학번</b></th>
		<th align=center><b>이름</b></th>
		<th align=center><b>아이디</b></th>
		<th align=center><b>현재 비밀번호</b></th>
		<th align=center><b>이전 비밀번호</b></th>
	</tr>
   
<%
   while(result.next()){
%>   

   <tr>
      <td align=center><%= result.getString(2) %></td>
      <td align=center><%= result.getString(3) %></td>
      <td align=center><%= result.getString(4) %></td>
      <td align=center><span style="color:blue;"><%= result.getString(5) %></span></td>
    <td align=center><span style="color:red;"><%= request.getParameter("pw") %></span></td>  
   </tr>
         
<%
      }
      result.close();
   }
   catch(Exception e){
      out.println("도서 조회를 하는 중 문제가 발생하였습니다.<hr>");
      out.println(e.toString());
      e.printStackTrace();
   }
   finally{
      if(pstmt != null) pstmt.close();
      if(con != null) con.close();
   }
%>

</table>
</center>
</body>
</html>