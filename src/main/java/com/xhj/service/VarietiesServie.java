package com.xhj.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhj.bean.Dishes;
import com.xhj.bean.Varieties;
import com.xhj.dao.VarietiesMapper;


@Service
public class VarietiesServie {
	
	@Autowired
	VarietiesMapper mapper;

	
	public List<Varieties> selectall(){
		List<Varieties> list = mapper.selectall();
		return list;
	}
	
	public List<Dishes> selectById(Integer id){
		List<Dishes> list = mapper.selectById(id);
		return list;
	}
	
	public int updateid(Varieties varieties) {
		return mapper.updateid(varieties);
	}
	
	public int deletevsid(Varieties varieties) {
		return mapper.deletevsid(varieties);
	}
	
	public Varieties selectid(Varieties varieties) {
		return mapper.selectid(varieties);
	}
	
	public int insertvn(Varieties varieties) {
		return mapper.insertvn(varieties);
	}
	
	public int selectcount() {
		return mapper.selectcount();
	}
	
	public int selectmax() {
		return mapper.selectmax();
	}
}
