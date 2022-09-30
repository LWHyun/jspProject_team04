<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="item" items="${list }">
	<li><a href="${pageContext.request.contextPath }/category/searchView.do?ca_code=${item.ca_code }">${item.ca_name }</a></li>
</c:forEach>
