package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import com.websystique.springmvc.model.Branch;
import com.websystique.springmvc.model.Course;

public class BranchDaoImpl extends AbstractDao<Integer, Branch> implements BranchDao{

	@SuppressWarnings("unchecked")
	public List<Branch> findCourses(int i) {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Branch> branch = (List<Branch>) criteria.list();
		
		return branch;
	}
}
