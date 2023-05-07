package com.xhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhj.bean.Orde;
import com.xhj.dao.OrdeMapper;

@Service
public class OrdeService {

	@Autowired
	OrdeMapper mapper;
	
	public List<Orde> selectod(){
		return mapper.selectod();
	}

	public List<Orde> selectuserid(Integer id){
		return mapper.selectuserid(id);
	}
	
	public int insertorder(Orde orde){
		System.out.println("service "+orde);
		return mapper.insertorder(orde);
	}
	
	public int deleteoid(Integer id){
		return mapper.deleteoid(id);
	}
	
	public String selectmax(){
		return mapper.selectmax();
	}

	public Orde selectid(Integer id){
		return mapper.selectid(id);
	}
}
