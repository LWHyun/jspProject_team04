<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="../js/jquery.js"></script>
<!DOCTYPE html>

<c:forEach var="rsc_list" items="${rsc_list }">
	<li>
	<img src="/j20220904/img/contexts/x.png" class="X" alt="${rsc_list.rsc_num }" id="X1">
	<a class="box-left-ul-a" href="${pageContext.request.contextPath }/category/goSearchPro.do?searchWord=${rsc_list.rsc_word }">${rsc_list.rsc_word }</a>
	</li>
</c:forEach>



<script>
	$('.X').click(function() {
		
		var word = $(this).attr('alt');
		$.ajax({
			url : '${pageContext.request.contextPath}/category/deleteRcs.do',
			dataType : 'html',
			data : {deleteWord : word},
			success : function(data) {
				location.reload();
				console.log(data);
				
			}
		});
	});
</script>