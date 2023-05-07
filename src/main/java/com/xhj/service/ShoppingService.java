package com.xhj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhj.bean.Dishes;
import com.xhj.bean.Shopping;
import com.xhj.dao.ShoppingMapper;


@Service
public class ShoppingService {
	
	@Autowired
	ShoppingMapper mapper;
	
	public List<Shopping> gowu(){
		List<Shopping> list = mapper.gowu();
		return list;
	}
	
	public String gowu1(String name){
		String i = mapper.gowu1(name);
		return i;
	}
	
	public int price() {
		String price = mapper.price();
		if(price!=null) {
			int price1 = Integer.parseInt(price);
			return price1;
		}
		return 0;
	}

	public int deleteid(Integer id) {
		int i = mapper.deleteid(id);
		System.out.println("deleteidservice"+id);
		return i;
	}

	public int insert(Shopping gowu) {
		int i = mapper.insert1(gowu);
		return i;
	}
	
	public Shopping selectById(Integer id) {
		Shopping gowu = mapper.selectById(id);
		return gowu;
	}
	
	public int updateid(Shopping gowu) {
		int i = mapper.updateid(gowu);
		return i;
	}
	
	public int deleteall() {
		int i = mapper.deleteall();
		return i;
	}
	
	public int deletelist(List<Integer>  list){
		return mapper.deletelist(list);
	}


}
