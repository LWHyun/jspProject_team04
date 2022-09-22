<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		width:80%;
		border: 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 3px;
	}
	
	td,th {
		border: 1px solid black;
		padding: 3px;
	}
	
	center{
		margin-top: 15px;
	}
</style>
</head>
<body>
<form>
	<table align="center">
	<thead>
		<tr>
			<th>선택</th>
			<th>8</th>
			<th>상품코드</th>
			<th>판매가</th>
			<th>판매 상태</th>
			<th>재고</th>
		</tr>
	</thead>
	
	<tbody>	
		<tr>
			<td><input type="radio" id="productId1" name="select" value="productId1"></td>
			<td>No</td>
			<td>FK302982</td>
			<td>50000</td>
			<td>판매중</td>
			<td>21</td>
		</tr>
		
		<tr>
			<td><input type="radio" id="productId2" name="select" value="productId2"></td>
			<td>No</td>
			<td>FK32341</td>
			<td>51000</td>
			<td>판매중</td>
			<td>10</td>
		</tr>
	</tbody>
	</table>
	<center>
		<input type="button" value="수정" onclick="" align:"center">
	</center>
</form>
</body>
</html>
