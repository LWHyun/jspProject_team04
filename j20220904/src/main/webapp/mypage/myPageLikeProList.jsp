<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPage.css">
<style>
/* likePro-header */
.likePro-header {
	margin-bottom:10px;
}
/* 페이지 네비게이션 css */
.pagination-wrap {
	margin-top: 30px;
    padding-top: 40px;
    border-top: 1px solid #b5b5b5;
    position: relative;
    text-align: center;
}	
.pagination-wrap .pagination-list {
    display: inline-block;
}
.pagination-wrap .pagination-list .pagination-item {
    float: left;
}
.pagination-wrap .pagination-list .pagination-item+.pagination-item {
    margin-left: 4px;
}
/* 선택 안된 페이지 */
.pagination-wrap .pagination-list .btn-page {
    color: #999;
    width: 26px;
    height: 26px;
    text-align: center;
    font-family: "Montserrat",sans-serif;
    font-size: 13px;
}
/* 선택된 페이지 */
.pagination-wrap .pagination-list .btn-page.selected {
    color: #fff;
    background: #111;
}
/* 이전 다음 */
.pagination-item.showPrev {
	position:relative; top:3px;
	cursor:pointer;
	margin-right: 10px;
}
.pagination-wrap .pagination-list .pagination-item+.pagination-item.showNext {
	position:relative; top:3px;
	margin-left: 10px;
	cursor:pointer;
}
</style>
<input type="hidden" name="curPage" id="curPage" value="${requestScope.curPage }">
<div class="tab-wrap header-tab ui-tabs ui-corner-all ui-widget ui-widget-content">
	<div class="likePro-header">
	    <ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
	        <!-- <li class="tabs-li1">
	            <a href="#" id="newProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">최근 본 상품(<span id="recentPdtCount">0</span>) </a>
	        </li > -->
	
	        <li class="tabs-li2">
	            <a href="#" id="wishProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">찜한 상품(${requestScope.likeProCnt}) </a>
	        </li>
	    </ul>
	    
	    <c:if test="${requestScope.likeProCnt > 0}">
		    <div class="check-wrap">
		    	<span class="ui-chk">
					<input id="chk-list-all" type="checkbox">
					<label for="chk-list-all">
						<span class="search-result-text">모두 선택</span>
					</label>
				</span>
				<div class="btn-wrap">
		            <button type="button" class="btn-txt-arr" id="deleteLikeBtn">찜 삭제</button>
		        </div>
			</div>
		</c:if>
	</div>
	
    <div class="tab-content">
        <div class="col-list-wrap" >
            <ul class="col-list prod-list col-4">
            	<!-- 동적 처리 부분 -->
            	<%-- <!-- 체크 박스 넘버 -->
            	<c:set var="chkNum" value="0"/>
                <c:forEach var="likeProDTO" items="${likeProList }">
                    <li class="col-list-item prod-item no-util">
                    	<!-- 찜하기 선택 체크박스 -->
                    	<span class="ui-chk chk-prod">
							<input id="chk-prod-${chkNum }" class="chk-prod-box" type="checkbox" name="prodChecked" value="${likeProDTO.product_id }">
							<label for="chk-prod-${chkNum }"></label>
						</span>
						<c:set var="chkNum" value="${chkNum+1 }"/>
						
                        <a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${likeProDTO.product_id}&gender=${likeProDTO.gender}" class="prod-link">
                 
                            <div class="img-wrap">
                                <img src="${likeProDTO.s_file_path }" alt="${likeProDTO.kor_name }" class="recent-product-image">
                            </div>
                            
                            <div class="prod-info-wrap">
                                <span class="prod-brand">${likeProDTO.brand }</span>
                                <span class="prod-name">${likeProDTO.kor_name }</span>
                                <span class="prod-price">${likeProDTO.price }</span>
                            </div>
                        </a>
                    </li>
                </c:forEach> --%>
            </ul>
        </div><!-- col-list-wrap -->
	
		<!-- // 찜한 상품이 있을 때 없을 때 display:none 처리는 myPage.jsp에 있는 jquery 의 영향을 받고있음 -->
        <div class="mypage-no-data has-line-bottom" style="display:none;" >
            <div class="flex-box">
                <p class="no-data-text">찜한 상품이 없습니다.</p>
            </div>
        </div><!-- has-line-bottom -->
        
        
    </div><!-- tab-content -->
    
   	<!-- 찜한 상품이 있을 때만 표기 -->
    <c:if test="${requestScope.likeProCnt > 0 }">
	    <!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<!-- 동적 처리 부분 -->
	    		<ol class="pagination-list">
	    			<%-- <c:if test="${ph.showPrev == true }">		
		    			<li class="pagination-item showPrev">
		    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${ph.startPage-1}">&lt;</a>
		    			</li>
	    			</c:if>
	    			
	    			<c:forEach var="i" begin="${ph.startPage }" end="${ph.endPage }">
	    				<c:if test="${requestScope.curPage == i}">
			    			<li class="pagination-item" name="li_page">			
			    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${i }">
			    				<button type="button" class="btn-page btn-page-num selected">${i }</button>		
			    				</a>
		    				</li>	
	    				</c:if>
	    				<c:if test="${requestScope.curPage != i}">
			    			<li class="pagination-item" name="li_page">	
			    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${i }">		
			    				<button type="button" class="btn-page btn-page-num">${i }</button>		
			    				</a>
		    				</li>
	    				</c:if>
	    			</c:forEach>	
    				
    				<c:if test="${ph.showNext == true}">
	    				<li class="pagination-item showNext">
		    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${ph.endPage+1}">&gt;</a>
		    			</li>	
	    			</c:if> --%>
   				</ol>
			</div>
		</div>
    </c:if>
