<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>회원 가입 시 나이 제한이 있나요?</span></button>
  <div class="answer" id="ans-1">만 14세 미만은 회원으로 가입할 수 없습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>본인명의 휴대폰 아닌데 가입못하나요?</span></button>
  <div class="answer" id="ans-2">회원가입은 휴대폰 본인인증을 통해 본인 확인 후 가입이 가능합니다. <br>
본인명의의 휴대폰이 아니라면, I-PIN을 통한 실명확인을 통해서 가입하실 수 있습니다.
</div>
</div>

<div class="faq-content">
  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>실명확인을 꼭 해야 하나요?</span></button>
  <div class="answer" id="ans-3">반드시 실명확인을 하셔야 합니다.<br>
소중한 개인정보의 유출을 막기위해 본인을 확인하는 절차이며, 고객님들의 소중한 개인정보를 보호하기 위한 목적이오니 안심하셔도 됩니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>탈퇴했는데 재가입은 언제 다시 할 수 있나요?</span></button>
  <div class="answer" id="ans-4">탈퇴일로부터 14일 이후 재가입이 가능합니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>회원 탈퇴 시 유의해야 하는 건 없나요?</span></button>
  <div class="answer" id="ans-5">회원 탈퇴 시, 회원가입 시 입력한 모든 정보는 소멸됩니다.<br>
단. 전자상거래법 등의 관계 법령에 의해 상품 구매 관련 내역은 주문일로부터 5년간 별도 보관됩니다.<br>
적립된 포인트는 자동 소멸되며,  재가입시 포인트는 재적립 되지 않습니다.<br>
(※ 포인트 및 쿠폰 등 기존 혜택 승계 불가능)</div>
</div>


<script>
  var items5 = document.querySelectorAll('.question');

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

  items5.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>