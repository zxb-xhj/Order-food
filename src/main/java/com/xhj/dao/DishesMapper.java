package com.xhj.dao;

import com.xhj.bean.Dishes;
import com.xhj.bean.DishesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DishesMapper {
    long countByExample(DishesExample example);

    int deleteByExample(DishesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Dishes record);

    int insertSelective(Dishes record);

    List<Dishes> selectByExample(DishesExample example);

    Dishes selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Dishes record, @Param("example") DishesExample example);

    int updateByExample(@Param("record") Dishes record, @Param("example") DishesExample example);

    int updateByPrimaryKeySelective(Dishes record);

    int updateByPrimaryKey(Dishes record);
    
    List<Dishes> mohu(String name);
    
    List<Dishes> signature(Integer id);

	int updateid(Dishes dishes);
	
	int updateall();
	
	Dishes seledname(Dishes dishes);
	
	int deletedsid(Dishes dishes);
	
	int deletevid(Integer vid);
	
	int insertds(Dishes dishes);
	
	int updateds(Dishes dishes);

	List<Dishes> selectall();

	List<Dishes> selectvid(Integer vid);

    Dishes selectid(Integer id);
}