</div><!-- tab-wrap header-tab 최근 본 상품 / 찜한 상품-->

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
function boardPaging(pagingNumber) {
	/* 이미 만들어진 li 태그 삭제 */
	$('ul.col-list.prod-list.col-4 li').remove();
	
	/* ajax - json */
	$.ajax({
		url : '${pageContext.request.contextPath}/mypage/jsonLikeProList.do',
		type : 'post',
		data : 'curPage='+pagingNumber,
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			// for문
			
			// 체크 박스 넘버
			let chkNum = 0;
			$.each(data.list, function(index, items) {
				console.log(index, items.kor_name, items.gender, items.price, items.product_id, items.mem_id, 
						items.s_file_path, items.brand, items.like_pro_date);

				// ul 태그
				$('.col-list.prod-list.col-4').append($('<li/>', {
												class : 'col-list-item prod-item no-util'
												}).append($('<span/>', {
													class : 'ui-chk chk-prod'
													}).append($('<input>', {
														id : 'chk-prod-'+(++chkNum),
														class : 'chk-prod-box',
														type : 'checkbox',
														name : 'prodChecked',
														value : items.product_id
													})).append($('<label/>', {
														for : 'chk-prod-'+chkNum
													}))
												).append($('<a/>', {
													href : '${pageContext.request.contextPath }/contents/contents_men.do?product_id='+items.product_id+'&gender='+items.gender,
													class : 'prod-link'		
													}).append($('<div/>', {
														class : 'img-wrap'
														}).append($('<img>', {
															src : items.s_file_path,
															alt : items.kor_name,
															class : 'recent-product-image'
														}))
													 ).append($('<div/>', {
														 class : 'prod-info-wrap'
														 }).append($('<span/>', {
															 class : 'prod-brand',
															 text : items.brand
														 })).append($('<span/>', {
															 class : 'prod-name',
															 text : items.kor_name
														 })).append($('<span/>', {
															 class : 'prod-price',
															 text : items.price
														 })))
															
								)// li 의 append
				)// ul의 append
			});// $.each
			
			// 이미 만들어진 페이징 삭제
			$('.pagination-list li').remove();
			
			// 페이징 처리
			if(data.ph.showPrev == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showPrev'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.startPage-1)+')',	
											text : '<'
										})))
			}
			
			for(let i = Number(data.ph.startPage); i <= Number(data.ph.endPage); i++) {
				if(data.curPage == i) {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num selected',
												text : i
											}))))
				} else {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num',
												text : i
											}))))
				}
			} // for 문
			
			if(data.ph.showNext == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showNext'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.endPage+1)+')',
											text : '>'
										})))
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
}

