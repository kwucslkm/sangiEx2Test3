<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test3.model.VoteDAO"%>
<%@ page import="com.test.test3.model.MemberDTO" %>
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
	table, tr, th, td {
		text-align : center;
		border : solid 1px gray;
		border-collapse : collapse;
	}
	h2 {
		text-align : center;
	}
</style>
</head>

<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<h2> 후보조회</h2>
<div id="section">
	<table>
	<tr>
		<th>후보번호</th>
		<th>성명</th>
		<th>소속정당</th>
		<th>학력</th>
		<th>주민번호</th>
		<th>지역구</th>
		<th>대표번호</th>
	</tr>
	<% 
	request.setCharacterEncoding("utf-8");
	VoteDAO m = new VoteDAO();
	List<MemberDTO> memberDTOList = m.findMember();
	for (MemberDTO memberDTO : memberDTOList){
		
	%>
	<tr>
		<td><%=memberDTO.getM_no() %></td>
		<td><%=memberDTO.getM_name() %></td>
		<td><%=memberDTO.getP_name() %></td>
		<td><%=memberDTO.getP_school() %></td>
		<td><%=memberDTO.getM_jumin() %></td>
		<td><%=memberDTO.getM_city() %></td>
		<td><%=memberDTO.getP_tel() %></td>
	</tr>
	<%
	}
	%>
	
	</table>
</div>
<%@include file="footer.jsp" %>
</body>
</html>