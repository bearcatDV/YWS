package org.bigjava.dao;

import org.bigjava.bean.Article;

public interface ArticleDao {
	/**
	 * 添加文章
	 */
	public Boolean add(Article article);
}
