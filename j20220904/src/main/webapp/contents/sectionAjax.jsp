<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String context = request.getContextPath();
%>
<c:forEach var="list" items="${list }" begin="0" end="8"> 
	<li class="col-list-item prod-item">
		<div class="prod-item-inner">
			<a class="prod-link" href="<%=context %>/contents/contents_men.do?product_id=${list.product_id }&gender=${list.gender}">
				<div class="img-wrap">
					<img class="img-box" alt="신발" src="${list.s_file_path }">
				</div>
				<div class="prod-info-wrap" id=#>
					<div class="prod-info-wrap" id="#">
						<span class="prod-brand">${list.brand }</span><br> <span
							class="prod-name">${list.kor_name }</span><br> <span
							class="prod-price"> <span class="prod-cost">${list.price}</span>
							<span class="price-unit">원</span>
						</span>
					</div>
				</div>
			</a>
		</div>
	</li>
</c:forEach>
<!-- https://image.a-rt.com/art/product/brand/202209/1662363690189.jpg -->