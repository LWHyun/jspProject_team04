<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="contents-inner">
		<h2 class="text-head1 text-left">고객센터</h2>
		
		<div class="aside-wrap">
			<ol class="customer-lnb">
				<li><a href="#">FAQ</a></li>
				<li><a href="#">공지사항</a></li>
			</ol>
		</div>
		
		<div class="aside-contents" align="center">
			<h3>FAQ</h3>
			
			<div class="border-line-box gray-box tbl-search-wrap">
					<table>
						<colgroup>
							<col style="width: 105px;">
							<col>
							<col style="width: 114px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<label for="searchValue">FAQ 검색</label>
								</th>
								<td class="input-wrap">
									<input id="searchValue" name="searchValue" type="text" placeholder="궁금한 내용을 입력해주세요.">
								</td>
								<td class="btn-wrap">
									<button id="btnSearchFaq" type="button" class="btn btn-sm" >검색</button>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
			
			<div class="tab-wrap anchor-tab multi-line" id="tabDiv">
					<ul class="tabs">
							<li><a href="/delivery.jsp" id="cnslType10003" class="tab-link" value="10003">배송현황</a></li>
							<li><a href="/change.jsp" id="cnslType10002" class="tab-link"  value="10002">교환/반품/환불</a></li>
							<li><a href="/order.jsp" id="cnslType10004" class="tab-link"  value="10004">주문/결제/취소</a></li>
							<li><a href="/as.jsp" id="cnslType10005" class="tab-link"  value="10005">A/S</a></li>
							<li><a href="/customer.jsp" id="cnslType10006" class="tab-link"  value="10006">회원정보</a></li>
					</ul>
				</div>			
		</div>
	</div>
	


</body>
</html>