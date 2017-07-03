<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.diary.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Controller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<% Growing_DiaryVO growing_diaryVO = (Growing_DiaryVO) request.getAttribute("growing_diaryVO"); %>
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
<title>������x��� - listOneMap_Mechanism.jsp</title>
</head>
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
			<div class="btn-group btnDiaryControl">
				<FORM NAME="updateOne" METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do">
				     <input type="hidden" name="gd_no" value="${growing_diaryVO.gd_no}">
				     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
				     <input type="hidden" name="action"	value="getOne_For_Update">
				</FORM>
				<FORM NAME="deleteOne" METHOD="post" ACTION="<%=request.getContextPath()%>/diary/growing_diary.do" data-confirm="�O�_�T�{�R��������x�H">
				    <input type="hidden" name="gd_no" value="${growing_diaryVO.gd_no}">
				    <input type="hidden" name="action"value="delete">
			    </FORM>
					<a href="javascript:document.updateOne.submit()" class="btn btn-default" role="button">�ק�</a>
			    	<a href="javascript:document.deleteOne.submit()" class="btn btn-default" role="button" id="deleteBtn">�R��</a>	 
			</div>
			<div class="oneDiaryBorder">
				<div class="col-xs-12 col-sm-12">
					<h3>${growing_diaryVO.gd_title}</h3>
					<% java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				  	   java.sql.Timestamp gd_date = growing_diaryVO.getGd_date();
					   String gd_date_toString = sdf.format(gd_date);
					%>
					<p><%= gd_date_toString %><br><br>
					${growing_diaryVO.gd_cnt}
					</p>
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
	
	<script>
		$(document).on('submit', 'form[data-confirm]', function(e){
		    if(!confirm($(this).data('confirm'))){
		        e.stopImmediatePropagation();
		        e.preventDefault();
		    }
		});
	</script>
	
</body>
</html>
