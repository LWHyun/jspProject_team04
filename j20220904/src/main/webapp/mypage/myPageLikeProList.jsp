<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
<div class="tab-wrap header-tab ui-tabs ui-corner-all ui-widget ui-widget-content">
    <ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
        <!-- <li class="tabs-li1">
            <a href="#" id="newProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">최근 본 상품(<span id="recentPdtCount">0</span>) </a>
        </li > -->

        <li class="tabs-li2">
            <a href="#" id="wishProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">찜한 상품(${requestScope.ph.totalCnt}) </a>
        </li>
    </ul>

    <div class="tab-content">
        
        <div class="col-list-wrap" >
            <ul class="col-list prod-list col-4">
                <c:forEach var="likeProDTO" items="${likeProList }">
                    <li class="col-list-item prod-item no-util">
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
                </c:forEach>
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
    <c:if test="${ph.totalCnt > 0 }">
	    <!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<ol class="pagination-list">
	    			<c:if test="${ph.showPrev == true }">		
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
	    			</c:if>
   				</ol>
			</div>
		</div>
    </c:if>
</div><!-- tab-wrap header-tab 최근 본 상품 / 찜한 상품-->

