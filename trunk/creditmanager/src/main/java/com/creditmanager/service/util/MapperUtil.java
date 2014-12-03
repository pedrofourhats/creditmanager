package com.creditmanager.service.util;

import java.util.ArrayList;
import java.util.List;

import org.dozer.Mapper;

public class MapperUtil {
	public static <T, U> List<U> map(final Mapper mapper, final List<T> source, final Class<U> destType){
		final List<U> destination = new ArrayList<U>();
		for(T item : source){
			destination.add(mapper.map(item, destType));
		}
		return destination;
	}
}
