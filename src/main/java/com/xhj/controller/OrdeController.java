package com.xhj.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xhj.bean.Orde;
import com.xhj.service.OrdeService;

@Controller
public class OrdeController {
	
	@Autowired
	OrdeService ordeService;
	
	@RequestMapping("/dds")
	@ResponseBody
	public List<Orde> selectod(Model model){
		List<Orde> list = ordeService.selectod();
		ArrayList<Orde> ordes = new ArrayList<Orde>();
		for (Orde orde : list) {
			System.out.println(orde);
		}
		System.out.println(list);
		model.addAttribute("list", list);
		return list;
	}
	@RequestMapping("/ddss")
	@ResponseBody
	public String selectods(Model model){
		String list = ordeService.selectmax();
		System.out.println(list);
		model.addAttribute("list", list);
		return list;
	}
	
	@RequestMapping("/deleteoid")
	@ResponseBody
	public void deleteoid(@RequestParam("id")Integer id) {
		ordeService.deleteoid(id);
	}

}
