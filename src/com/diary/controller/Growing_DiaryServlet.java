package com.diary.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.diary.model.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)


public class Growing_DiaryServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String gd_no = req.getParameter("gd_no");
				if (gd_no == null || (gd_no.trim()).length() == 0) {
					errorMsgs.add("�п�J������x�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/diary/select_growing_diary_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/diary/select_growing_diary_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Growing_DiaryService growing_diarySvc = new Growing_DiaryService();
				Growing_DiaryVO growing_diaryVO = growing_diarySvc.getOneGrowing_Diary(gd_no);
				if (growing_diaryVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/diary/select_growing_diary_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("growing_diaryVO", growing_diaryVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/frontend/diary/listOneGrowing_Diary.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/diary/select_growing_diary_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				String gd_no = req.getParameter("gd_no");
				
				/***************************2.�}�l�d�߸��****************************************/
				Growing_DiaryService growing_diarySvc = new Growing_DiaryService();
				Growing_DiaryVO growing_diaryVO = growing_diarySvc.getOneGrowing_Diary(gd_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("growing_diaryVO", growing_diaryVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/frontend/diary/update_growing_diary_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƨ��X�ɥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String gd_no = req.getParameter("gd_no").trim();
				String baby_no = req.getParameter("baby_no").trim();
				String gd_title = req.getParameter("gd_title").trim();	
				String gd_cnt = req.getParameter("gd_cnt").trim();
				Timestamp gd_date = java.sql.Timestamp.valueOf(req.getParameter("gd_date").trim());
				String gd_shr = toRealNull(req.getParameter("gd_shr").trim());
				
				Growing_DiaryVO growing_diaryVO = new Growing_DiaryVO();
				
				growing_diaryVO.setGd_no(gd_no);
				growing_diaryVO.setBaby_no(baby_no);
				growing_diaryVO.setGd_title(gd_title);
				growing_diaryVO.setGd_cnt(gd_cnt);
				growing_diaryVO.setGd_date(gd_date);
				growing_diaryVO.setGd_shr(gd_shr);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("growing_diaryVO", growing_diaryVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/diary/update_growing_diary_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Growing_DiaryService growing_diarySvc = new Growing_DiaryService();
				growing_diaryVO = growing_diarySvc.updateGrowing_Diary(gd_no, gd_title, gd_date, gd_cnt, gd_shr);
				growing_diaryVO = growing_diarySvc.getOneGrowing_Diary(gd_no);
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("growing_diaryVO", growing_diaryVO);
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/diary/update_growing_diary_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				java.sql.Timestamp gd_date = null;
				// ���o�ثe�ɤ���
				/*Calendar calendar = Calendar.getInstance();
				int timeNow = (calendar.get(Calendar.HOUR_OF_DAY) * 60 * 60 * 1000) + 
						      (calendar.get(Calendar.MINUTE) * 60 * 1000) +
						      (calendar.get(Calendar.SECOND) * 1000);*/
				try {
					gd_date = Timestamp.valueOf(req.getParameter("gd_date").trim());
				} catch (IllegalArgumentException e) {
					gd_date = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
				String baby_no = req.getParameter("baby_no").trim();
				String gd_title = req.getParameter("gd_title").trim();
				String gd_cnt = req.getParameter("gd_cnt").trim();
				String gd_shr = req.getParameter("gd_shr").trim();
				
				

				Growing_DiaryVO growing_diaryVO = new Growing_DiaryVO();
				
				growing_diaryVO.setBaby_no(baby_no);
				growing_diaryVO.setGd_title(gd_title);
				growing_diaryVO.setGd_date(gd_date);
				growing_diaryVO.setGd_cnt(gd_cnt);
				growing_diaryVO.setGd_shr(gd_shr);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("growing_diaryVO", growing_diaryVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/diary/addGrowing_Diary.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Growing_DiaryService growing_diarySvc = new Growing_DiaryService();
				growing_diaryVO = growing_diarySvc.addGrowing_Diary(baby_no, gd_title, gd_date, gd_cnt, gd_shr);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/frontend/diary/listAllGrowing_Diary.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/diary/addGrowing_Diary.jsp");
				failureView.forward(req, res);
			}
		}
		
       
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp ��  /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j

			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				String[] deleteDiaryList = req.getParameterValues("deleteDiaryList");
				
				/***************************2.�}�l�R�����***************************************/
				Growing_DiaryService growing_diarySvc = new Growing_DiaryService();
				if(deleteDiaryList != null) {
					if(deleteDiaryList.length != 0) {
						for(String gd_no:deleteDiaryList) {
						Growing_DiaryVO growing_diaryVO = growing_diarySvc.getOneGrowing_Diary(gd_no);
						growing_diarySvc.deleteGrowing_Diary(gd_no);
						}
					}
				}else {
					String gd_no = req.getParameter("gd_no");
					Growing_DiaryVO growing_diaryVO = growing_diarySvc.getOneGrowing_Diary(gd_no);
					growing_diarySvc.deleteGrowing_Diary(gd_no);
				}
				/***************************3.�R������,�ǳ����(Send the Success view)***********/
//				DeptService deptSvc = new DeptService();
//				if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") || requestURL.equals("/dept/listAllDept.jsp"))
//					req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno())); // ��Ʈw���X��list����,�s�Jrequest
				
				String url = "";
				if(requestURL == null) {
					url = "/frontend/diary/listAllGrowing_Diary.jsp";
				}else {
					url = requestURL;
				}
					
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
	
	public String toRealNull(String str) {
		if(str.equals("null")) {
			return null;
		}else {
			return str;
		}
		
	}
}
