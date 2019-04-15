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
	/**
	 * 按照员工id查询
	 * @param id
	 * @return
	 */
	public TblEmp getEmp(Integer id) {
		// TODO Auto-generated method stub
		return empMapper.selectByPrimaryKey(id);
	}
	/**
	 * 按照员工id修改
	 * @param emp
	 */
	public void updateEmp(TblEmp emp) {
		empMapper.updateByPrimaryKeySelective(emp);
	}
	/**
	 * 按照员工id删除
	 * @param tblEmp
	 */
	public void deleteEmp(Integer empId) {
		empMapper.deleteByPrimaryKey(empId);
	}
	//批量删除
	public void deleteBatch(List<Integer> ids) {
		TblEmpExample tblEmpExample=new TblEmpExample();
		Criteria criteria = tblEmpExample.createCriteria();
		criteria.andEmpIdIn(ids);
		empMapper.deleteByExample(tblEmpExample);
	}

}
