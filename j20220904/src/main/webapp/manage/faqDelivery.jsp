<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>같은 날 주문했는데 배송이 따로 왔어요</span></button>
  <div class="answer" id="ans-1">온라인쇼핑몰에서는 온라인과 오프라인 매장의 상품이 동시에 판매되고 있습니다.<br>
	이에 같은 날 주문을 했더라도, 발송처에 따라 상품을 받는 시기가 다를 수 있습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>배송기간은 얼마나 되나요?</span></button>
  <div class="answer" id="ans-2">주문현황 상태가 '상품출고' 이후, 평균 2~3일정도 소요됩니다. <br>
	택배사의 사정에 따라 다소 지연이 될 수 있습니다.
</div>
</div>

<div class="faq-content">
  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>배송완료라고 나오는데 상품을 받지 못했어요.</span></button>
  <div class="answer" id="ans-3">구입한 상품의 실제 배송과 택배 시스템의 불일치로 인해 맞지 않는 경우도 있으니 <br>
	택배사 측으로 배송여부를 확인해 주셔야 합니다.<br>[한진택배 : 1588-0011]<br></div>
</div>

<div class="faq-content">
  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>왜 아직도 상품준비중이죠?</span></button>
  <div class="answer" id="ans-4">'상품준비중'은 상품을 발송하기 위해 확인하는 단계입니다.<br>
	만약 3일 이상 '상품 준비중'으로 확인될 경우, 1:1상담으로 문의하시거나 On the spot 고객센터로 문의해 주시기 바랍니다<br>
	(고객센터 : 02-1234-5678)<br></div>
</div>

<div class="faq-content">
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>배송일을 지정할 순 없나요?</span></button>
  <div class="answer" id="ans-5">배송일 지정은 불가능합니다.<br>
평균 배송일이 2~3일정도 소요되는 부분을 참고하여 주문해 주시기 바랍니다.><br>

	<상품에 이상이 있는 경우><br>
	택배비는 교환/반품 신청시 착불로 발송하신 후, 상품 불량 또는 오배송이 확인되지 않을시 택배비를 부담해 주셔야 합니다.</div>
</div>


<script>
  var items1 = document.querySelectorAll('.question');

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

  items1.forEach(item => item.addEventListener('click', openCloseAnswer));

</script>

