<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
span {
	font: bold;
}

/* ============= FAQ  =============  */
/* 고객센터 */
.contents-inner .page-title-wrap {
	margin-top: 18px;
}

/* 고객센터 아랫부분 */
.contents-wrap .page-title-wrap+.contents-inner.contents-aside {
	margin-top: 50px;
}

/* 왼쪽 선택창 (공지사항, FAQ) */
.wrap .contents-wrap .contents-aside .aside-wrap {
	width: 220px;
	padding-right: 60px;
}

.customer-wrap .customer-lnb {
	-webkit-transform: translateY(-1px);
	transform: translateX(-1px);
}

.customer-wrap .customer-lnb .customer-lnb-item.eng a {
	font-family: "Montserrat", sans-serif;
	font-weight: 600;
	color: red;
	text-decoration: underline;
	letter-spacing: 0;
}

.customer-wrap .customer-lnb .customer-lnb-item+.customer-lnb-item {
	margin-top: 25px;
}

/* 중앙화면 */
.aside-contents {
	margin-top: -140px;
	width: calc(31% - 162px);
}

.text-head2.eng, .text-head2 .eng {
	font-family: "Montserrat", sans-serif;
	letter-spacing: 0;
	
}

.wrap .contents-wrap .contents-aside .aside-contents {
    width: calc(100% - 220px);
}

.border-line-box-header {
	position: relative;
}

.border-line-box-header+.border-line-box, .border-line-box-header+.mypage-detail-info-box,
	.border-line-box-header+.mypage-complete-wrap {
	margin-top: 16px;
}

.border-line-box {
	margin-top: 54px;
	border-top: 2px solid #000;
	transform: translateX(138px);
}

ol, ul {
	list-style: none;
}

.border-line-box .fold-box-list .fold-box:first-child {
	border-top: none;
}

.text-head1 {
	color: #000;
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-size: 32px;
	font-weight: 700;
	margin-top: 50px;
	margin-bottom: 50px;
}

.contents-width {
	width: 1200px;
	margin: 0 auto;
}

.aside-wrap {
	width: 220px;
	padding-right: 60px;
}

[id$="-toggle"] {
	margin-right: 15px;
}

a {
	text-decoration: none;
	color: black;
}

tr {
	padding: 10px 10px 10px 10px;
    border: 1px solid grey;
    height: 10px;
 }
 
.text-head2 {
	color: #000;
	font-family: "Montserrat", "Noto Sans KR", sans-serif;
	font-weight: 800;
	font-size: 22px;
	letter-spacing: -1.1px;
	transform: translateX(138px);
}

.text-head2.eng{
	font-family: "Montserrat", sans-serif;
	letter-spacing: 18px;
	transform: translate(595px, 23px);
}

</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	/* 브랜드 선택 */
/* 	function ChangeBrand() {
		var val_str = document.getElementById('select_brand');
		
		alert("브랜드 : " + val_str.options[val_str.selectedIndex].value);
	} */
	
	
	/* form 태그와 연결 스크립트 */
	function fnElementCheck(f) {
		// f 파라미터의 사이즈 계산
		var cnt = f.elements.length();	// input 타입(엘리먼트)의 갯수 접근
		var filecnt = 1;
		
		for(i=0 ; i< cnt ; i++) {
			if(f.elements[i].type == "file") {
				if(f.elements[i].value == "") {
					var msg = filecnt + "번째 파일 정보가 누락되었습니다. \n 올바른 입력을 해주세요.";
					alert(msg);
					f.elements[i].focus();
					return;
				}
				filecnt++;
			}
		}
		
		f.submit();	// form 태그 전송 버튼
	}
	
</script>
<body>
	<!-- 헤더 -->
	<div id="header">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- 본문 -->

	<div id="contentsWrap" class="contents-wrap">
		<div class="contents-width">
			<div class="contents-inner">

				<!-- 관리자 페이지 -->
				<div class="page-title-wrap mypage">
					<h2 class="text-head1 text-left">관리자 페이지</h2>
				</div>

				<!-- 고객센터 밑 화면 -->
				<div class="contents-inner contents-aside customer-wrap">
					<!-- 왼쪽 선택창 -->
					<div class="aside-wrap">
						<ol class="customer-lnb">
							<li class="customer-lnb-item"><a href="manNoticeList.do">공지사항 관리</a></li>
							<li class="customer-lnb-item eng"><a href="manProductList.do" class="active">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 공지사항 등록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">상품 등록</h3>
						
						<form action="manProductRegisterPro.do?pageNum=${pageNum}" method="post" enctype="multipart/form-data" style="transform: translate(350px, 10px);">
						
						<table style="margin-top: 50px; margin-bottom: 30px; border: 1px solid grey; width: 500px; transform: translate(80px);">
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">상품 대표 이미지 등록</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;" >
									<input type="file" name="l_file_path" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">상품 상세 이미지 등록</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="file" name="s_file_path" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;"> 저장 폴더 선택 </td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
             					<!-- <input type="hidden" name="brand" required="required"> -->
								<select name="path_brand">
									<option value="Adidas_images">ADIDAS</option>
									<option value="Birkenstock_images">BIRKENSTOCK</option>
									<option value="Converse_images">CONVERSE</option>
									<option value="DrMartens_images">DR.MARTENS</option>
									<option value="Fila_images" selected="selected">FILA</option>
									<option value="Lacoste_images">LACOSTE</option>
									<option value="Nike_images">NIKE</option>
								</select>
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;"> 제품코드</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="text" name="product_id" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;"> 브랜드 </td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
            					<!-- <input type="hidden" name="brand" required="required"> -->
										<select name="brand">
											<option value="ADIDAS">ADIDAS</option>
											<option value="BIRKENSTOCK">BIRKENSTOCK</option>
											<option value="CONVERSE">CONVERSE</option>
											<option value="DR.MARTENS">DR.MARTENS</option>
											<option value="FILA">FILA</option>
											<option value="LACOSTE">LACOSTE</option>
											<option value="NIKE">NIKE</option>
										</select>
								</td>
							</tr>
							
							
							
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;"> 사이즈 등록</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="radio" id="m_size_num" name="size_check[]" value="200,210,220,230,240">남성용
									<input type="radio" id="f_size_num" name="size_check[]" value="100,110,120,130,140">여성용<br><br>
									<input type="text" id="pd_size" name="pd_size" readonly="readonly">
								</td>
							</tr>
							
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">영어이름</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;" > <input type="text" name="eng_name" required="required"></td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">한글이름</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;" > <input type="text" name="kor_name" required="required"></td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">성별</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;" >
									<input type="radio" name="gender" value="0">남자
									<input type="radio" name="gender" value="1">여자
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">가격</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="text" name="price" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">색상</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="text" name="color" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">카테고리 코드</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="number" name="ca_code" required="required">
								</td>
							</tr>
							<tr>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 150px; height: 10px;">재고</td>
								<td style="padding: 10px 10px 10px 10px; border: 1px solid grey; width: 250px; height: 10px;">
									<input type="number" min="0" name="stock" required="required">
								</td>
							</tr>	

						</table>
						<div style="transform: translate(231px, 13px); margin-top:15px;">
							<input type="submit" value="확인" onclick="fnElementCheck(this.form)">
							<input type="reset" value="취소">
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#m_size_num").change(function(){
			if($("#m_size_num").is(":checked")){
				$('#pd_size').val('250,260,270,280,290');
			}
		});	
			
		$("#f_size_num").change(function(){
			if($("#f_size_num").is(":checked")){
				$('#pd_size').val('220,230,240,250,260');
			}
		});	
	});

</script>
</html>