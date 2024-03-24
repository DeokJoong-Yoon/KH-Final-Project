$(function(){
	
	//지역 선택
	$("#gu").change(function() {
		const selectedGu = $(this).val();
		const dongList = guAndDong[selectedGu];
		
		$("#dong").empty();
		
		$.each(dongList, function(index, dong) {
			$("#dong").append($("<option>", {
				value: dong, 
				text: dong
			}));
		});
	});
	
	const guAndDong = {
		'강남구' : ['개포동', '논현동', '대치동', '도곡동', '삼성동', '세곡동', '수서동', '신사동', '압구정동', '역삼동', '율현동', '일원동', '자곡동', '청담동'],
		'강동구' : ['강일동', '고덕동', '길동', '둔촌동', '명일동', '상일동', '성내동', '암사동', '천호동'],
		'강북구' : ['미아동', '번동', '수유동', '우이동'],
		'강서구' : ['가양동', '개화동', '공항동', '과해동', '내발산동', '등촌동', '마곡동', '방화동', '염창동', '오곡동', '오쇠동', '외발산동', '화곡동'],
		'관악구' : ['남현동', '봉천동', '신림동'],
		'광진구' : ['광장동', '구의동', '군자동', '능동', '자양동', '중곡동', '화양동'],
		'구로구' : ['가리봉동', '개봉동', '고척동', '구로동', '궁동', '신도림동', '오류동', '온수동', '천왕동', '항동'],
		'금천구' : ['가산동', '독산동', '시흥동'],
		'노원구' : ['공릉동', '상계동', '월계동', '중계동', '하계동'],
		'도봉구' : ['도봉동', '방학동', '쌍문동', '창동'],
		'동대문구' : ['답십리동', '신설동', '용두동', '이문동', '장안동', '전농동', '제기동', '청량리동', '회기동', '휘경동'],
		'동작구' : ['노량진동', '대방동', '동작동', '본동', '사당동', '상도동', '신대방동', '흑석동'],
		'마포구' : ['공덕동', '구수동', '노고산동', '당인동', '대흥동', '도화동', '동교동', '마포동', '망원동', '상수동', '상암동', '서교동', '성산동', '신공덕동', '신수동', '신정동', '아현동', '연남동', '염리동', '용강동', '중동', '창전동', '토정동', '하중동', '합정동', '현석동'],
		'서대문구' : ['남가좌동', '냉천동', '대신동', '대현동', '미근동', '봉원동', '북가좌동', '북아현동', '신촌동', '연희동', '영천동', '옥천동', '창천동', '천연동', '충정로', '합동', '현저동', '홍은동', '홍제동'],
		'서초구' : ['내곡동', '반포동', '방배동', '서초동', '신원동', '양재동', '염곡동', '우면동', '원지동', '잠원동'],
		'성동구' : ['금호동', '도선동', '마장동', '사근동', '상왕십리동', '성수동', '송정동', '옥수동', '용답동', '응봉동', '하왕십리동', '행당동', '홍익동'],
		'성북구' : ['길음동', '돈암동', '동선동', '동소문동', '보문동', '삼선동', '상월곡동', '석관동', '성북동', '안암동', '장위동', '정릉동', '종암동', '하월곡동'],
		'송파구' : ['잠실동', '신천동', '풍납동', '송파동', '석촌동', '삼전동', '가락동', '문정동', '장지동', '방이동', '오금동', '거여동', '마천동'],
		'양천구' : ['목동', '신월동', '신정동'],
		'영등포구' : ['당산동', '대림동', '도림동', '문래동', '신길동', '양평동', '양화동', '여의도동', '영등포동'],
		'용산구' : ['갈월동', '남영동', '도원동', '동빙고동', '동자동', '문배동', '보광동', '서계동', '서빙고동', '신계동', '용문동', '용산동', '원효로', '이촌동', '이태원동', '주성동', '청파동', '한강로', '한남동', '효창동', '후암동'],
		'은평구' : ['갈현동', '구산동', '녹번동', '대조동', '불광동', '수색동', '신사동', '역촌동', '응암동', '증산동', '진관동'],
		'종로구' : ['가회동', '견지동', '경운동', '계동', '공평동', '관수동', '관철동', '관훈동', '교남동', '교북동', '구기동', '궁정동', '권농동', '낙원동', '내수동', '내자동', '누상동', '하동', '당주동', '도렴동', '돈의동', '동숭동', '명륜', '묘동', '무악동', '봉익동', '부암동', '사간동', '사직동', '삼청동', '서린동', '세종로', '소격동', '송월동', '송현동', '수송동', '숭인동', '신교동', '신문로', '신영동', '안국동', '연건동', '연지동', '예지동', '옥인동', '와룡동', '운니동', '원남동', '원서동', '이화동', '익선동', '인사동', '인의동', '장사동', '재동', '적선동', '종로', '중학동', '창성동', '창신동', '청운동', '청진동', '체부동', '충신동', '통의동', '통인동', '팔판동', '평동', '평창동', '필운동', '행촌동', '혜화동', '홍지동', '홍파동', '화동', '효자동', '효제동', '훈정동'],
		'중구' : ['광희동', '남대문로', '남산동', '남창동', '남학동', '다동', '만리동', '명동', '무교동', '무학동', '묵정동', '방산동', '봉래동', '북창동', '산림동', '삼각동', '서소문동', '소공동', '수표동', '수하동', '순화동', '신당동', '쌍림동', '예관동', '예장동', '오장동', '을지로', '의주로', '인현동', '입정동', '장교동', '장충동', '저동', '정동', '주교동', '주자동', '중림동', '초동', '충무로', '충정로', '태평로', '필동', '황학동', '회현동', '흥인동'],
		'중랑구' : ['면목동', '망우동', '묵동', '상봉동', '신내동', '중화동']
	}
	
	
	
	//선택된 조건의 내용을 담을 변수 선언
	let guValue, dongValue, ageValue, subjectValue, feeValue, keywordValue;
	let privateCheckedName = [];
	
	//검색결과 조회하기 버튼 클릭 시
	$("#mcSearchBtn").on("click", function(){
		
		
		//변수에 선택된 value 저장
		personalId = $("#personalId").val();
		guValue = $("#gu").val();
		dongValue = $("#dong").val();
		ageValue = $("input[name='matchingTargetGrade']:checked").val();
		subjectValue = $("input[name='matchingTargetSubject']:checked").val();
		feeValue = $("input[name='matchingFee']:checked").val();
		keywordValue = [];
		$("input[name='matchingKeyword']:checked").each(function() {
            keywordValue.push($(this).val());
        });
        
	
		console.log(keywordValue.length);
		if(keywordValue.length > 3) {
			alert("키워드는 3개까지만 선택 가능합니다.");
		}
		else if(guValue==undefined || dongValue==undefined || ageValue==undefined || subjectValue==undefined || feeValue==undefined || keywordValue.length == 0) {
			alert("모든 항목을 선택해 주세요.");
		}
		else {		//모든 항목이 선택되었을 때 검색 결과 영역을 띄움
			$(".mcResultSection").css("display", "block");
		}
		
		for (let i = 0; i < keywordValue.length; i++) {
			$("input[name='matchingKeyword" + (i+1) + "']").val(keywordValue[i]);
		}
		
		
		
		let value = {
			matchingGuAddress : guValue,
			matchingDongAddress : dongValue,
			matchingTargetGrade : ageValue,
			matchingTargetSubject : subjectValue,
			matchingFee : feeValue,
			matchingKeyword1 : keywordValue[0],
			matchingKeyword2 : keywordValue[1],
			matchingKeyword3 : keywordValue[2]
		}
		
		console.log(value);
		
		
		
		$.ajax({
			type:'POST',
			url : '/matching/result',
			headers : {
				"Content-Type" : "application/json"
			},
			data: JSON.stringify(value),
			dataType : "json",
			success: function(data) {
				console.log(data);
				
				// 서버로부터 받은 JSON 데이터를 테이블 형태로 변환하여 화면에 표시
		        var result = "";
		        
		        if(data != null && data.length > 0) {
					// JSON 데이터를 순회하며 각 항목을 테이블 행으로 추가
			        for (var i = 0; i < data.length; i++) {
			            result += '<tr>';
			            result += '<td><input type="checkbox" name="privateChecked" value="' + data[i].academyName + '" disabled></td>'; 
			            result += '<td><b>' + data[i].academyName + '</b></td>';
			            result += '<td>' + data[i].academyRoadAddress + '</td>';
			            result += '<td>' + data[i].academyPhone.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3') + '</td>';
			            result += '</tr>';
			        }
				} else {
					result = '<tr><td colspan="4">조회 결과가 없습니다.</td></tr>';
				}
		
		        // 테이블을 #resultDiv에 삽입
		        $("#resultDiv").html(result);
		        
			},
			error:function(xhr, textStatus, errorThrown) {
				alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
			}
		})

	})
			
	
	//공개매칭 버튼 클릭 시
	$("#mcPublicBtn").off("click").on("click", function(){
		$("input[type='password']").prop("disabled", true);
		$(".mcResult input[type='checkbox']").prop("disabled", true);
		$("#mcStartArea").css("display", "block");
		
		//매칭시작 버튼 클릭 시
		$("#mcUploadBtn").off("click").on("click", function() {
			
			if( $("#plusComment").val().replace(/\s/g,"") == "") {
				alert("덧붙이는 말을 입력해 주세요.");
				$("#plusComment").focus();
				return false;
			} else {
				let formData = new FormData();
				
				console.log(keywordValue[0]);
				console.log(keywordValue[1]);
				console.log(keywordValue[2]);
				
				if(keywordValue[1]==undefined) {
					keywordValue[1]='';
				} 
				
				if(keywordValue[2]==undefined) {
					keywordValue[2]='';
				} 
				
				formData.append('personalId', personalId);
				formData.append('matchingGuAddress', guValue);
				formData.append('matchingDongAddress', dongValue);
				formData.append('matchingTargetGrade', ageValue);
				formData.append('matchingTargetSubject', subjectValue);
				formData.append('matchingFee', feeValue);
				formData.append('matchingKeyword1', keywordValue[0]);
				formData.append('matchingKeyword2', keywordValue[1]);
				formData.append('matchingKeyword3', keywordValue[2]);
				formData.append('matchingComment', $("#plusComment").val());
				
				$.ajax({
		            type: "POST",
		            url: "/matching/publicUpload",
		            data: formData,
		            processData: false,  // 데이터를 query 문자열로 변환하지 않음
		            contentType: false,  // 데이터 형식을 설정하지 않음
		            success: function(response) {
			            alert(response);
				        window.location.href = "/matching/";
		            },
		            error: function(xhr, status, error) {
		                alert("공개 매칭 게시글이 정상 등록되지 않았습니다. 잠시 후 다시 시도해 주시기 바랍니다.");
		            	location.reload();
		            }
		        });
			}			
			
		});
	})
	
	
	//비공개매칭 버튼 클릭 시
	$("#mcPrivateBtn").off("click").on("click", function(){
		$("input[type='password']").prop("disabled", false);
		$(".mcResult input[type='checkbox']").prop("disabled", false);
		$("#mcStartArea").css("display", "block");
		
		
		//매칭시작 버튼 클릭 시
		$("#mcUploadBtn").off("click").on("click", function() {
			
			if($("input[name='privateChecked']:checked").length == 0) {
				alert("비공개 매칭은 학원 선택 후에만 가능합니다.")
					location.reload();
			} else if( !/^\d{4}$/.test($("#mcPwd").val())){
				alert("비밀번호는 숫자 4자리로 입력해 주세요.");
				$("#mcPwd").val('');
				$("#mcPwd").focus();
				return false;
			} else if( $("#plusComment").val().replace(/\s/g,"") == "") {
				alert("덧붙이는 말을 입력해 주세요.");
				$("#plusComment").focus();
				return false;
			} else {
				
				$("input[name='privateChecked']:checked").each(function(){
					privateCheckedName.push($(this).val());
				})
				
				let formData = new FormData();
				
				if(keywordValue[1]==undefined) {
					keywordValue[1]='';
				} 
				
				if(keywordValue[2]==undefined) {
					keywordValue[2]='';
				} 
				
				formData.append('personalId', personalId);
				formData.append('matchingGuAddress', guValue);
				formData.append('matchingDongAddress', dongValue);
				formData.append('matchingTargetGrade', ageValue);
				formData.append('matchingTargetSubject', subjectValue);
				formData.append('matchingFee', feeValue);
				formData.append('matchingKeyword1', keywordValue[0]);
				formData.append('matchingKeyword2', keywordValue[1]);
				formData.append('matchingKeyword3', keywordValue[2]);
				formData.append('matchingComment', $("#plusComment").val());
				formData.append('matchingPasswd', $("#mcPwd").val());
				formData.append('privateChecked', privateCheckedName);
				
				console.log(privateCheckedName);
				
				/*if(privateCheckedName.length == 0) {
					alert("비공개 매칭은 학원 선택 후에만 가능합니다.")
					$("#plusComment").val('');
					$("#mcPwd").val('');
					
				}*/
				
				if(privateCheckedName.length != 0) {
					$.ajax({
			            type: "POST",
			            url: "/matching/privateUpload",
			            data: formData,
			            processData: false,  // 데이터를 query 문자열로 변환하지 않음
			            contentType: false,  // 데이터 형식을 설정하지 않음
			            success: function(response) {
			                alert(response);
			                window.location.href = "/matching/";
			            },
			            error: function(xhr, status, error) {
			                alert("비공개 매칭 게시글 등록과 메일 발송이 정상적으로 처리되지 않았습니다. 잠시 후 다시 시도해 주시기 바랍니다.");
			                location.reload();
			            }
			        });
				}
								
				
			}
			
			
		});
	});
	
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
		
		let matchingPrivate = $(this).closest("tr").find("input[name='matchingPrivate']").val();
		let matchingPasswd = $(this).closest("tr").find("input[name='matchingPasswd']").val();
		let boardNumber = $(this).closest("tr").attr("data-num");
		let writerId = $(this).closest("tr").find(".writerId").text();
		let personalId = $("#personalId").val();
		let academyId = $("#academyId").val();
		
		if(personalId == '' && academyId == '') {
			console.log("if");
			alert("로그인 후 열람 가능합니다.");
			$(this).attr("href", "/matching/boardList")
		} else if(matchingPrivate == 'Y') {
			console.log("else if 1");
			let pwd = prompt("비밀번호를 입력하세요", '');
				if(pwd == matchingPasswd) {
					$(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber)
				} else {
					alert("비밀번호가 일치하지 않습니다.");
					$(this).attr("href", "/matching/")
			}
		} else if(matchingPrivate == 'N' || personalId == writerId) {
			console.log("else if 2");
			$(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber)
		} 
		
	})
	
	//매칭게시판 전체보기
	$("#gotoMcBoard").on("click", function(){
		location.href = "/matching/boardList";
	})
});