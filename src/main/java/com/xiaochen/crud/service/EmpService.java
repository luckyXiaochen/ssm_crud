package com.xiaochen.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaochen.crud.bean.TblEmp;
import com.xiaochen.crud.bean.TblEmpExample;
import com.xiaochen.crud.bean.TblEmpExample.Criteria;
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
	public void saveEmp(TblEmp tblEmp) {
		empMapper.insertSelective(tblEmp);
	}
	/**
	 * 检验用户名时候可用
	 * @param empName
	 * @return
	 */
	public boolean checkuser(String empName) {
		TblEmpExample tblEmpExample=new TblEmpExample();
		Criteria criteria = tblEmpExample.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long flag=empMapper.countByExample(tblEmpExample);
		return flag==0;
	}

}
