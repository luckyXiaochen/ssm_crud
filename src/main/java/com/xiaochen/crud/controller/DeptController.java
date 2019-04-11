package com.xiaochen.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaochen.crud.bean.Msg;
import com.xiaochen.crud.bean.TblDept;
import com.xiaochen.crud.service.DeptService;

@Controller
public class DeptController {
	@Autowired
	private DeptService deptService;
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		List<TblDept> depts=deptService.getDepts();
		return Msg.success().add("depts", depts);
	}
}
