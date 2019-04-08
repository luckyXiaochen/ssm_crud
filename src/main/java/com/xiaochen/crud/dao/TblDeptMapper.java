package com.xiaochen.crud.dao;

import com.xiaochen.crud.bean.TblDept;
import com.xiaochen.crud.bean.TblDeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TblDeptMapper {
    long countByExample(TblDeptExample example);

    int deleteByExample(TblDeptExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(TblDept record);

    int insertSelective(TblDept record);

    List<TblDept> selectByExample(TblDeptExample example);

    TblDept selectByPrimaryKey(Integer deptId);

    int updateByExampleSelective(@Param("record") TblDept record, @Param("example") TblDeptExample example);

    int updateByExample(@Param("record") TblDept record, @Param("example") TblDeptExample example);

    int updateByPrimaryKeySelective(TblDept record);

    int updateByPrimaryKey(TblDept record);
}