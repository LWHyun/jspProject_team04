<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<c:forEach var="filterList" items="${filterList }">
		<li class="pro_content">
			<div>
			<a href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${filterList.product_id}&&gender=${filterList.gender}">
				<img alt="상품이미지" src="${filterList.s_file_path }" class="pro_img" id="pro_img"><br>
				<span class="pro_brand">${filterList.brand }</span><br>
				<span class="pro_model">${filterList.kor_name }</span><br>
				<span class="pro_price">${filterList.price }</span><span>원</span><br>
				</a>
				<hr>
				<div class="pro_buycontent">
					<c:choose>
						<c:when test="${filterList.like_product_id > 0 }">
							<img class="like_img" alt="${filterList.product_id }"  src="../img/contexts/heart0.png" ><!-- onclick="like()" -->
						</c:when>
						<c:otherwise>
							<img class="like_img" alt="${filterList.product_id }"  src="../img/contexts/heart1.png" ><!-- onclick="like()" -->
						</c:otherwise>
					</c:choose>
					<button type="button" class="pro_buynow">바로구매</button>
					<input type="hidden" name="">
				</div>
			
			</div>
			</li>
	</c:forEach>
