<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<script type="text/javascript">
	function re() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.data.reset();
		data.m_jumin.focus
	}
	function checkValue() {
		if(!document.data.v_jumin.value) {
			alert("주민번호가 입력되지 않았습니다!");
			data.v_jumin.foucs;
			return false
		} else if(!document.data.v_name.value) {
			alert("성명이 입력되지 않았습니다!");
			data.v_name.foucs;
			return false
		} else if(document.data.m_no.value=="none") {
			alert("후보번호가 선택되지 않았습니다!");
			data.m_no.foucs;
			return false
		}
		 else if(!document.data.v_time.value) {
			alert("투표시간이 입력되지 않았습니다!");
			data.v_time.foucs;
			return false
		}
		 else if(!document.data.v_area.value) {
			alert("투표장소가 입력되지 않았습니다!");
			data.v_area.foucs;
			return false
		}
		 else if(!document.data.v_confirm.value) {
			alert("유권자확인이 선택되지 않았습니다!");
			data.v_confirm.foucs;
			return false
		}
	alert("투표하기 정보가 정상적으로 등록 되었습니다!")
	}
</script>
</head>
<body>
<jsp:include page="layout/header.jsp"/>
<jsp:include page="layout/nav.jsp"/>
<section class="section">
	<div>투표하기</div>
<form name="data" action="VotingP.jsp" method="post" onsubmit="return checkValue()">
	<table class = "table">
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="v_jumin">
			예 : 8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="v_name"></td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
				<select name="m_no">
					<option value="none"></option>
					<option value="1">[1] 김후보</option>
					<option value="2">[2] 이후보</option>
					<option value="3">[3] 최후보</option>
					<option value="4">[4] 장후보</option>
					<option value="5">[5] 민후보</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td><input type="text" name="v_time"></td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td><input type="text" name="v_area"></td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
				<input type="radio" name="v_confirm" value="Y"> 확인
				<input type="radio" name="v_confirm" value="N"> 미확인
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="투표하기">
				<input type="button" value="다시하기" onclick="re()">
			</td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="layout/footer.jsp"/>
</body>
</html>