<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<html>
<head>
<meta http-equiv="Conten-Type" content="text/html; charset=utf-8">
<title>동빈도서관</title>
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
<%-- 데이터베이스 조회코드 perfect jsp pg.300 참고 --%>

<%@ page import="java.sql.*" %>


<div class="middle">

<a href="book.jsp"><img src="images/logo.png" width="250" style="float:left;"></a>
<a href="logout.html"><img src='images/logout.png' style="float:right;"></a>
<a href="mypage.html"><img src='images/mypage.png' style="float:right;"></a>

<!-- 글자 여백 설정 url: https://clado.tistory.com/76 -->
<div style="margin-right:250px;">
<p style="color:blue" align="center"> 동빈도서관에서 즐거운 시간 보내세요. </p>
</div>




<hr><center>
<h2>도서관 책 목록</h2> 


<form method=post name="search" action="search.jsp">
<p align=right>도서명: <input type="text" name="sname">
<input type=submit value="검색"></p>
</form>


<% Connection con = null;
	Statement stmt = null;
//String driverName = "org.gjt.mm.mysql.Driver";
String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost/library";

	try {
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL, "root", "1234");
		stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select * from book;");
		
		
%>
<%-- 책 데이터 공공데이터 포털 url :https://www.data.go.kr/data/15050454/fileData.do --%>
	<table class="pyo">
	<tr>
		<th align=center><b>순번</b></th>
		<th align=center><b>책이름</b></th>
		<th align=center><b>지은이</b></th>
		<th align=center><b>출판사</b></th>
		<th align=center><b>출간연도</b></th>
	</tr>
			
<%
		while (result.next()) {
			
%>

<%
	String URL = "https://search.danawa.com/dsearch.php?query=";
	String keyword = result.getString(2);

	URL += "&" + "query=" + keyword;
%>
	<tr>
		<td align=center><%=result.getString(1) %></td>
		<td align=center style="color:blue;"><div onclick="location.href='http://www.yes24.com/Product/Search?domain=ALL&query='+'<%=result.getString(2) %>';"><%=result.getString(2) %></div></td>
		<td align=center><%=result.getString(3) %></td>
		<td align=center><%=result.getString(4) %></td>
		<td align=center><%=result.getString(5) %></td>
	</tr>
<%
		}
		result.close();
	}
	catch(Exception e) {
	    out.println("도서 조회를 하는 중 문제가 발생하였습니다.<hr>");
		out.println(e.toString());
		e.printStackTrace();
	}
	finally {
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}
%>	

</table>
</center>

</body>
</html>