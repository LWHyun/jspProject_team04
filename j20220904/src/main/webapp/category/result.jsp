<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	a {
	text-decoration: none;
	color: gray;
}
</style>
<c:forEach var="item" items="${list }">
	<c:choose>
		<c:when test="${item.ca_name eq '남자' }">
			<li><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/category/men3.do?gender=0" class="upperCate">${item.ca_name }</a></li>
		</c:when>
		<c:when test="${item.ca_name eq '여자' }">
			<li><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/category/women.do?gender=1" class="upperCate">${item.ca_name }</a></li>
		</c:when>
		<c:when test="${item.ca_name eq '브랜드' }">
			<li><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/contents/allBrand.do" class="upperCate">${item.ca_name }</a></li>
		</c:when>
		<c:when test="${item.ca_name eq '운동화' }">
			<li><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/category/searchView.do?ca_code=${item.ca_code }" class="upperCate">${item.ca_name }</a></li>
		</c:when>
		<c:when test="${item.ca_name eq '구두' }">
			<li><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/category/searchView.do?ca_code=${item.ca_code }" class="upperCate">${item.ca_name }</a></li>
		</c:when>
		<c:when test="${item.ca_name eq 'ADIDAS'||item.ca_name eq 'BIRKENSTOCK' ||item.ca_name eq 'CONVERSE' ||item.ca_name eq 'DR.MARTENS' ||item.ca_name eq 'FILA' ||item.ca_name eq 'LACOSTE' ||item.ca_name eq 'NIKE'}">
			<li><a style="text-decoration: none" href="${pageContext.request.contextPath }/contents/brandPdList.do?ca_code=${item.ca_code }">${item.ca_name }</a></li>
		</c:when>
		<c:otherwise>
			<li><a style="text-decoration: none" href="${pageContext.request.contextPath }/category/searchView.do?ca_code=${item.ca_code }">${item.ca_name }</a></li>
		</c:otherwise>
	</c:choose>
	
</c:forEach>
