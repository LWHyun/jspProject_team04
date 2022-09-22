<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>교환/반품/AS 신청 시 택배비는 어떻게 결제 해야 하나요?</span></button>
  <div class="answer" id="ans-1">택배비는 교환/반품/AS 신청 시 선결제 하실 수 있습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>다른 상품으로 교환할 수 있나요?</span></button>
  <div class="answer" id="ans-2">교환의 경우 사이즈 교환만 가능하며, 색상 변경 및 다른상품으로의 교환은 반품(환불)후 재 주문 해주셔야 합니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>교환은 얼마나 걸리나요?</span></button>
  <div class="answer" id="ans-3">물류센터에서 고객님의 상품을 수령한 후 업무일 기준 2~3일(주말/공휴일 제외)정도 소요됩니다.<br>
이 부분은 택배사의 사정에 의해 지연 될 수 있으므로 참고 부탁드립니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>환불내역은 어디서 확인할 수 있나요?</span></button>
  <div class="answer" id="ans-4">로그인 후 [마이페이지 > 쇼핑내역 > 취소/교환/반품] '반품'에서 해당 주문건의 상세내역 확인이 가능합니다.<br>
처리 완료일로 부터 평일기준 3~4일(주말, 공휴일 제외)정도 이후 결제하신 수단을 통해 환불내역을 확인하실 수 있습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>맞교환 가능한가요?</span></button>
  <div class="answer" id="ans-5">
	A-RT 온라인쇼핑몰의 경우 맞교환처리는 가능하지 않습니다.<br>
맞교환으로 인한 고객과 쇼핑몰, 택배사 사이의 분쟁사례가 너무 많기 때문에<br>
시간이 걸리더라도 순차적으로 업무를 처리할 수 있도록 양해부탁드립니다.</div>
</div>


<script>
  var items2 = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items2.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>