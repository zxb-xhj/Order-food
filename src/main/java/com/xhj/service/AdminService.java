package com.xhj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xhj.bean.Admin;
import com.xhj.dao.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper mapper;

	public Admin gllogin(Admin admin) {
		return mapper.gllogin(admin);
	}
}
