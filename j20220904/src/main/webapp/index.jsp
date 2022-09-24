<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
</style>
</head>
<body>
   <div id="header">
       <jsp:include page="./main//header.jsp"></jsp:include>
    </div><!-- header -->

    <div id="container">
        <div id="banner">
			<jsp:include page="./main/banner.jsp"></jsp:include>
        </div><!-- banner -->

        <div id="content">
			<jsp:include page="./main/content.jsp"></jsp:include>
        </div><!-- content -->
    </div><!-- container -->

    <div id="footer">
        <jsp:include page="./main/footer.jsp"></jsp:include>
    </div><!-- footer -->
</body>
</html>