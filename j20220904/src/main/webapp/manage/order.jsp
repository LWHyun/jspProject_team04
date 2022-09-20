<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="faq-content">
  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>결제방법(결제수단)을 변경하고 싶어요.</span></button>
  <div class="answer" id="ans-1">결제완료 후 '배송완료' 상태까지만 결제수단 변경이 가능하므로 (구매확정 이후 변경 불가)<br>
주문상태를 확인하신 후 고객센터(1588-9667)로 요청해 주시면 재결제 가능하도록 처리해 드리고 있습니다.</div>
</div>

<div class="faq-content">
  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>무통장으로 입금했는데 며칠 이내에 입금을 해야 하나요?</span></button>
  <div class="answer" id="ans-2">3일 이내에 입금해 주셔야 하며, 입금마감 시간은 오후 4시 입니다.<br>
	예) 월요일 주문 > 수요일 오후 4시까지 입금 <br>
     금요일 주문 > 일요일 오후 4시까지 입금
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
  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>상품을 교환하거나 반품하려는데 배송비는 고객 부담인가요?</span></button>
  <div class="answer" id="ans-5">
	택배비는 반품/교환 신청시 선결제로 해주셔야 하며, 변심에 의한 반품/교환은 총 5,000원의 택배비가 부과됩니다. <br>
	판매자 지정택배 외 타 택배 이용 시 추가로 발생되는 비용은 고객께서 부담하시게 되오니 참고 바랍니다. <br>
	(최초 배송비(2500원) + 반송 배송비(2500원) = 총 5,000원) <br>
 	*아트배송 반품 배송비 (최초 배송비 3,500원 + 반송 배송비 2,500원 = 총 6,000원)<br><br>

	<상품에 이상이 있는 경우><br>
	택배비는 교환/반품 신청시 착불로 발송하신 후, 상품 불량 또는 오배송이 확인되지 않을시 택배비를 부담해 주셔야 합니다.</div>
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