package com.xhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhj.bean.Dishes;
import com.xhj.bean.Shopping;
import com.xhj.dao.DishesMapper;

@Service
public class DishesService {
	
	@Autowired
	DishesMapper mapper;
	
	public List<Dishes> getDoshes(){
		List<Dishes> list = mapper.selectall();
		System.out.println(list);
		return list;
	}
	
	public List<Dishes> mohu(String name){
		List<Dishes> list =mapper.mohu(name);
		return list;
	}
	
	public List<Dishes> selectvid(Integer id){
		List<Dishes> list = mapper.selectvid(id);
		return list;
	}
	
	public int deleteById(Integer id) {
		int i = mapper.deleteByPrimaryKey(id);
		return i;
	}
	
	public Dishes selectById(Integer id){
		Dishes dishes = mapper.selectid(id);
		return dishes;
	}
	
	public int updateid(Dishes dishes) {
		int i = mapper.updateid(dishes);
		return i;
	}
	
	public int updateall() {
		int i = mapper.updateall();
		return i;
	}
	
	public Dishes seledname(Dishes dishes) {
		return mapper.seledname(dishes);
	}

	public int deletedsid(Dishes dishes) {
		return mapper.deletedsid(dishes);
	}
	
	public int deletevid(Integer vid) {
		return mapper.deletevid(vid);
	}
	
	public int insertds(Dishes dishes) {
		return mapper.insertds(dishes);
	}
	
	public int updateds(Dishes dishes) {
		return mapper.updateds(dishes);
	}

}
