window.onload = function(){
    var paymentBtn = document.getElementById('paymentBtn');
    paymentBtn.addEventListener('click', function(){
        let year = new Date().getFullYear();
        let month = new Date().getMonth() + 1;
        let date = new Date().getDate();
		var IMP = window.IMP;
		IMP.init('imp30526851');
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card', //카드결제
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'MyEduMySelect 결제',
		    amount : 10, //판매가격
		    academy_id : 'yid',
		    academy_number : '10230412',
		    academy_name : 'KH정보교육원',
		    academy_manager_name : '윤덕중',
		    academy_manager_email : 'ykdj92@naver.com',
		    academy_manager_phone : '010-7209-8826',
		    payment_date : year + '-' + month + '-' + date
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
    });
}


function pay_info(rsp){
      var form = document.createElement('form');
      var objs;
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'pg');
      objs.setAttribute('value', rsp.pg);
      form.appendChild(objs);
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'pay_method');
      objs.setAttribute('value', rsp.pay_method);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'merchant_uid');
      objs.setAttribute('value', rsp.merchant_uid);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'name ');
      objs.setAttribute('value', rsp.name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'amount ');
      objs.setAttribute('value', rsp.amount );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_id ');
      objs.setAttribute('value', rsp.academy_id );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_number ');
      objs.setAttribute('value', rsp.academy_number );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_name ');
      objs.setAttribute('value', rsp.academy_name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_manager_name ');
      objs.setAttribute('value', rsp.academy_manager_name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_manager_email ');
      objs.setAttribute('value', rsp.academy_manager_email );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academy_manager_phone ');
      objs.setAttribute('value', rsp.academy_manager_phone );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'payment_date  ');
      objs.setAttribute('value', rsp.payment_date  );
      form.appendChild(objs);
 
      
      
      form.setAttribute('method', 'post');
      form.setAttribute('action', "/payment/paySuccess");
      document.body.appendChild(form);
      form.submit();
}