package com.xiaochen.crud.bean;

public class TblEmp {
    private Integer empId;

    private String empName;

    private String gender;

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