package com.diary.model;

import java.util.List;

public interface BabyDAO_interface {
	public void insert(BabyVO babyVO);
	public void update(BabyVO babyVO);
	public BabyVO findByPrimary(String baby_no);
	public List<BabyVO>getAll();

}
