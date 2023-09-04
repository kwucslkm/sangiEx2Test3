<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test3.model.VoteDAO"%>
<%@ page import="com.test.test3.model.VoteDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		margin : auto;
	}
	table, tr,th,td {
		border : solid 1px gray;
		border-collapse : collapse;
	}
	h2 {
		text-align: center;
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<h2> 투표검수조회</h2>
<div id="section">
	<table>
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
	request.setCharacterEncoding("utf-8");
	VoteDAO v = new VoteDAO();
	List<VoteDTO> vList = v.voteList();
	for (VoteDTO voteDTO : vList){
		
	%>
	<tr>
		<td><%=voteDTO.getV_name() %></td>
		<td><%=voteDTO.getV_birth() %></td>
		<td><%=voteDTO.getV_age() %></td>
		<td><%=voteDTO.getV_gender() %></td>
		<td><%=voteDTO.getM_no() %></td>
		<td><%=voteDTO.getV_time() %></td>
		<td><%=voteDTO.getV_confirm() %></td>

	</tr>
	<%
	}
	%>
	
	</table>
</div>
<%@include file="footer.jsp" %>
</body>
</html>