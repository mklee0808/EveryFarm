package com.everyfarm.fundproduct.biz;

import java.util.List;

import com.everyfarm.fundproduct.dto.FundDto;
import com.everyfarm.fundproduct.dto.FundPagingDto;
import com.everyfarm.fundproduct.dto.FundPayDto;

public interface FundBiz {

	//펀드 모든 List 가져오기
	public List<FundDto> fundAllList(FundPagingDto dto);
	
	//펀드 best 4 가져오기
	public List<FundDto> fundBestList();
	
	//펀드 상세정보
	public FundDto fundDetail(int stock_no);
	
	//총 게시물 갯수
	public int totalpage(int totalrows);
	
	//주문 테이블에 insert 하기
	public FundPayDto orderInput(int stock_no, String mem_id, int orderinfo_kg);
	
	//결제 완료 후 pay 테이블에 insert하기, orderinfo테이블 업데이트하기
	public int payInput(int order_no, int pay_price);
	
}
