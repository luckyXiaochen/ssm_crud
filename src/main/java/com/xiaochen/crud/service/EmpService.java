package com.xiaochen.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaochen.crud.bean.TblEmp;
import com.xiaochen.crud.dao.TblEmpMapper;
@Service
public class EmpService {
	@Autowired
	TblEmpMapper empMapper;
	/**
	 * 查询所有员工
	 * @return
	 */
	public List<TblEmp> getAll() {
		// TODO Auto-generated method stub
		return empMapper.selectByExampleWithDept(null);
	}

}
