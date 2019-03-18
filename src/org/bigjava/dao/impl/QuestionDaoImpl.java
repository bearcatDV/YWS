package org.bigjava.dao.impl;

import org.bigjava.bean.Question;
import org.bigjava.dao.QuestionDao;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class QuestionDaoImpl implements QuestionDao {

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void FileSave(Question question) {
		hibernateTemplate.save(question);

	}

}
