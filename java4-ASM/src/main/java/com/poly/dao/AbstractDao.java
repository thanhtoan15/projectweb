package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.util.JpaUtil;

public class AbstractDao<T> {

	public static final EntityManager entityManager = JpaUtil.getEntityManager();
	
	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}
	
	public T findById(Class<T> clazz, Integer id) {
		return entityManager.find(clazz, id);
	}
	
	public List<T> findAll (Class<T> clazz, Boolean existIsActive){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();
	}
	
	public List<T> findAll (Class<T> clazz, Boolean existIsActive, int pageNumber, int pageSize){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		query.setFirstResult((pageNumber -1 ) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
		/*
		  có 5 phần tử 
		  muốn: mỗi trang chứa 2 phần tử
		  >>> Tổng số trang có sẽ là 3 [0] [1] [2] [3] [4]
		  			trang 1 : có 2 phần tử
		  			trang 2 : có 2 phần tử
		  			trang 3 : có 1 phần tử
		  >>> vì câu query setFirstResult không đánh từ 1 mà đánh từu không nên ta trừ bớt đi 1
		  
		  >>> muốn lấy các phần tử ở trang thứ 2 >>> pageNumber = 3, pageSize = 2
		  (3-1)*2= 4 tức bắt đầy lấy từ phần tử thứ 4
		 
		 */			
	}
	
	//select o from user o where o.username = ?0 and o.password = ?1;
	// khi gọi đến hàm findOne >>> ta cần truyền vào class(vd: user.class nó chính là T), tiếp theo là truyền vào câu lệnh SQL,
	// sau đó là giá trị params(vd: username "linh" password "456") 
	
	public T findOne(Class<T> clazz, String sql, Object ... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for(int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> result = query.getResultList();
		if(result .isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<T> findMany(Class<T> clazz, String sql, Object ... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for(int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> findManyByNativeQuery(Class<T> clazz, String sql, Object ... params) {
		Query query = entityManager.createNativeQuery(sql, clazz);
		for(int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	public T create (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("Create succed!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot insert entity" + entity.getClass().getSimpleName() + "to DB");
			throw new RuntimeException(e);
		}
	}
	
	public T update (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
			System.out.println("Update succed!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot update entity" + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	
	
	public T detele (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity);
			entityManager.getTransaction().commit();
			System.out.println("Delete succed!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Cannot remove entity" + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
}
