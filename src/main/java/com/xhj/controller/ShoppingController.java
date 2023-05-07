package com.xhj.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xhj.bean.*;
import com.xhj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/gw")
public class ShoppingController {
	
	@Autowired
	ShoppingService gowuService;
	
	@Autowired
	DishesService dishesService;

	@Autowired
	OrdeService ordeService;
	
	@Autowired
	VarietiesServie vs;

	@Autowired
	UserService userService;
	
	@Autowired
	OrdeService os;
	

	@RequestMapping("/gowu")
	@ResponseBody
	public Map<String,Object> getajax(){
		List<Shopping> list = gowuService.gowu();
		
		int price = gowuService.price();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("price", price);
		return map;
	}
	//4
	@RequestMapping("/deleteid/{id}")
	@ResponseBody
	public String deleteById(@PathVariable("id")Integer id,Model model) {
		Dishes ds = dishesService.selectById(id);
		String gowu1 = gowuService.gowu1(ds.getDname());
		if(gowu1!=null) {
			int parseInt = Integer.parseInt(gowu1);
			gowuService.deleteid(id);
			dishesService.updateid(new Dishes(id, parseInt));
		}
		System.out.println(id);
		List<Dishes> list = dishesService.getDoshes();
		model.addAttribute("list", list);
		return "";
	}

	//3
	@RequestMapping("/insert/{id}/{country}")
	@ResponseBody
	public void insert(@PathVariable("id")String id,@PathVariable("country")String country,Model model) {
		int parseInt = Integer.parseInt(id);
		Dishes ds = dishesService.selectById(parseInt);
		System.out.println(ds);
		Shopping gowu = new Shopping(ds.getDname(),1,ds.getPrice(),country);
		System.out.println(gowu);
		int insert = gowuService.insert(gowu);
		System.out.println(insert);
		dishesService.updateid(new Dishes(parseInt,ds.getNumber()+1));
	}
	//2
	@RequestMapping("/deleteall")
	@ResponseBody
	public void deleteall(@RequestParam(value = "userid")int userid, @RequestParam(value = "sid")int sid,
						  @RequestParam("pwd")String pwd,
						  HttpServletResponse response) throws IOException {
		String selectpwd = userService.selectpwd(userid);
		System.out.println(userid);
		System.out.println(sid);
		System.out.println(pwd);
		yanshi();
		if(selectpwd.equals(pwd)){

		String Srringid = os.selectmax();
		int price = gowuService.price();
		User selectbalance = userService.selectbalance(new User(userid, price));
		int id = Integer.parseInt(Srringid);
		if (selectbalance != null){
		if(Srringid!=null) {
			System.out.println(id);
			List<Shopping> gowu = gowuService.gowu();
			StringBuilder stringBuilder = new StringBuilder();
			StringBuilder stringBuilder1 = new StringBuilder();
			StringBuilder stringBuilder2 = new StringBuilder();
			for (int i=0;i<gowu.size();i++){
				System.out.println(gowu.get(i).getDname());
				stringBuilder.append(gowu.get(i).getDname()+",");
				stringBuilder1.append(gowu.get(i).getTaste()+",");
				stringBuilder2.append(gowu.get(i).getPrice()+"*"+gowu.get(i).getNumber()+",");
				if (i==gowu.size()-1){
					stringBuilder.append(gowu.get(i).getDname());
					stringBuilder1.append(gowu.get(i).getTaste());
					stringBuilder2.append(gowu.get(i).getPrice()+"*"+gowu.get(i).getNumber());
				}
			}

			System.out.println(stringBuilder);
			System.out.println(stringBuilder1);
			System.out.println(stringBuilder2);


			Orde orde = new Orde(id+1,stringBuilder.toString(),gowu.size(),stringBuilder2.toString()
					,stringBuilder1.toString(),sid,
					new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),userid);
			System.out.println(orde);
			System.out.println("222");
			ordeService.insertorder(orde);
			System.out.println("111");
			gowuService.deleteall();
			System.out.println(userid+":"+price);
			userService.jianbalance(new User(userid,price));
			System.out.println(orde);
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write("success");
		}

//			String[] split = orde.getDname().split(",");
//			for (String s : split) {
//				System.out.println(s);
//			}


//			Orde orde = new Orde();
		}else {
//			os.insertorder(1);
//			gowuService.deleteall();
//			dishesService.updateall();
//			System.out.println(gowuService.gowu()+"1");
			System.out.println("失败");
		}
		}

	}

	@RequestMapping("/test/{id}")
	public String Test(@PathVariable(value = "id")int id, Model model){

//		Orde selectid = ordeService.selectid(43);
//		System.out.println(selectid);
//		ArrayList<Orde> ordes = new ArrayList<Orde>();  //查到的数据
//		String[] split = selectid.getDname().split(",");
//		String[] split1 = selectid.getPrice().split(",");
//		String[] split2 = selectid.getTaste().split(",");
//		Orde orde = new Orde();
//		for (int i=0;i<split.length;i++) {  //把查到的数据遍历 装到list里面
//			Orde orde2 = new Orde(selectid.getId(), split[i], selectid.getNumber(),
//					split1[i], split2[i], selectid.getSid(), selectid.getSj());
////			orde.setId(selectid.getId());
////			orde.setSid(selectid.getSid());
////			orde.setNumber(selectid.getNumber());
////			orde.setDname(split[i]);
////			orde.setTaste(split2[i]);
////			orde.setSj(selectid.getSj());
////			orde.setPrice(split1[i]);
//			ordes.add(orde2);
//		}
//		System.out.println(ordes);
//		model.addAttribute("test",ordes);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Orde> selectod = ordeService.selectuserid(id);
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
		return "Test";
	}
	
	@RequestMapping("/deleteid1/{id}/{name}")
	@ResponseBody
	public void deleteid(@PathVariable("id")Integer id,@PathVariable("name")String name) {
		System.out.println(id);
		Dishes dishes = dishesService.seledname(new Dishes(name));
		System.out.println(name);
		dishesService.updateid(new Dishes(dishes.getId(),dishes.getNumber()-1));
		System.out.println("1111");
		gowuService.deleteid(id);
	}
	
	//1
	@RequestMapping("/deletelist/{list}")
	@ResponseBody
	public void deletelist(@PathVariable("list")List<Integer> list){
		System.out.println(list);
		for(Integer id:list) {
			gowuService.deleteid(id);
		}
	}
	
	public void yanshi() {
		try {
			long[] i= {1000,3000,2000,500};
			Random random = new Random();
			int num = random.nextInt(i.length);
			Thread.sleep(i[num]);
			System.out.println(i[num]);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		String s="tt*1,ss*1,ff*1";
		String[] split3 = s.replace("*1", "").split(",");
		for (int i = 0; i < split3.length; i++) {
			System.out.println(split3[i]);
		}


		ArrayList<Orde> ordes1 = new ArrayList<Orde>();
		String format = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		StringBuilder stringBuilder = new StringBuilder();
		StringBuilder stringBuilder1 = new StringBuilder();
		StringBuilder stringBuilder3 = new StringBuilder();
		stringBuilder.append("土豆,辣椒炒肉,红烧鱼块,红烧肉");
		stringBuilder1.append("微辣,中辣,微辣,微辣");
		stringBuilder3.append("53,23,43,46");
		StringBuilder stringBuilder4 = new StringBuilder();
		StringBuilder stringBuilder5 = new StringBuilder();
		StringBuilder stringBuilder6 = new StringBuilder();
		stringBuilder4.append("土豆1,辣椒炒肉1,红烧鱼块1,红烧肉1");
		stringBuilder5.append("微辣,中辣,微辣,微辣");
		stringBuilder6.append("59,23,83,36");
		System.out.println(stringBuilder.toString());
		System.out.println(format);
		String[] split = stringBuilder.toString().split(",");
		String[] split1 = stringBuilder1.toString().split(",");
		String[] split2 = stringBuilder3.toString().split(",");

//		for (int i = 0; i < split2.length; i++) {
////				System.out.println(Integer.parseInt(tastes[i]));
//			sum+=Integer.parseInt(split2[i]);
//			System.out.println(split2[i]);
//		}
		Orde orde1 = new Orde(44,stringBuilder.toString(),split.length,stringBuilder3.toString()
				,stringBuilder1.toString(),4,
				new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),1);
		Orde orde3 = new Orde(45,stringBuilder4.toString(),split.length,stringBuilder6.toString()
				,stringBuilder5.toString(),4,
				new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()),1);
		ordes1.add(orde1);
		ordes1.add(orde3);
		System.out.println(ordes1);
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Integer> integers = new ArrayList<Integer>();
		int a = 0;
		for (Orde orde : ordes1) {
			int sum =0;
			String[] dnames = orde.getDname().split(",");
			String[] prices = orde.getPrice().split(",");
			String[] tastes = orde.getTaste().split(",");
			System.out.println("   "+orde);
			for (int i = 0; i < prices.length; i++) {
//				Integer.parseInt(prices[i]);
				sum+=Integer.parseInt(prices[i]);
			}
			integers.add(sum);
			System.out.println(sum);
			ArrayList<Orde> ordes2 = new ArrayList<Orde>();
			a++;
			for (int i = 0; i < dnames.length; i++) {
				Orde orde2 = new Orde(orde.getId(), dnames[i], orde.getNumber(),
						prices[i], tastes[i], orde.getSid(), orde.getSj(),1);
				ordes2.add(orde2);
				map.put("orde"+a,ordes2);
			}
			System.out.println(ordes2);
			System.out.println(map);
		}
		for (int i =1;i<=map.size();i++){
			System.out.println(map.get("orde" + i));
		}
		System.out.println(integers);
