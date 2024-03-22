window.onload = function(){
    var paymentBtn = document.getElementById('paymentBtn');
    paymentBtn.addEventListener('click', function(){
        let year = new Date().getFullYear();
        let month = new Date().getMonth() + 1;
        let date = new Date().getDate();
        let time = new Date().getTime();
		let academyId = document.getElementById("academy_id").innerText;
		let academyNumber = document.getElementById("academy_number").innerText;
		let academyName = document.getElementById("academy_name").innerText;
		let academyStatus = document.getElementById("academy_status").innerText;
		let academyManagerName = document.getElementById("academy_manager_name").innerText;
		let academyManagerEmail = document.getElementById("academy_manager_email").innerText;
		let academyManagerPhone = document.getElementById("academy_manager_phone").innerText;
        let payment_date = year + '-' + month + '-' + date;
		var IMP = window.IMP;
		IMP.init('imp30526851');
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card', //카드결제
		    merchant_uid : 'merchant_' + time,
		    name : 'MyEduMySelect 결제',
		    amount : 150, //판매가격
		    buyer_name : academyManagerName,
		    buyer_email : academyManagerEmail,
		    buyer_tel : academyManagerPhone,
		}, function(rsp) {
		    if ( rsp.success ) {
		        academyStatus = '1';	//	결제 성공
		        pay_info(rsp, academyId, academyNumber, academyName, academyStatus, payment_date);
		        
		    } else {
				var msg = '결제에 실패하였습니다.';
        		msg += '에러내용 : ' + rsp.error_msg;
        		//console.log(msg);
				location.href="/payment/payFail";
		    }
		});
    });
    
    document.getElementById('resetBtn').addEventListener('click', function(){
		if(confirm("결제를 취소하시겠습니까?")) {
			location.href="/";	
		}
		return;
	});
    
    printCurrentAndThirtyDaysAfterDate();
}


function pay_info(rsp, academy_id, academy_number, academy_name, academyStatus, payment_date){
      var form = document.createElement('form');
      var objs;
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'pg');
      objs.setAttribute('value', rsp.pg_provider);
      form.appendChild(objs);
 
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'payMethod');
      objs.setAttribute('value', rsp.pay_method);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'merchantUid');
      objs.setAttribute('value', rsp.merchant_uid);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'name');
      objs.setAttribute('value', rsp.name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'payAmount');
      objs.setAttribute('value', rsp.paid_amount );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyId');
      objs.setAttribute('value', academy_id );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyNumber');
      objs.setAttribute('value', academy_number );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyName');
      objs.setAttribute('value', academy_name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyManagerName');
      objs.setAttribute('value', rsp.buyer_name );
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyManagerEmail');
      objs.setAttribute('value', rsp.buyer_email);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'academyManagerPhone');
      objs.setAttribute('value', rsp.buyer_tel);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'paymentStatus');
      objs.setAttribute('value', academyStatus);
      form.appendChild(objs);
      
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'paymentDate');
      objs.setAttribute('value', payment_date);
      form.appendChild(objs);
 
      form.setAttribute('method', 'post');
      form.setAttribute('action', "/payment/paySuccess");
      document.body.appendChild(form);
      form.submit();
}

// 현재 날짜와 시간을 가져오는 함수
function getDateTime() {
    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();

    //한 자리 수일 경우 앞에 0을 추가하여 두 자리로 표시
    day = (day < 10) ? "0" + day : day;
    month = (month < 10) ? "0" + month : month;

    // HTML 요소에 현재 날짜와 시간을 삽입
    document.getElementById('currentDate').innerHTML = year + "-" + month + "-" + day;
    document.getElementById('endDate').innerHTML = year + "-" + month + "-" + day;
}

// 현재 날짜와 30일 후 날짜를 계산하고 출력하는 함수
function printCurrentAndThirtyDaysAfterDate() {
    var currentDate = new Date();
    var endDate = new Date(currentDate.getTime() + 30 * 24 * 60 * 60 * 1000);
    
    var currentDateString = formatDate(currentDate);
    var endDateString = formatDate(endDate);
    
    document.getElementById('currentDate').innerHTML = currentDateString;
    document.getElementById('endDate').innerHTML = endDateString;
}

// 날짜를 YYYY-MM-DD 형식의 문자열로 변환하는 함수
function formatDate(date) {
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return `${year}-${month}-${day}`;
}
