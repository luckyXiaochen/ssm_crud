package com.xiaochen.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaochen.crud.bean.TblDept;
import com.xiaochen.crud.dao.TblDeptMapper;
@Service
public class DeptService {
	@Autowired
	private TblDeptMapper deptMapper;
	public List<TblDept> getDepts() {
		
		return deptMapper.selectByExample(null);
	}

}
