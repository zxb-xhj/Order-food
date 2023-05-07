package com.xhj.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.xhj.bean.Dishes;
import com.xhj.bean.Varieties;
import com.xhj.service.DishesService;
import com.xhj.service.VarietiesServie;

@Controller
@RequestMapping("/vt")
public class VarietiesController {
	
	@Autowired
	VarietiesServie varietiesServie;
	
	@Autowired
	DishesService dishesService;

	@RequestMapping("/vsall")
	@ResponseBody
	public List<Varieties> selectlist(){
		List<Varieties> list = varietiesServie.selectall();
		return list;
	}
	
	@RequestMapping("/vsid/{id}")
	@ResponseBody
	public Varieties selectid(@PathVariable("id")Integer id){
		Varieties list = varietiesServie.selectid(new Varieties(id));
		System.out.println(list);
		return list;
	}
	@RequestMapping("/login")
	@ResponseBody
	public String login(@RequestParam("file")MultipartFile file,@RequestParam("name")String name,Model model,
			HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(file);
		String filename = file.getOriginalFilename();
		String string = name+filename.substring(filename.lastIndexOf("."));
		System.out.println(name);
		System.out.println(string);
		System.out.println(filename);
		String path = "E:\\InteliJ IDEA\\Order\\WebContent\\img\\";
		System.out.println(path);
		File newFile = new File(path + string);
		file.transferTo(newFile);
		return "";
	}
	
	@RequestMapping("/insertvn")
	@ResponseBody
	public List<Varieties> insertvn(@RequestParam("name")String name) {
		int i = varietiesServie.selectmax();
		varietiesServie.insertvn(new Varieties(i+1,name));
		List<Varieties> list = varietiesServie.selectall();
		return list;
	}
	
	@RequestMapping("/deleteid")
	@ResponseBody
	public List<Varieties> deleteid(@RequestParam("id")Integer id) {
		dishesService.deletevid(id);
		varietiesServie.deletevsid(new Varieties(id));
		List<Varieties> list = varietiesServie.selectall();
		return list;
	}
}
