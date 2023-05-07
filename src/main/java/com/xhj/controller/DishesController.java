package com.xhj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.xhj.bean.Dishes;
import com.xhj.bean.Shopping;
import com.xhj.bean.Orde;
import com.xhj.bean.Varieties;
import com.xhj.service.DishesService;
import com.xhj.service.ShoppingService;
import com.xhj.service.VarietiesServie;

@Controller
@RequestMapping("/ds")
public class DishesController {
	
	@Autowired
	DishesService ds;
	
	@Autowired
	ShoppingService gs;
	
	@Autowired
	VarietiesServie vs;
	
	@RequestMapping("/dishes")
	public String dishes(Model model) {
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();

		List<Shopping> list1 = gs.gowu();
		System.out.println(list);
//		PageInfo pageInfo = new PageInfo(list);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("Varieties", Varieties);
		return "t1";
	}

	@RequestMapping("/guanli")
	public String guanli(Model model) {
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();

		List<Shopping> list1 = gs.gowu();
		System.out.println(list);
//		PageInfo pageInfo = new PageInfo(list);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("Varieties", Varieties);
		return "t2";
	}

	@RequestMapping("/guanli1")
	public String guanli1(Model model) {
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();

		List<Shopping> list1 = gs.gowu();
		System.out.println(list);
//		PageInfo pageInfo = new PageInfo(list);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("Varieties", Varieties);
		return "t4";
	}
	
	@RequestMapping("/dishes1")
	public String dishes1(Model model) {
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();

		List<Shopping> list1 = gs.gowu();
		System.out.println(list);
//		PageInfo pageInfo = new PageInfo(list);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("Varieties", Varieties);
		return "login";
	}
	
	
	@RequestMapping("/all")
	@ResponseBody
	public Map<String,Object> all() {
		Map<String,Object> map=new HashMap<String,Object>();
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();
		int i = vs.selectcount();
		map.put("list", list);
		map.put("Varieties", Varieties);
		map.put("i", i);
		return map;
	}
	
	
	@RequestMapping(value="/signature/{id}")
	@ResponseBody
	public Map<String,Object> aa(@PathVariable("id")Integer id,
			Model model) {
		System.out.println(id);
		List<Dishes> list = ds.selectvid(id);
		Map<String,Object> map=new HashMap<String,Object>();
		List<Varieties> Varieties = vs.selectall();
		map.put("list", list);
		map.put("Varieties", Varieties);
		return map;
	}
	
	@RequestMapping("/suos/{name}")
	@ResponseBody
	public Map<String,Object> suos(@PathVariable("name")String name) {
		Map<String,Object> map=new HashMap<String,Object>();
		List<Dishes> list = ds.mohu(name);
		List<Varieties> Varieties = vs.selectall();
		map.put("list", list);
		map.put("Varieties", Varieties);
		return map;
	}
	
	@RequestMapping("/deletedsid/{id}/{dname}")
	@ResponseBody
	public void deletedsid(@PathVariable("id")Integer id,@PathVariable("dname")String name,HttpServletRequest request) {
		System.out.println(id);
		String path = "E:\\InteliJ IDEA\\Order\\WebContent\\img\\";
		//获取图片
		System.out.println(name);
		File newFile = new File(path+name+".jpeg");
		
		if(newFile.isFile() && newFile.exists()) {
			//如果有就删除
			System.out.println(newFile.delete());
		}
		ds.deletedsid(new Dishes(id));
	}
	
	@RequestMapping("/insertds")
	@ResponseBody
	public void insertds(@RequestParam("dname")String dname,
			@RequestParam("select")Integer vid,
			@RequestParam("price")String price,
			@RequestParam("file")String file,HttpServletRequest request) throws Exception {
		//更改图片名称
		String string = dname+".jpeg";
		//截取图片名称
		String string1 = file.substring(12);
		//获取图片
		File newFile = new File("C:\\Users\\DELL\\Desktop\\caipi\\"+string1);
		//转换成MultipartFile
		InputStream inputStream2 = new FileInputStream(newFile);
		System.out.println(inputStream2);
		MultipartFile mockMultipartFile = new MockMultipartFile(newFile.getName(), inputStream2);
		System.out.println(mockMultipartFile);
		//获取图片要存放的地址
		String path = "E:\\InteliJ IDEA\\Order\\WebContent\\img\\";
		System.out.println(path);
		File newFile1 = new File(path + string);
		if(newFile1.isFile() && newFile1.exists()) {
			System.out.println(newFile1.delete());
		}
		//存入磁盘
		mockMultipartFile.transferTo(newFile1);
		ds.insertds(new Dishes(dname,price,vid));
		System.out.println(newFile1);
		
		System.out.println(string);
		System.out.println(dname);
		System.out.println(vid);
		System.out.println(price);
		System.out.println(file);
	}
	
	
	

}
