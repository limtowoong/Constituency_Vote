<%@ page import ="java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "select m.m_no, m.m_name, count(*) count from tbl_member_202005 m, tbl_vote_202005 v where m.m_no = v.m_no and v_confirm = 'Y' group by m.m_no, m.m_name order by count desc";

	Connection conn = DBConnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
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
		<div>후보자등수</div>
			<table class="table">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>
				<%
					while(rs.next()){ 
				%>
				<tr align="center">
					<td><%=rs.getString("m_no") %></td>
					<td><%=rs.getString("m_name") %></td>
					<td><%=rs.getString("count") %></td>
				</tr>
				<%
					} 
				%>
			</table>
</section>
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>