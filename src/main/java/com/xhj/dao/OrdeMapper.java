package com.xhj.dao;

import com.xhj.bean.Orde;
import com.xhj.bean.OrdeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrdeMapper {
    long countByExample(OrdeExample example);

    int deleteByExample(OrdeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orde record);

    int insertSelective(Orde record);

    List<Orde> selectByExample(OrdeExample example);

    Orde selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Orde record, @Param("example") OrdeExample example);

    int updateByExample(@Param("record") Orde record, @Param("example") OrdeExample example);

    int updateByPrimaryKeySelective(Orde record);

    int updateByPrimaryKey(Orde record);
    
    List<Orde> selectod();

    List<Orde> selectuserid(Integer id);

    String selectmax();
    
    int deleteoid(Integer id);

    int insertorder(Orde orde);

    Orde selectid(Integer id);
}