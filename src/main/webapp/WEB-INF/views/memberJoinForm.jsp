<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/board.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/maicons.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendor/owl-carousel/css/owl.carousel.css">
<link rel="stylesheet" href="vendor/animate/animate.css">
<link rel="stylesheet" href="css/theme.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="js/theme.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
input {
	margin: .4rem;
}

@font-face {
	font-family: 'MaruBuri-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

body {
	font-family: 'MaruBuri-Regular';

}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="copyright" content="MACode ID, https://macodeid.com/">

<title>Insert title here</title>
<script type="text/javascript">
	function test() {
       
		let idcheck = $('#idcheck').val();
		 
		if(!(frm.pw.value == frm.pwChk.value)){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		
		if(idcheck == '0'){
			alert("중복체크를 하지 않았거나 사용할 수 없는 아이디입니다.");
			return false;
		}
		
		var state = $('#state').val();
		/* alert("state->"+state); */
	    if (state == 2) {
           var a = prompt("직원용 비밀번호를 입력하세요 ");
           if(a == '0222'){
        	   var deptParam = prompt("부서를 입력하세요");
        	   alert(deptParam);
        	   var dept = document.getElementById("dept");
        	   alert(dept.value);
        	   dept.value = deptParam;
        	   alert(dept.value);
           		return true;
           }else{
           		alert("비밀번호가 틀렸습니다");
           		return false;
           }
		} else{
		  return true;
		} 
	}
	
	/* 아이디 중복체크 */
     function sendId() {
	    if(frm.id.value == ""){
	        	 alert("아이디를 입력해주세요");
	        	 return false; 
	        	 }
	    
        let userId = $('#id').val();
    	const param = {"id" : userId}; // id가 member 객체로 들어감 
        console.log(param);
        
        $.ajax({
        	url : "memberIdChk", 
        	type : "POST",
        	data: param
        }).done(
       		function(result){
       			console.log(result);
	        	if(result === 0){
	        		alert("사용할 수 있는 아이디입니다");
	        		$('#idcheck').val('1');
	        	} else{
	        		alert("사용할 수 없는 아이디입니다");
	        		$('#idcheck').val('0');
	        	}
	    }).fail(
        	function(data){
        		console.log(data);
        		alert("오류입니다.");
        	});
	}
        
    /*     window.location.href = "memberIdChk?id=" + userId; */
   
	const autoHyphen = (target) => {
		target.value = target.value
		.replace(/[^0-9]/, '')
		.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<!-- Back to top button -->
	<div class="back-to-top"></div>
	<%@include file="header.jsp"%>

	<div style="text-align: center; margin-top: 100px;">
		<form action="memberJoin" name="frm" onsubmit="return test()">
			<h2>회원가입</h2>
			<p>Join</p>
			<hr style="width: 30%; height: 40px">
			회원 ID <br> <input type="text" id="id" name="id"
				required="required" style="margin-left: 130px;"> <input
				type="button" onclick="sendId()" value="중복체크"
				class="btn btn-sm btn-primary"><br>
				
			<!-- 중복체크 안 하면 0, 하면 1로 바뀌도록(중복체크 안 하면 가입할 수 없게) -->
			<input type="hidden" id="idcheck" name="idcheck" value="0">

			<div style="margin-top: 2%">
				비밀번호 <br> <input type="password" name="pw" required="required">
				<br>
			</div>
			<div style="margin-top: 2%">
				비밀번호 확인 <br> <input type="password" name="pwChk"
					required="required"> <br>
			</div>
			<div style="margin-top: 2%">
				이메일 <br> <input type="text" name="email" required="required">
				<br>
			</div>
			<div style="margin-top: 2%">
				이름 <br> <input type="text" name="name" required="required">
				<br>
			</div>
			<div style="margin-top: 2%">
				주소 <br> <input type="text" name="text1" id="sample6_postcode" placeholder="우편번호" style="margin-left: 9.5%">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-sm btn-primary"><br>
						<input type="text" name="text2" id="sample6_address" placeholder="주소"><br>
						<input type="text" name="text3" id="sample6_detailAddress" placeholder="상세주소"><br>
						<input type="text" name="text4" id="sample6_extraAddress" placeholder="참고항목">
				
				<!-- <input type="text" name="addr" required="required"> -->
				<br>
			</div>
			<div style="margin-top: 2%">
				핸드폰 번호 <br> <input type="text" name="phone" oninput="autoHyphen(this)" maxlength="13" required="required"><br>
			</div>
			<div style="margin-top: 3%">
				<p style="margin-bottom: 1%">회원구분</p>
				<div>
					<select name="state" id="state">
						<option value="1" selected="selected">회원</option>
						<option value="2">직원</option>
					</select>
				</div>
			</div>
			<input type="hidden" id="dept" name="dept">
			<input type="submit" value="가입하기" class="btn btn-sm btn-primary"
				style="margin-top: 5%">
		</form>
	</div>
</body>
<script src="js/memberJoin.js"></script>
	<%@include file="footer.jsp"%>
</html>