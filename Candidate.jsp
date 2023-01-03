<%@ page import ="java.sql.*" %>
<%@ page import ="DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select m.m_no, m.m_name, p.p_name, "
				+"decode(m.p_school,'1','고졸','2','학사','3','석사','4','박사'), "
				+"substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,7), m.m_city, "
				+"substr(p.p_tel1,1,2)||'-'||substr(p.p_tel2,1,4)||'-'||substr(p.p_tel3,1,4) "
				+"from tbl_member_202005 m, tbl_party_202005 p "
				+"where m.p_code = p.p_code";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<div>후보조회</div>
<table class="table">
	<tr>
		<th>후보번호</th>
		<th>성명</th>
		<th>소속정당</th>
		<th>학력</th>
		<th>주민번호</th>
		<th>지역구</th>
		<th>대표전화</th>
	</tr>
	<%
		while(rs.next()) {
	%>
	<tr align="center">
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getString(6) %></td>
		<td><%= rs.getString(7) %></td>
	</tr>
	<%
		}
	%>
</table>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>