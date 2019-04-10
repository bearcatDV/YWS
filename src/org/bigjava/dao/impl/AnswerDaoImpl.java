package org.bigjava.dao.impl;

import java.util.List;

import org.bigjava.bean.Answer;
import org.bigjava.dao.AnswerDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class AnswerDaoImpl extends Answer implements AnswerDao {

	    private SessionFactory sessionFactory;
		
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}
		
		public Session getSession(){
			return this.sessionFactory.getCurrentSession();
		}
	
	    @Override
	    public void saveAnswer(Answer answer) {
		  getSession().save(answer);
	    	
		
	    }

		@Override
		public List getAllAnswers() {
			String hql="FROM Answer";
			Query query = getSession().createQuery(hql);
			
			List list =query.list();
			System.out.println("getAll2"+list);
			if(list == null){
				list= null;
			}

			return list;
		
		}

}
