package org.bigjava.dao;

import java.util.List;

import org.bigjava.bean.Review;

public interface ReviewDao {

 
	 public void saveReview(Review review);
	 public List getAllReview();
}
