package com.xiaochen.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.xiaochen.crud.bean.TblEmp;

/**
 * 使用spring单元测试
 * @author 26631
 *
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:Springmvc.xml"})
public class MvcTest {
//	//传入Springmvc的ioc
//	@Autowired
//	WebApplicationContext context;
//	//虚拟mvc请求
//	MockMvc mockMvc;
//	@Before
//	public void initMockMvc() {
//		mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
//	}
	@Test
	public void testPage() throws Exception {
//		//模拟请求拿到返回值
//		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("current","5")).andReturn();
//		//请求成功后，请求域中会有pageInfo,取出验证
//		MockHttpServletRequest request = mvcResult.getRequest();
//		PageInfo pageInfo=(PageInfo) request.getAttribute("pageInfo");
//		System.out.println("当前页码"+pageInfo.getPageNum());
//		System.out.println("总页码"+pageInfo.getPages());
//		System.out.println("总记录数"+pageInfo.getTotal());
//		System.out.println("在页面需要连续显示页码");
//		int[] nums = pageInfo.getNavigatepageNums();
//		for (int i : nums) {
//			System.out.print("	"+i+" ");
//		}
//		//-------------------------------------------
//		//获取员工信息
//		List<TblEmp> list = pageInfo.getList();
//		for (TblEmp tblEmp : list) {
//			System.out.println("ID"+tblEmp.getEmpId()+"===>name"+tblEmp.getEmpName());
//		}
	}
}
