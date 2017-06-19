package com.article.model;

import java.util.*;

public interface ArticleDAO_interface {
	      public void insert(ArticleVO articleVO);
          public void update(ArticleVO articleVO);
          public void delete(String art_no);
          public ArticleVO findByPrimaryKey(String art_no);
	      public List<ArticleVO> getAll();
}
