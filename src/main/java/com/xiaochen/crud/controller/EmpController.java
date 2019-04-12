package com.xiaochen.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaochen.crud.bean.Msg;
import com.xiaochen.crud.bean.TblEmp;
import com.xiaochen.crud.service.EmpService;
/**
 * 处理员工CRUD请求
 * @author 26631
 *
 */
@Controller
public class EmpController {
	//注入service
	@Autowired
	EmpService empService;
	/**
	 * 查询员工数据(分页查询)
	 * @return
	 */
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="current",defaultValue="1")Integer current,Model model) {
		//引入pageHelper分页插件
		//在查询之前只需要调用，插入页码，每页的大小
		PageHelper.startPage(current, 8);
		//startPage后面跟着的查询为分页查询
		List<TblEmp> emps=empService.getAll();
		//使用pageInfo来包装查询后的结果,只需要将pageInfo交给页面
		//封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页面
		PageInfo pageInfo=new PageInfo(emps,5);
		model.addAttribute("pageInfo", pageInfo);
		return "/list";
	}
	//使用json返回
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="current",defaultValue="1")Integer current,Model model) {
		//引入pageHelper分页插件
		//在查询之前只需要调用，插入页码，每页的大小
		PageHelper.startPage(current, 8);
		//startPage后面跟着的查询为分页查询
		List<TblEmp> emps=empService.getAll();
		//使用pageInfo来包装查询后的结果,只需要将pageInfo交给页面
		//封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页面
		PageInfo pageInfo=new PageInfo(emps,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	/**
	 * 员工添加
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(TblEmp tblEmp) {
		empService.saveEmp(tblEmp);
		return Msg.success();
	}
	/**
	 * 对员工名进行校验
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("empName")String empName) {
		boolean flag=empService.checkuser(empName);
		System.out.println("ss");
		if(flag) {
			return Msg.success();
		}else {
			return Msg.file();
		}
	}
}
