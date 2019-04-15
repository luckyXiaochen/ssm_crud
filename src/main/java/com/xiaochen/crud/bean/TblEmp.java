package com.xiaochen.crud.bean;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

public class TblEmp {
    private Integer empId;
    //使用JSR303校验
    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,15}$)|(^[\\\\u2E80-\\\\u9FFF]{2,5})"
    			,message="用户名必须是2-5位中文或者6-15位英文或数字的组合!!!")
    private String empName;

    private String gender;
    @Pattern(regexp="^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
    		,message="邮箱格式不正确！！！")
    private String email;

    private Integer dId;
    //希望查询员工时同时查询部门
    private TblDept tblDept;
    

    public TblDept getTblDept() {
		return tblDept;
	}

	public void setTblDept(TblDept tblDept) {
		this.tblDept = tblDept;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
    public TblEmp() {
		super();
	}
	public TblEmp(Integer empId, String empName, String gender, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}
   
}