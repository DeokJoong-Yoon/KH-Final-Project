<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
<script>
var IMP = window.IMP;
IMP.init('imp30526851');
IMP.request_pay({
    pg : 'inicis',
    pay_method : 'card', //카드결제
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 1000, //판매가격
    buyer_email : '구매자 아이디',
    buyer_name : '구매자 이름',
    buyer_tel : '010-7209-8826',
    buyer_addr : '주소',
    buyer_postcode : '우편번호'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
         
        console.log(msg);
        //pay_info(rsp);
        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
        location.href="goods_pay_fail.do?error_msg="+rsp.error_msg;
    }
});

function pay_info(rsp){
      var form = document.createElement('form');
      var objs;
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_name');
      objs.setAttribute('value', rsp.buyer_name);
      form.appendChild(objs);
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_phone');
      objs.setAttribute('value', rsp.buyer_tel);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'member_email');
      objs.setAttribute('value', rsp.buyer_email);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buy_addr');
      objs.setAttribute('value', rsp.buyer_addr);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buy_product_name');
      objs.setAttribute('value', rsp.name);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_buyid');
      objs.setAttribute('value', rsp.imp_uid);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_merid');
      objs.setAttribute('value', rsp.merchant_uid);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'amount');
      objs.setAttribute('value', rsp.paid_amount);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_card_num');
      objs.setAttribute('value', rsp.apply_num);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_pay_ok');
      objs.setAttribute('value', rsp.success);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_postcode');
      objs.setAttribute('value', rsp.buyer_postcode);
      form.appendChild(objs);
 
      
      
      form.setAttribute('method', 'post');
      form.setAttribute('action', "goods_pay_success.do");
      document.body.appendChild(form);
      form.submit();
}
</script>
  </body>
</html>
