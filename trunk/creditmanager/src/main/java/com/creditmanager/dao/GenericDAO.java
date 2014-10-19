package com.creditmanager.dao;

import java.io.Serializable;

public interface GenericDAO <T, PK extends Serializable> {

	public void add(T t);
	
	public void delete(T t);
	
	public T getById(PK id);
}
