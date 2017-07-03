<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.diary.model.*"%>
<%
	Growing_DiaryVO growing_diaryVO = (Growing_DiaryVO) request.getAttribute("growing_diaryVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
	<script src="/BA101G3/utility/ckeditor/ckeditor.js"></script>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<link rel="stylesheet" href="/BA101G3/utility/ckeditor/contents.css">
	<script src="/BA101G3/utility/ckfinder/ckfinder.js"></script>
	<script>
		$(document).ready(function() {
			var editor = CKEDITOR.replace( 'gd_cnt', {
				width:680,
				filebrowserBrowseUrl : '/BA101G3/utility/ckfinder/ckfinder.html',
				filebrowserImageBrowseUrl : '/BA101G3/utility/ckfinder/ckfinder.html?type=Images', 
				filebrowserFlashBrowseUrl : '/BA101G3/utility/ckfinder/ckfinder.html?type=Flash',
				filebrowserUploadUrl : '/BA101G3/utility/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
				filebrowserImageUploadUrl : '/BA101G3/utility/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
				filebrowserFlashUploadUrl : '/BA101G3/utility/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 
			});
			CKFinder.setupCKEditor( editor, '/ckfinder/' );
		});
		
	</script>
	<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- 	<script>
		$(function() {
			$("#datepicker").datepicker({
				showOn : "button",
				buttonImage : "/BA101G3/pic/icon/calendar_02.png",
				buttonImageOnly : true,
				changeMonth: true,
				changeYear: true,
				dateFormat: 'yy-mm-dd',
			});
		});
	</script>
	<style>
		img.ui-datepicker-trigger{
			width: 21px;
			position: relative;
			margin-left: 8px;
			vertical-align: middle;
		}
	</style> -->
	<!-- datepicker -->
	<!-- cxCalendar -->
	<link rel="stylesheet" href="/BA101G3/utility/jQuery.cxCalendar-1.5.3/css/jquery.cxcalendar.css">
	<!-- cxCalendar -->
<title>������x��ƭק� - update_growing_diary_input.jsp</title></head>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>������x��ƭק� - update_growing_diary_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/diary/select_growing_diary_page.jsp">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do" name="form1" enctype="multipart/form-data">
<table border="0">
	<tr>
		<td>������x�s��:<font color=red><b>*</b></font></td>
		<td><%=growing_diaryVO.getGd_no()%></td>
	</tr>
	<tr>
		<td>������x���:</td>
		<% java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   java.sql.Timestamp gd_date = growing_diaryVO.getGd_date();
		   String gd_date_toString = sdf.format(gd_date);
		%>
		<td><input type="text" id="cxCalendar" name="gd_date" value="<%= gd_date_toString %>" /></td>
	</tr>
	<!-- cxCalendar -->
	<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
	<script src="/BA101G3/utility/jQuery.cxCalendar-1.5.3/js/jquery.cxcalendar.min.js"></script>
	<script src="/BA101G3/utility/jQuery.cxCalendar-1.5.3/js/jquery.cxcalendar.languages.js"></script>
	<script>

	$("#cxCalendar").cxCalendar({
  		type: 'datetime',
  		format: 'YYYY-MM-DD HH:mm:ss'
	});

	</script>
	<!-- cxCalendar -->
	<tr>
		<td>������x���D:</td>
		<td><input type="TEXT" name="gd_title" size="45"	value="<%=growing_diaryVO.getGd_title()%>" /></td>
	</tr>
	<tr>
		<td>������x���e:</td>
		<td><textarea rows="10" cols="80" name="gd_cnt" id="gd_cnt" >
			<%=growing_diaryVO.getGd_cnt()%>
			</textarea>
		</td>
	</tr>
	<tr>
		<td>���ɽd��:</td>
		<td>
			<input type="radio" name="gd_shr" value="0" id="0"><label for="0">�ȭ��ۤv</label><br>
  			<input type="radio" name="gd_shr" value="1" id="1"><label for="1">�ȭ��n��</label><br>
 			<input type="radio" name="gd_shr" value="2" id="2"><label for="2">���}</label>
 		<script>
			var gd_shr = "${growing_diaryVO.gd_shr}";
			document.getElementById(gd_shr).checked = true;
		</script>
		</td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="gd_no" value="${growing_diaryVO.gd_no}">
<input type="hidden" name="baby_no" value="${growing_diaryVO.baby_no}">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>

<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>
</body>
</html>
