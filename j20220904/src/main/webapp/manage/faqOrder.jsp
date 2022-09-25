<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>주문한 상품금액보다 실수로 더 입금을 했는데 환불이 가능한가요?</span></button>
  <div class="answer" id="ans-1">저희는 가상계좌를 이용하고 있습니다. <br>
주문 금액과 일치할 경우에만 정상 입금처리가 되며, 많거나 적은 금액은 입금되지 않습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>무통장으로 입금했는데 며칠 이내에 입금을 해야 하나요?</span></button>
  <div class="answer" id="ans-2">3일 이내에 입금해 주셔야 하며, 입금마감 시간은 오후 4시 입니다.<br>
	예) 월요일 주문 > 수요일 오후 4시까지 입금 <br>
     금요일 주문 > 일요일 오후 4시까지 입금
</div>
</div>

<div class="faq-content">
  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>전화로도 주문이 가능한가요?</span></button>
  <div class="answer" id="ans-3">전화주문이 불가하며, 온라인몰을 통해 직접 주문해주셔야 합니다.<br></div>
</div>

<div class="faq-content">
  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>상품을 여러가지 주문했는데 배송지를 각각 다르게 할 수 있나요?</span></button>
  <div class="answer" id="ans-4">주문건당 배송지는 한 곳으로만 지정 가능합니다.<br>
여러곳에서 상품을 받아야 하는 경우에는 각각 주문을 해주시면 됩니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>비회원도 주문이 가능한가요?</span></button>
  <div class="answer" id="ans-5">비회원으로는 상품 주문이 불가능합니다.</div>
</div>


<script>
  var items3 = document.querySelectorAll('.question');

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

  items3.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>