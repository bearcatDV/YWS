package org.bigjava.dao;

import org.bigjava.bean.Comment;

public interface CommentDao {
	
	/**
	 * 存储评论
	 * @param comment
	 */
	public void savaComment(Comment comment);
}
