<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동빈도서관 회원가입</title>
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
<%--표 스타일 참고 페이지 url : https://nanati.me/html_css_table_design/ --%>
</head>
<body>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<% request.setCharacterEncoding("utf-8"); %>


<center>
<a href="book.jsp"><img src="images/logo.png" width="250" style="float:left;"></a>

<!-- 글자 여백 설정 url: https://clado.tistory.com/76 -->
<div style="margin-right:250px">

<h2>동빈도서관 회원가입</h2>

<p style="color:blue"> 다양한 도서를 찾아보고 대여해보세요! </p>
</div>

<hr>

<%
   Connection con = null;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   StringBuffer SQL = new StringBuffer("insert into library.student ");
   SQL.append("values(?,?,?,?,?)");
   String name = request.getParameter("name");
   String stn = request.getParameter("studentNum");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   int stdn = Integer.parseInt(stn);
   // String -> int 형변환 url : https://keizwer.tistory.com/117
   
   try{
      Context initCtx = new InitialContext();
      Context env = (Context) initCtx.lookup("java:comp/env/");
      DataSource ds = (DataSource) env.lookup("jdbc/mysql");
      con = ds.getConnection();
      
      pstmt = con.prepareStatement(SQL.toString());
      pstmt.setInt(1,0);
      pstmt.setInt(2, stdn);
      pstmt.setString(3, name);
      pstmt.setString(4, id);
      pstmt.setString(5, pw);
      
      int rowCount = pstmt.executeUpdate();
      if(rowCount == 1) out.println("<span style='color:blue'>"+ name + " </span>님 회원가입이 완료 되었습니다.<hr>");
      else out.println("회원가입 중 문제가 발생했습니다.");
      
      stmt = con.createStatement();
      ResultSet result = stmt.executeQuery("select * from library.student order by num desc limit 1;");
%>

<h2>회원가입 정보</h2>
   <table class="pyo">
   <tr>
      <th align=center><b>순번</b></th>
      <th align=center><b>학번</b></th>
      <th align=center><b>이름</b></th>
      <th align=center><b>아이디</b></th>
      <th align=center><b>비밀번호</b></th>

   </tr>
<%
   while (result.next()){
%>
   <tr>
      <td align=center><%= result.getString(1) %></td>
      <td align=center><%= result.getString(2) %></td>
      <td align=center><%= result.getString(3) %></td>
      <td align=center><%= result.getString(4) %></td>
      <td align=center><%= result.getString(5) %></td>
   </tr>
   <a href="book.jsp"><h2>동빈도서관으로 이동</h2></a>
<%
   }
   result.close();
   }
   catch(Exception e){
      out.println("회원가입 중 오류가 발생했습니다.");
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