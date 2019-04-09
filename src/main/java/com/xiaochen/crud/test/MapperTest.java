package com.xiaochen.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xiaochen.crud.bean.TblDept;
import com.xiaochen.crud.bean.TblEmp;
import com.xiaochen.crud.dao.TblDeptMapper;
import com.xiaochen.crud.dao.TblEmpMapper;
/**
 * 测试dao层的工作
 * 使用spring的项目测试使用Spring的单元测试，可以自动注入我们需要的组件
 * @author 26631
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	TblEmpMapper tblEmpMapper;
	@Autowired
	TblDeptMapper tblDeptMapper;
	@Autowired
	SqlSession sqlSession;
	@Test
	public void testCURD() {
		System.out.println(tblDeptMapper);
		//插入部门
//		tblDeptMapper.insert(new TblDept(null, "开发部"));
//		tblDeptMapper.insert(new TblDept(null, "教学部"));
		//插入员工
		tblEmpMapper.insert(new TblEmp(null, "jack", "M", "jack@xiaochen.com", 1));
		//批量生成多个员工，使用SQLSession
		TblEmpMapper mapper = sqlSession.getMapper(TblEmpMapper.class);
		for (int i = 0; i < 1000; i++) {
			String substring = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insert(new TblEmp(null, substring, "M", substring+"@xiaochen.com", 1));
		}
		System.out.println("批量完成");
	}
}
