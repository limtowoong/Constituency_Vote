<%@page import="java.sql.*"%>
<%@page import="DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    StringBuffer sb = new StringBuffer();
    sb.append("select v_name ")
	    .append(" ,'19'||substr(v_jumin,1,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일생' as v_birth                         ")
	    .append(" , '만 '||trunc(months_between(sysdate, to_date(substr('19'||v_jumin,1,8), 'yyyymmdd'))/12)||'세' as v_age                             ")
	    .append(" , case substr(v_jumin,7,1) when '1' then '남' when '2' then '여' when '3' then '남' when '4' then '여' end as v_gender ")
	    .append(" , m_no                                                                                                                    ")
	    .append(" , substr(v_time,1,2) || ':' || substr(v_time,3,2) as v_time                                                               ")
	    .append(" , case v_confirm when 'Y' then '확인' when 'N' then '미확인' end as v_confirm                                                ")
	    .append("from tbl_vote_202005 where V_AREA = '제1투표장'                                                                               ");
  
    String sql = sb.toString();
	
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
	<div>투표검수조회</div>
	<table class="table">
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr align="center">
			<td><%= rs.getString("v_name") %></td>
			<td><%= rs.getString("v_birth") %></td>
			<td><%= rs.getString("v_age") %></td>
			<td><%= rs.getString("v_gender") %></td>
			<td><%= rs.getString("m_no") %></td>
			<td><%= rs.getString("v_time") %></td>
			<td><%= rs.getString("v_confirm") %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>