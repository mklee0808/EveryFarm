<%@page import="com.everyfarm.product.dto.PagingDto"%>
<%@page import="com.everyfarm.product.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/auction/auctionlist.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/auction/auctionlist.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/auction/selectbox.css"    
	  rel="stylesheet"    
	  type="text/css" />  	   
</head>
<%
	PagingDto currentpage = (PagingDto)request.getAttribute("pagingdto");
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();

	List<ProductDto>productlist = (List<ProductDto>)session.getAttribute("productlist");
	List<ProductDto>bestlist =(List<ProductDto>)session.getAttribute("bestlist");
%>
<body>
<script type="text/javascript">
	$(function(){
		$("#zone").change(function(){
		var zone = document.getElementById("zone").value;
			if(zone=="서울"){
				$("#zoneone").show();
				$("#zonetwo").hide();
			}else if(zone=="경기도"){
				$("#zonetwo").show();
				$("#zoneone").hide();
			}
		});
	});
</script>
<%@ include file="../home/header.jsp" %>
<main>
    <section class="shop" style="height: 100%;">
    	<img alt="img" src="../resources/images/auction/introduce.png" style="width:2000px;"/>
	<a id="titleone">지역별:</a><select id="zone">
		<option>서울</option>
		<option>경기도</option>
	</select>
	<select id="zoneone">
		<option>강서구</option>
		<option>양천구</option>
		<option>구로구</option>
		<option>금천구</option>
		<option>영등포구</option>
		<option>마포구</option>
		<option>서대문구</option>
		<option>은평구</option>
		<option>종로구</option>
		<option>관악구</option>
		<option>동작구</option>
		<option>용산구</option>
		<option>중구</option>
		<option>성북구</option>
		<option>강북구</option>
		<option>도봉구</option>
		<option>노원구</option>
		<option>동대문구</option>
		<option>성동구</option>
		<option>강남구</option>
		<option>서초구</option>
		<option>송파구</option>
		<option>광진구</option>
		<option>중랑구</option>
		<option>노원구</option>
		<option>강동구</option>
		
		
	</select>
	<select id="zonetwo" style="display:none;">
		<option>김포시</option>
		<option>파주시</option>
		<option>고양시</option>
		<option>양주시</option>
		<option>의정부시</option>
		<option>동두천시</option>
		<option>연천군</option>
		<option>포천시</option>
		<option>가평군</option>
		<option>의정부시</option>
		<option>남양주시</option>
		<option>구리시</option>
		<option>하남시</option>
		<option>양평군</option>
		<option>여주시</option>
		<option>광주시</option>
		<option>성남시</option>
		<option>과천</option>
		<option>안양</option>
		<option>군포</option>
		<option>광명</option>
		<option>부천</option>
		<option>시흥</option>
		<option>안산시</option>
		<option>화성시</option>
		<option>수원시</option>
		<option>오산시</option>
		<option>용인시</option>
		<option>광주시</option>
		<option>이천시</option>
		<option>인천광역시</option>
		
	</select>
    <input type="button" class="btn" value="검색"/>
      <a id="titletwo">품목별:</a><select id="searchtype">
		<option>과일</option>
		<option>채소</option>
		<option>곡류</option>
		<option>견과류</option>
		<option>약용작물</option> 
		<option>버섯류</option>
	</select>
	
	 <input type="button" class="btn" value="검색"/>
       <br/><br/><br/>
       <!-- best경매상품 -->      
       <h1 class="bestproduct"><a style="color:darkorange;">Best</a>경매상품</h1>
        <div class="fixed-container"> 	
            <div class="shop-list">
<%
	for(int i = 0; i < bestlist.size(); i++){
%>            
               <article class="shop-list__item currently-dont-selling">
                    <img src="../resources/images/productstorage/apple.png" alt="man" style="width:300px; height:250px; cursor:pointer;">
                    
                    <div class="item-disc">
                        <img alt="img" src="../resources/images/auction/EveryFarmimage.png"/>
                        <div id="seller">판매자:<%=bestlist.get(i).getMem_id() %></div>
                        <h2 class="item-title" style="cursor:pointer"><%=bestlist.get(i).getStock_name() %> 
                        <img alt="img" src="../resources/images/auction/messageicon.png" style="width:8%; margin: 0% 0% -2% 70%; cursor:pointer;"/> <br/></h2>
                       
                        <span id="productprice">시작가:<%=bestlist.get(i).getAuc_startPrice() %></span>
                       
                    </div>
                 
                    <div class="item-price-block">
                        <div class="item-price">
                        <table border="1">
                        	<tr>
                        		<td>최고가:<%=bestlist.get(i).getAuc_nowPrice() %></td>
                        		<td>입찰:<%=bestlist.get(i).getAuc_join() %></td>
                        	<tr/>
                        </table>
                        	<img alt="img" src="../resources/images/auction/watch.png" style="width:20px; height:20px;">
                        	<div style="margin: -130px 0px 0px 40px;">21시간26분</div>
                        </div>
                    </div>

                </article>
<%
	}
%>               
            </div>
            <!-- best경매상품 끝 -->
        </div><br/><br/><br/>
      <hr/><br/>
      <!-- 일반경매상품 -->
      <h1 class="bestproduct">경매상품</h1>
 		 <div class="fixed-container">
            <div class="shop-list">
<%            
	for(int i = 0; i < productlist.size(); i++){
%>
               <article class="shop-list__item currently-dont-selling">
                    <img src="../<%=productlist.get(i).getStock_image().split("/")[0] %>" alt="product" style="width:300px; height:250px; cursor:pointer; margin-left: 7%;">
                    
                    <div class="item-disc">
                        <img alt="img" src="../resources/images/auction/EveryFarmimage.png"/>
                        <div id="seller">판매자:<%=productlist.get(i).getMem_id() %></div>
                        <h2 class="item-title" style="cursor:pointer"><%=productlist.get(i).getStock_name() %> 
                        <img alt="img" src="../resources/images/auction/messageicon.png" style="width:8%; margin: 0% 0% -2% 70%; cursor:pointer;"/> <br></h2>
                        <span id="productprice">시작가:<%=productlist.get(i).getAuc_startPrice() %></span>
                       
                    </div>
                    <div class="item-price-block">
                        <div class="item-price">
                        <table border="1">
                        	<tr>
                        		<td>최고가:<%=productlist.get(i).getAuc_nowPrice() %></td>
                        		<td>입찰:<%=productlist.get(i).getAuc_join() %></td>
                        	<tr/>
                        </table>
                        	<img alt="img" src="../resources/images/auction/watch.png" style="width:20px; height:20px;">
                        	<div style="margin: -130px 0px 0px 40px;">21시간26분</div>
                        </div>
                    </div>

                </article>
<%
	}
%>                
                </div>
                <!-- 일반경매상품 끝-->
    </section>
    <div class="overlay"></div>
</main>
<%@ include file="../home/footer.jsp" %>
</body>
</html>