<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>AS 수선비용과 택배비는 고객이 부담하나요?</span></button>
  <div class="answer" id="ans-1">A/S수선 유형에 따라 비용은 유상/무상으로 구분됩니다. <br>
수선접수로 이동되는 배송비는 고객님께서 부담하셔야 합니다. <br>
오프라인 매장 방문을 통한 수선 접수는 배송비가 부과되지 않습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>상품을 받고 1번 신었는데 상품에 문제가 있는 것 같아요</span></button>
  <div class="answer" id="ans-2">외부 착화 후 발견된 상품 이상은 해당 브랜드사로 심의접수를 하여 이상여부를 확인 합니다.<br>
브랜드사의 심의를 통해 상품 불량으로 확인이 될 경우  반품(환불)을 받으실 수 있습니다. <br>
상품 불량으로 확인이 되지 않은 경우에는 고객님께 반송처리 됩니다. <br>
이후 심의 결과에 대해 이견이 있으실 경우 외부심의기관을 통한 재심의 접수를 하실 수 있습니다. 
</div>
</div>

<div class="faq-content">
  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>심의 접수는 어떻게 하나요?</span></button>
  <div class="answer" id="ans-5">고객센터로 전화주시면 연락드리겠습니다. <br> (고객센터 : 1234-5678)</div>
</div>

<div class="faq-content">
  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>심의도 비용이 드나요?</span></button>
  <div class="answer" id="ans-4">상품불량에 대한 심의접수는 별도의 접수 비용이 발생되지 않습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>수선 비용이 어떻게 되나요?</span></button>
  <div class="answer" id="ans-5">수선 비용은 브랜드 및 수선 부분에 따라 상이하며 정확한 금액은 상품 상태 확인 후 안내가 가능합니다.<br>
자세한 수선 비용은 고객센터로 문의해 주시기 바랍니다. <br> (고객센터 : 1234-5678인)</div>
</div>


<script>
  var items4 = document.querySelectorAll('.question');

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

  items4.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>