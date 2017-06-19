package com.question.model;

import java.util.*;

public interface QuestionDAO_interface {
	 public void insert(QuestionVO questionVO);
     public void delete(String qu_no);
     public QuestionVO findByPrimaryKey(String qu_no);
     public List<QuestionVO> getAll();
   //萬用複合查詢(傳入參數型態Map)(回傳 List)
   // public List<QuestionVO> getAll(Map<String, String[]> map);
}



