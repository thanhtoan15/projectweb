package com.poly.service;

import java.util.List;

import com.poly.entity.Video;

public interface VideoService {
	Video findById(Integer id);
	Video finByHref(String href);
	List<Video> findAll();
	List<Video> finAll( int pageNumber, int pageSize);
	Video create (Video entity);
	Video update (Video entity);
	Video delete (String href);
}
