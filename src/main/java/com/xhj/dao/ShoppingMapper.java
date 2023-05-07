package com.xhj.dao;

import com.xhj.bean.Shopping;
import com.xhj.bean.ShoppingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShoppingMapper {
    long countByExample(ShoppingExample example);

    int deleteByExample(ShoppingExample example);

//    int deleteByPrimaryKey(Integer id);

    int insert(Shopping record);

    int insertSelective(Shopping record);

    List<Shopping> selectByExample(ShoppingExample example);

//    Shopping selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shopping record, @Param("example") ShoppingExample example);

    int updateByExample(@Param("record") Shopping record, @Param("example") ShoppingExample example);

//    int updateByPrimaryKeySelective(Shopping record);
//
//    int updateByPrimaryKey(Shopping record);

	String gowu1(String name);

	List<Shopping> gowu();

	String price();
	
	int deleteid(Integer id);
	
	int insert1(Shopping gowu);
	
	int updateid(Shopping gowu);
	
	Shopping selectById(Integer id);
	
	int deleteall();
	
	int deletelist(List<Integer> list);


}