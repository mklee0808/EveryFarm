package com.everyfarm.admin.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.everyfarm.admin.dao.RealtimeDao;
import com.everyfarm.admin.dto.AuctionApprovalDto;

@WebServlet("/RealtimeServlet")
public class RealtimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RealtimeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals("")) response.getWriter().write("");
		else if(listType.equals("today")) response.getWriter().write(getToday());
		else if(listType.equals("ten")) response.getWriter().write(getTen());
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	} 

	public String getToday() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":["); //json 형식 열기
		RealtimeDao chatDao = new RealtimeDao();
//		ArrayList<AuctionApprovalDto> chatList = chatDao.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//		for(int i=0; i<chatList.size(); i++) {
//			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			if(i != chatList.size()-1) result.append(","); // i가 마지막 원소가 아니면 ,
//		}
//		result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatID() +"\"}"); // json 형식 닫기
		System.out.println(result);
		return result.toString();
	}
	
	public String getTen() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		RealtimeDao chatDao = new RealtimeDao();
//		ArrayList<AuctionApprovalDto> chatList = RealtimeDao.getChatListByRecent(10);
//		for(int i=0; i<chatList.size(); i++) {
//			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			if(i != chatList.size()-1) result.append(",");
//		}
//		result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatID() +"\"}");
		System.out.println(result);
		return result.toString();
	}
	
	public String getID(String chatID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		RealtimeDao chatDao = new RealtimeDao();
//		ArrayList<AuctionApprovalDto> chatList = RealtimeDao.getChatListByRecent(chatID);
//		for(int i=0; i<chatList.size(); i++) {
//			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
//			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			if(i != chatList.size()-1) result.append(",");
//		}
//		result.append("], \"last\":\""+ chatList.get(chatList.size()-1).getChatID() +"\"}");
		System.out.println(result);
		return result.toString();
	}
		
	

}
