<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.diary.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Controller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<% Growing_DiaryVO growing_diaryVO = (Growing_DiaryVO) request.getAttribute("growing_diaryVO"); %>
<html>
<head>
<title>������x��� - listOneMap_Mechanism.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1000'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>������x��� - listOneMap_Mechanism.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/diary/select_growing_diary_page.jsp">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='1000'>
	<tr>
		<th>������x�s��</th>
		<th>����s��</th>
		<th>������x���D</th>
		<th>������x���</th>
		<th>������x���e</th>
		<th>���ɽd��</th>
	</tr>
	<tr align='center' valign='middle'>
			<td>${growing_diaryVO.gd_no}</td>
			<%-- <td>${growing_diaryVO.baby_no}</td> --%>
			<td><%= growing_diaryVO.getBaby_no() %></td>
			<td>${growing_diaryVO.gd_title}</td>
			<% java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			   java.sql.Timestamp gd_date = growing_diaryVO.getGd_date();
			   String gd_date_toString = sdf.format(gd_date);
			%>
			<td><%= gd_date_toString %></td>
			<td>${growing_diaryVO.gd_cnt}</td>			
			<td>
				<c:choose>
					<c:when test="${growing_diaryVO.gd_shr == '0'}">�ȭ��ۤv</c:when>
					<c:when test="${growing_diaryVO.gd_shr == '1'}">�ȭ��n��</c:when>
					<c:when test="${growing_diaryVO.gd_shr == '2'}">���}</c:when>	
				</c:choose>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="gd_no" value="${growing_diaryVO.gd_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="gd_no" value="${growing_diaryVO.gd_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
	</tr>
</table>

</body>
</html>
