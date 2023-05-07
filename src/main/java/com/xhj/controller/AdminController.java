package com.xhj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.xhj.bean.*;
import com.xhj.service.*;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/gl")
public class AdminController {
	
	@Autowired
	AdminService adminservice;

	@Autowired
	OrdeService ordeService;
	
	@Autowired
	DishesService ds;

	@Autowired
	UserService userService;
	
	@Autowired
	ShoppingService gs;
	
	@Autowired
	VarietiesServie vs;

	@GetMapping("/t3")
	public String t3(HttpServletResponse response) throws IOException {
		return "t3";
	}

	@GetMapping("/adminSelectAllServlet")
	public void ssss(HttpServletResponse response) throws IOException {
		List<User> selectuser = userService.selectuser();

		String jsonuser = JSON.toJSONString(selectuser);
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write(jsonuser);
	}
	
	@PostMapping("/fileajax")
	@ResponseBody
	public String sss(Model m,@RequestPart("file")String file) {
		m.addAttribute("mm","你好");
		m.addAttribute("file",file);
		
		return "你好";
	}
	
	@RequestMapping("/login")
	public String xiugai(Model model) throws IOException {
		List<Dishes> list = ds.getDoshes();
		List<Varieties> Varieties = vs.selectall();
		List<Shopping> list1 = gs.gowu();
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("Varieties", Varieties);
		return "login";
	}

	@RequestMapping("/log")
	@ResponseBody
	public void xiugai1(Model model,@RequestParam("name")String name,@RequestParam("pwd")String pwd,
						  HttpServletResponse response) throws IOException {
		Admin gllogin = adminservice.gllogin(new Admin(name,pwd));
		System.out.println(gllogin);
		if(gllogin!=null) {
			response.getWriter().write("sussss");
		}else {
			response.getWriter().write("");
		}
	}


	@RequestMapping("/login1")
	@ResponseBody
	public String xiugai1(HttpServletRequest request) {
			return "redirect:/ds/dishes1";
			
	}
	
	@RequestMapping("/shanchuv/{id}/{name}")
	@ResponseBody
	public List<Varieties> shanchuv(@PathVariable("id")Integer id,@PathVariable("name")String name,Model model) {
		System.out.println(id);
		System.out.println(name);
		vs.updateid(new Varieties(id,name));
		List<Varieties> list = vs.selectall();
		return list;
	}
	
	@RequestMapping("/shanchuv/{id}")
	@ResponseBody
	public List<Varieties> deletevsid(@PathVariable("id")Integer id,Model model) {
		System.out.println(id);
		vs.deletevsid(new Varieties(id));
		List<Varieties> list = vs.selectall();
		return list;
	}
	
	@RequestMapping("/xiugai")
	@ResponseBody
	public void updet(@RequestParam("did")Integer id,@RequestParam("dname")String dname,@RequestParam("price")String price,
			@RequestParam("select")Integer vid,@RequestParam(value="file",required=false)String file,
			@RequestParam("dname1")String name,HttpServletRequest request) throws Exception {
//		Integer id1 = Integer.parseInt(request.getParameter("did"));
		if(file!=null&&file!="") {
			//截取图片名称
			String string = file.substring(12);
			//获取图片
			File newFile = new File("C:\\Users\\DELL\\Desktop\\caipi\\"+string);
			//转换成MultipartFile
			InputStream inputStream2 = new FileInputStream(newFile);
			MultipartFile mockMultipartFile = new MockMultipartFile(newFile.getName(), inputStream2);
			//获取图片要存放的地址
			String path = "E:\\InteliJ IDEA\\Order\\WebContent\\img\\";
			//更改图片名称
			String string1 = dname+".jpeg";
			
			File file2 = new File(path+string1);
			if(file2.isFile() && file2.exists()) {
				System.out.println(file2.delete());
			}
			//存入磁盘
			mockMultipartFile.transferTo(file2);
		}else {
			String path = "E:\\InteliJ IDEA\\Order\\WebContent\\img\\";
			//获取图片
			File newFile = new File(path+name+".jpeg");
			//转换成MultipartFile
			InputStream inputStream2 = new FileInputStream(newFile);
			MultipartFile mockMultipartFile = new MockMultipartFile(newFile.getName(), inputStream2);
			//更改名称
			String string1 = dname+".jpeg";
			File file2 = new File(path+string1);
			if(newFile.isFile() && newFile.exists()) {
				//如果有就删除
				System.out.println(newFile.delete());
			}
			//存入磁盘
			mockMultipartFile.transferTo(file2);
		}
		ds.updateds(new Dishes(id,dname,price,vid));
	}

	@GetMapping("/gldindan")
	public String gldindan(Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Orde> selectod = ordeService.selectod();
		System.out.println(selectod);
		List<Orde> ordes;
		ArrayList<Integer> integers = new ArrayList<Integer>();
		int a =0;
		for (Orde orde : selectod) {
			String[] dnames = orde.getDname().split(",");
			String[] prices = orde.getPrice().split(",");
			String[] tastes = orde.getTaste().split(",");
			ordes = new ArrayList<Orde>();
			String[] split = orde.getPrice().replace("*1", "").split(",");
			int sum = 0;
			a++;
			for (int i = 0; i < dnames.length; i++) {
				Orde orde2 = new Orde(orde.getId(), dnames[i], orde.getNumber(),
						prices[i], tastes[i], orde.getSid(), orde.getSj(),1);
				ordes.add(orde2);
				map.put("orde"+a,ordes);
				sum+=Integer.parseInt(split[i]);
			}
			integers.add(sum);
			System.out.println("integers "+integers);
		}
		System.out.println("test   "+map);
		List<Varieties> Varieties = vs.selectall();
		model.addAttribute("test",map);
		model.addAttribute("prices",integers);
		model.addAttribute("Varieties", Varieties);
		return "gldindan";
	}

	@PostMapping("/adminUpdateServlet")
	public void adminUpdateServlet(@RequestBody User user, HttpServletResponse response) throws IOException {
		System.out.println(user);
		User selectuser = userService.selectuserid(user.getId());
		if (selectuser.getName() != null){
			userService.updateuser(user);
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write("success");
		}
	}

	@PostMapping("/deleteByIds")
	public void deleteByIds(@RequestParam("id") Integer id, HttpServletResponse response) throws IOException {
		System.out.println(id);
		int deleteid = userService.deleteid(id);
		System.out.println(deleteid);
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write("success");
	}

	
	
}