$(function() {
	// 찜한 상품이 있을 때 없을 때 display:none 처리
	var listCnt = Number(${requestScope.likeProCnt});
	if(listCnt == 0) {
		$('.mypage-no-data').css('display', '');
		$('.col-list-wrap').css('display', 'none');
	} else {
		$('.mypage-no-data').css('display', 'none');
		$('.col-list-wrap').css('display', '');
	}
	
	/* ajax - json */
	$.ajax({
		url : '${pageContext.request.contextPath}/mypage/jsonLikeProList.do',
		type : 'post',
		data : 'curPage='+$('#curPage').val(),
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			// for문
			
			// 체크 박스 넘버
			let chkNum = 0;
			$.each(data.list, function(index, items) {
				console.log(index, items.kor_name, items.gender, items.price, items.product_id, items.mem_id, 
						items.s_file_path, items.brand, items.like_pro_date);

				// ul 태그
				$('.col-list.prod-list.col-4').append($('<li/>', {
												class : 'col-list-item prod-item no-util'
												}).append($('<span/>', {
													class : 'ui-chk chk-prod'
													}).append($('<input>', {
														id : 'chk-prod-'+(++chkNum),
														class : 'chk-prod-box',
														type : 'checkbox',
														name : 'prodChecked',
														value : items.product_id
													})).append($('<label/>', {
														for : 'chk-prod-'+chkNum
													}))
												).append($('<a/>', {
													href : '${pageContext.request.contextPath }/contents/contents_men.do?product_id='+items.product_id+'&gender='+items.gender,
													class : 'prod-link'		
													}).append($('<div/>', {
														class : 'img-wrap'
														}).append($('<img>', {
															src : items.s_file_path,
															alt : items.kor_name,
															class : 'recent-product-image'
														}))
													 ).append($('<div/>', {
														 class : 'prod-info-wrap'
														 }).append($('<span/>', {
															 class : 'prod-brand',
															 text : items.brand
														 })).append($('<span/>', {
															 class : 'prod-name',
															 text : items.kor_name
														 })).append($('<span/>', {
															 class : 'prod-price',
															 text : items.price
														 })))
															
								)// li 의 append
				)// ul의 append
			});// $.each
			
			
			// 페이징 처리
			if(data.ph.showPrev == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showPrev'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.startPage-1)+')',	
											text : '<'
										})))
			}
			
			for(let i = Number(data.ph.startPage); i <= Number(data.ph.endPage); i++) {
				if(data.curPage == i) {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num selected',
												text : i
											}))))
				} else {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num',
												text : i
											}))))
				}
			} // for 문
			
			if(data.ph.showNext == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showNext'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.endPage+1)+')',
											text : '>'
										})))
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
	
	// 찜한 상품 모두 선택 / 해제
	/* $('#chk-list-all').click(function() {
		let checked = $(this).is(':checked');
		
		if(checked) {
			$('.chk-prod-box').prop('checked', true);
		} else {
			$('.chk-prod-box').prop('checked', false);
		}
	}); */
	
	
	// chk-prod-box
	// 개별 선택 / 해제
	/* $('.chk-prod-box').click(function() {
		let is_checked = true;
		
		$('.chk-prod-box').each(function() {
			is_checked = is_checked && $(this).is(':checked');
		});	
		
		$('#chk-list-all').prop('checked', is_checked);
	}); */
	
	
	// 찜 삭제 버튼
	
	/* $('#deleteLikeBtn').click(function() {
		
	}); */
});

$(document).on('click', '#chk-list-all', function() {
	let checked = $(this).is(':checked');
	
	if(checked) {
		$('.chk-prod-box').prop('checked', true);
	} else {
		$('.chk-prod-box').prop('checked', false);
	}
});

$(document).on('click', '.chk-prod-box', function() {
	let is_checked = true;
	
	$('.chk-prod-box').each(function() {
		is_checked = is_checked && $(this).is(':checked');
	});	
	
	$('#chk-list-all').prop('checked', is_checked);
});

$(document).on('click','#deleteLikeBtn', function() {
	var queryString = "";
	$('.chk-prod-box:checked').each(function(index) {
		let is_checked = $(this);
		
		if(index == $('.chk-prod-box:checked').length-1) {
			queryString += $(is_checked).attr('name')+"="+$(is_checked).attr('value');
		} else {
			queryString += $(is_checked).attr('name')+"="+$(is_checked).attr('value')+"&";
		}
	});	
	
	if($('.chk-prod-box:checked').length != 0) {
		if(confirm('선택하신 제품을 삭제하시겠습니까?')) {
			$.ajax({
				url : '${pageContext.request.contextPath}/mypage/deleteLike.do',
				type : 'post',
				data : queryString,
				dataType : 'text',
				success : function(data) {
					if(data != '0') {
						alert('삭제되었습니다.');
						location.href="${pageContext.request.contextPath}/mypage/likeProList.do"
					} else {
						alert('삭제에 실패했습니다. 다시 시도해주세요.');
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
	} else {
		alert("삭제할 상품을 체크해주세요.");
	}
});


</script>
