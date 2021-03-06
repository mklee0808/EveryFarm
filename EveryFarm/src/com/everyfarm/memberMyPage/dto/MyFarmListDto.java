package com.everyfarm.memberMyPage.dto;

import java.util.Date;

public class MyFarmListDto {
	
	//주말농장
	private int wfarm_key;
	private String mem_id;
	private String wfarm_title;
	private String wfarm_zoneCode;
	private String wfarm_addr;
	private int wfarm_totalArea;
	private int wfarm_price;
	private String wfarm_status;
	private Date wfarm_regDate;
	private String wfarm_image;
	private String wfarm_content;
	
	//회원 주말농장 참여정보
	private int mf_key;
	private Date mf_regDate;
	private int mf_area;
	
	//주말농장 IoT
	private int iot_water;
	private int iot_cctv;
	
	public MyFarmListDto() {
		
	}
	public int getWfarm_key() {
		return wfarm_key;
	}
	public void setWfarm_key(int wfarm_key) {
		this.wfarm_key = wfarm_key;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getWfarm_title() {
		return wfarm_title;
	}
	public void setWfarm_title(String wfarm_title) {
		this.wfarm_title = wfarm_title;
	}
	public String getWfarm_zoneCode() {
		return wfarm_zoneCode;
	}
	public void setWfarm_zoneCode(String wfarm_zoneCode) {
		this.wfarm_zoneCode = wfarm_zoneCode;
	}
	public String getWfarm_addr() {
		return wfarm_addr;
	}
	public void setWfarm_addr(String wfarm_addr) {
		this.wfarm_addr = wfarm_addr;
	}
	public int getWfarm_totalArea() {
		return wfarm_totalArea;
	}
	public void setWfarm_totalArea(int wfarm_totalArea) {
		this.wfarm_totalArea = wfarm_totalArea;
	}
	public int getWfarm_price() {
		return wfarm_price;
	}
	public void setWfarm_price(int wfarm_price) {
		this.wfarm_price = wfarm_price;
	}
	public String getWfarm_status() {
		return wfarm_status;
	}
	public void setWfarm_status(String wfarm_status) {
		this.wfarm_status = wfarm_status;
	}
	public Date getWfarm_regDate() {
		return wfarm_regDate;
	}
	public void setWfarm_regDate(Date wfarm_regDate) {
		this.wfarm_regDate = wfarm_regDate;
	}
	public String getWfarm_image() {
		return wfarm_image;
	}
	public void setWfarm_image(String wfarm_image) {
		this.wfarm_image = wfarm_image;
	}
	public String getWfarm_content() {
		return wfarm_content;
	}
	public void setWfarm_content(String wfarm_content) {
		this.wfarm_content = wfarm_content;
	}
	public int getMf_key() {
		return mf_key;
	}
	public void setMf_key(int mf_key) {
		this.mf_key = mf_key;
	}
	public Date getMf_regDate() {
		return mf_regDate;
	}
	public void setMf_regDate(Date mf_regDate) {
		this.mf_regDate = mf_regDate;
	}
	public int getMf_area() {
		return mf_area;
	}
	public void setMf_area(int mf_area) {
		this.mf_area = mf_area;
	}
	public int getIot_water() {
		return iot_water;
	}
	public void setIot_water(int iot_water) {
		this.iot_water = iot_water;
	}
	public int getIot_cctv() {
		return iot_cctv;
	}
	public void setIot_cctv(int iot_cctv) {
		this.iot_cctv = iot_cctv;
	}
	
	
}
