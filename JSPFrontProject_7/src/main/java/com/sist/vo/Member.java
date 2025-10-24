package com.sist.vo;

public class Member {
    private int mno;
    private String name;
    private String address;
    private String phone;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Member(int mno, String name, String address, String phone) {
		super();
		this.mno = mno;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	public Member() {}
    
}
