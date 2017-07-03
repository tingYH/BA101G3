<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.diary.model.*"%>
<%
	Growing_DiaryVO growing_diaryVO = (Growing_DiaryVO) request.getAttribute("growing_diaryVO");
%>

<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>BaBeQ</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/BA101G3//frontend/css/babeq.css">
	<!--[if lt IE 9]>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/BA101G3/utility/ckeditor/ckeditor.js"></script>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<link rel="stylesheet" href="/BA101G3/utility/ckeditor/contents.css">
	<script src="/BA101G3/utility/ckfinder/ckfinder.js"></script>
	<script>
		$(document).ready(function() {
			var editor = CKEDITOR.replace( 'gd_cnt', {
				width:'100%',
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
<title>������x��Ʒs�W - addGrowing_Diary.jsp</title></head>

<body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
			<div class="container">
					<!-- ������ÿ��� -->
					<div><a class="navbar-brand" href="index.html"><img src="/BA101G3/frontend/pic/babeq3.png" width="230"></a></div>
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<!-- �k��� -->
			
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="navbarIcon dropdown-toggle dropdownColor" data-toggle="dropdown">
									<img class="headerIcon" src="/BA101G3/frontend/pic/list_01.png" width="80">
								</a>
								<ul class="dropdown-menu menuList arrow_box">
								    <li class="dropdown-submenu">
								    	<a href="#">�|���M��</a>
								    	<ul class="dropdown-menu submenuList">
								    		<li><a href="#">�|����ƭק�</a></li>
								    		<li><a href="#">�ӽи�`�����������</a></li>
								    		<li><a href="#">�ӽбM�a���</a></li>
								    		<li><a href="#">�q��޲z</a></li>
								    		<li><a href="#">�n��/�s�պ޲z</a></li>
								    		<li><a href="#">���`�@��</a></li>
								    		<li><a href="#">���`�峹</a></li>
								    	</ul>
								    </li>
										<li class="dropdown-submenu"><a href="#">������x�޲z</a>
											<ul class="dropdown-menu submenuList">
								    		<li><a href="diary.html">������x</a></li>
								    		<li><a href="#">�ۤ�</a></li>
								    		<li><a href="#">�v��</a></li>
								    	</ul>
										</li>
										<li class="dropdown-submenu"><a href="#">�峹�M��</a>
											<ul class="dropdown-menu submenuList">
								    		<li><a href="#">�M�a�峹�M��</a></li>
								    		<li><a href="#">��`���������g�����</a></li>
								    	</ul>
										</li>
									<li><a href="#">���ݱM��</a></li>
										<li><a href="#">�ʪ��M��</a></li>
									<li><a href="#">�a�ϱM��</a></li>
									<li><a href="#">�̷s����</a></li>
								</ul>
							</li>
							<li><a href="#" class="navbarIcon"><img class="headerIcon" src="/BA101G3/frontend/pic/ring_01.png" width="80"></a></li>
							<li><a href="#" class="navbarIcon"><img class="headerIcon" src="/BA101G3/frontend/pic/login_01.png" width="80"></a></li>
						</ul>
					</div>
					<img src="/BA101G3/frontend/pic/pencilline.png" class="navbarLine" style="margin-top: 0px">
					<!-- ������ÿ��ϵ��� -->
				</div>
			</nav>
		</header>

	<section>
		<div class="container">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1 centerTable">
				<table border='1' cellpadding='5' cellspacing='0' style='width: 100%'>
					<tr align='center' valign='middle' height='20'>
						<td>
							<div class='tableTitleBorder'>
								<h3>������x��Ʒs�W - addGrowing_Diary.jsp</h3>
						   		<a href="<%=request.getContextPath()%>/frontend/diary/select_growing_diary_page.jsp">�^����</a>
							</div>
					    </td>
					</tr>
				</table>
				
				<h3>������x���:</h3>
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
				
				<FORM NAME="insertConfirm" METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do" name="form1" enctype="multipart/form-data">
				<table border="0" style='width: 100%'>
					<!-- <tr>
						<td>������x���:</td>
						<td><input type="text" id="datepicker" name="gd_date" /></td>
					</tr> -->
					<tr>
						<td>������x���:</td>
						<td><input type="text" id="cxCalendar" name="gd_date"></td>
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
						<td>����s��:</td>
						<td><input type="TEXT" name="baby_no" size="45" 
							value="<%= (growing_diaryVO==null)? "" : growing_diaryVO.getBaby_no()%>" /></td>
					</tr>
					<tr>
						<td>������x���D:</td>
						<td><input type="TEXT" name="gd_title" size="45"
							value="<%= (growing_diaryVO==null)? "" : growing_diaryVO.getGd_title()%>" /></td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">������x���e:</td>
						<td><textarea rows="10" cols="80" name="gd_cnt" id="gd_cnt" style="max-width: 100%;">
							<%= (growing_diaryVO==null)? "" : growing_diaryVO.getGd_cnt()%>
							</textarea>
						</td>
					</tr>
					<tr>
						<td>���ɽd��:</td>
						<td>
							<input type="radio" name="gd_shr" value="0" id="0" checked><label for="0">�ȭ��ۤv</label><br>
				  			<input type="radio" name="gd_shr" value="1" id="1"><label for="1">�ȭ��n��</label><br>
				 			<input type="radio" name="gd_shr" value="2" id="2"><label for="2">���}</label>
						</td>
					</tr>
				</table>
				<br>
				<input type="hidden" name="action" value="insert">
				</FORM>
			</div>
			<div class="col-xs-12 col-sm-10 col-sm-offset-1 updateConfirmPadding">
				<div class="btn-group btnDiaryControl">
					<a href="javascript:document.insertConfirm.submit()" class="btn btn-default updateConfirm" role="button">�e�X�s�W</a>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<div class="container">
			<img src="/BA101G3/frontend/pic/pencilline.png" class="navbarLine">
			<div class="footerBottom navbar-right navbar-nav">
				<a href="#" class="navbarIcon"><img class="headerIcon" src="/BA101G3/frontend/pic/chat_01.png" width="80"></a>
			</div>
		</div>
	</footer>
	
</body>

</html>
