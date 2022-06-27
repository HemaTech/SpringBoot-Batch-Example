package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import com.websystique.springmvc.model.Course;


public class CourseDaoImpl extends AbstractDao<Integer, Course> implements CourseDao  {

	@SuppressWarnings("unchecked")
	public List<Course> findCourses() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Course> course = (List<Course>) criteria.list();
		
		return course;
	}
}
