package com.xiaochen.crud.bean;

public class TblDept {
    private Integer deptId;

    private String deptName;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }
	private void settb() {
		// TODO Auto-generated method stub
	
	}
    public TblDept(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}