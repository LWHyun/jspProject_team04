<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	
</style>
<div class="tab-wrap header-tab ui-tabs ui-corner-all ui-widget ui-widget-content">
    <ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
        <!-- <li class="tabs-li1">
            <a href="#" id="newProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">최근 본 상품(<span id="recentPdtCount">0</span>) </a>
        </li > -->

        <li class="tabs-li2">
            <a href="#" id="wishProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">찜한 상품(${requestScope.likeProCnt}) </a>
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

        <div class="mypage-no-data has-line-bottom" style="display:none;" >
            <div class="flex-box">
                <p class="no-data-text">찜한 상품이 없습니다.</p>
            </div>
        </div><!-- has-line-bottom -->
        
        
    </div><!-- tab-content -->
    
    <!-- 페이징 처리부분 -->
    <div class="paging">
	                            
     </div>
</div><!-- tab-wrap header-tab 최근 본 상품 / 찜한 상품-->