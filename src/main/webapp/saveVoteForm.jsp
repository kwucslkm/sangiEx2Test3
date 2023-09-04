<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section {
		background-color : rightgray;
	}
	table {
		margin:0;
		
	}
	table, tr, th, td{
		border : solid 1px black;
		border-collapse : collapse;
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>	
<%@include file="nav.jsp" %>

<div id= "section">
	<form action ="saveVote.jsp" method="post" name="voteForm">
	<table>
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="v_jumin">예 : 8906153154726</td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="v_name"></td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
				<select name="m_no">
					<option value="1">[1]김후보</option>
					<option value="2">[2]이후보</option>
					<option value="3">[3]박후보</option>
					<option value="4">[4]조후보</option>
					<option value="5">[5]최후보</option>
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
			<td><input type="radio" name ="v_confirm" value="Y">확인
				<input type="radio" name="v_confirm" value="N">미확인
			</td>
		</tr>
		
	</table>
			<input type="submit" value="투표하기" onclick = "voteCheck()">
			<input type="button" onclick="reset()" value="다시하기">
	</form>			
</div>	
<%@include file="footer.jsp" %>	
	
</body>
<script>
	const reset = () => {
		alert("정보를 지우고 처음부터 다시 입력합니다.")
		document.voteForm.reset();
		document.voteForm.v_jumin.focus();
	}
	const voteCheck = () => {
		if (document.voteForm.v_jumin.value == "") {
            alert("주민번호가 입력되지 않았습니다!");
            document.voteForm.v_jumin.focus();
            return false;
        } else if (document.voteForm.v_name.value == "") {
            alert("성명이 입력되지 않았습니다!");
            document.voteForm.v_name.focus();
            return false;
        } else if (document.voteForm.m_no.value == "") {
            alert("후보번호가 선택되지 않았습니다!");
            document.voteForm.m_no.focus();
            return false;
        } else if (document.voteForm.v_time.value == "") {
            alert("투표시간이 입력되지 않았습니다!");
            document.voteForm.v_time.focus();
            return false;
        } else if (document.voteForm.v_area.value == "") {
            alert("투표장소가 입력되지 않았습니다!");
            document.voteForm.v_area.focus();
            return false;
        } else if (document.voteForm.v_confirm.value == "") {
            alert("유권자확인이 선택되지 않았습니다!");
            document.voteForm.v_confirm.focus();
            return false;
        }

        document.voteForm.submit();
	}
</script>
</html>