<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.text-head {
		margin: 53px 0 0;
		color: #000;
		font-size: 18px;
		line-height: 30px;
		font-weight: 500;
		font-weight: bold;
		letter-spacing: -.9px;
	}
	.border-line-box {
		margin-top: 0;
		border-top: 2px solid #000;
		border-bottom: 1px solid #666;
	}
	.border-line-box table tr th {
	text-align: left;
	}
	th {
		color: #666;
		vertical-align: middle;
		padding: 17px 0 17px 20px;
		display: table-cell;
		font-weight: bold;
		height: auto;
		font-size: 13px;
		letter-spacing: -.65px;
	}
	tbody tr td {
		padding: 19px 0 18px;
		line-height: 23px;
		height: auto;
		font-size: 13px;
		letter-spacing: -.65px;
		color: black;
		text-align: left;
		margin: 0;
		border: 0;
		font-style: normal;
		display: table-cell;
		vertical-align: inherit;
	}
	tbody tr+tr, tbody tr+tr td {
		border-top: 1px solid #d5d5d5;
	}
	div {
		display: black;
	}
	body {
		min-width: 1440px;
		width: 100%;
		color: #000;
		background-color: #fff;
		line-height: 1;
		font-size: 13px;
		overflow-y: scroll;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		border-spacing: 0;
		table-layout: fixed;
		text-indent: initial;
	}
</style>
</head>
<body>
	<div class="text-head">상품정보제공 고시</div>
		<div class="border-line-box" id="product-detail-notice-wrapper">
		<table>
			<colgroup>
				<col style="width: 153px;">
				<col>
				<col style="width: 153px;">
				<col>
			</colgroup>
			<tbody id="product-detail-notice">
				<tr>
					<th>소재</th>
					<td>폴리에스터</td>
					<th>색상</th>
					<td>MULTI</td>
				</tr>
				<tr>
					<th>치수</th>
					<td><span>220 / 225 / 230 / 235 / 240 / 245 / 250 / 255 / 260 / 265 / 270 / 275 / 280 / 290</span></td>
					<th>굽높이</th>
					<td><span>(굽높이)</span></td>
				</tr>
				<tr>
					<th>제조자</th>
					<td><span>CONVERSE</span></td>
					<th>제조국</th>
					<td><span>베트남</span></td>
				</tr>
				<tr>
					<th>A/S 책임자와 전화번호</th>
					<td><span>ABC마트 A/S 담당자 : 080-701-7770</span></td>
					<th>제조년월</th>
					<td><span>상품별 입고시기에 따라 상이하여, 배송 받으신 제품의 라벨 참고 바랍니다.</span></td>
				</tr>
				<tr>
					<th>품질보증기준</th>
					<td><span>관련 법 및 소비자 분쟁 해결 기준에 따름 (품질보증기간 : 구입일로부터 6개월 이내)</span></td>
					<th>소재별 관리방법	</th>
					<td><span>상품 착용 및 세탁 시에는 제품에 부착된 라벨 및 취급 주의사항을 꼭 먼저 확인해 주시길 바랍니다. 가벼운 오염물이 묻었을 때에는 부드러운 솔로 털어내주시기 바랍니다. 물에 젖었을 때에는 바람이 잘 통하는 응달에 건조해 주시기 바랍니다.</span></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>