//		System.out.println(ordes2);
//		System.out.println(map.get("orde1"));
//		System.out.println(map.get("orde2"));



//		System.out.println("查到的数据："+orde1);
//		ArrayList<Orde> ordes = new ArrayList<Orde>();  //查到的数据
//			Orde orde = new Orde();
//			for (int j = 0;j <ordes1.size();j++){
//
//		for (int i=0;i<split.length;i++) {  //把查到的数据遍历 装到list里面
//			Orde orde2 = new Orde(orde1.getId(), split[i], orde1.getNumber(),
//					split2[i], split1[i], orde1.getSid(), orde1.getSj());

//			System.out.println(split[i]);
//			System.out.println(split2[i]);
//			System.out.println(split1[i]);
//			orde.setId(orde1.getId());
//			orde.setSid(orde1.getSid());
//			orde.setNumber(orde1.getNumber());
//			orde.setDname(split[i]);
//			orde.setTaste(split1[i]);
//			orde.setPrice(split2[i]);
//			orde.setSj(orde1.getSj());
//			ordes.add(orde2);
//			System.out.println(orde2);
//		}
//			}
//		System.out.println(ordes);
//		model.addAttribute("orders",ordes);  //传递数据
//		for (Orde ord : ordes) {
//			System.out.println(ord);
//		}
	}

}
