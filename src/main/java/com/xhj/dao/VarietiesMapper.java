package com.xhj.dao;

import com.xhj.bean.Dishes;
import com.xhj.bean.Varieties;
import com.xhj.bean.VarietiesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VarietiesMapper {
    long countByExample(VarietiesExample example);

    int deleteByExample(VarietiesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Varieties record);

    int insertSelective(Varieties record);

    List<Varieties> selectByExample(VarietiesExample example);

    Varieties selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Varieties record, @Param("example") VarietiesExample example);

    int updateByExample(@Param("record") Varieties record, @Param("example") VarietiesExample example);

    int updateByPrimaryKeySelective(Varieties record);

    int updateByPrimaryKey(Varieties record);
    
    List<Varieties> selectall();
    
    List<Dishes> selectById(Integer id);
    
    int updateid(Varieties varieties);
    
    int deletevsid(Varieties varieties);
    
    Varieties selectid(Varieties varieties);
    
    int insertvn(Varieties varieties);
    
    int selectcount();
    
    int selectmax();
}