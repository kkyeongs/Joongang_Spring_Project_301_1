<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
<script type="text/javascript">
		$(window).scroll(function(event){
			if(jQuery(window).scrollTop() > jQuery(".banner").offset().top) {
				jQuery("#chase").css("position", "fixed");
			}else if((jQuery(window).scrollTop() < jQuery(".banner").offset().top)) {
				jQuery("#chase").css("position", "static");
			}
		});
		function getBMICal(){
			var vWeight = $('#weight').val();
			var vHeight = $('#height').val();
			/* alert("Vdeptno->"+Vdeptno); */
			$.ajax({
				url:"getBmiCal",  
				data:{weight : vWeight, height:vHeight},
				dataType:'text',
				success:function(data){
					 /* alert("success ajax Data"+data);   */
					 $('#BMI').val(data);     /*  input Tag */
					
				}
			});
		}
		
		
		// 예상 키 js
		function content() {
			let gender = $('#gender').val();
			let age = $('#age').val();
			let Fheight = $('#Fheight').val();
			let Mheight = $('#Mheight').val();
			let Bheight = 0;
	
			console.log(gender);
			console.log(age);
			console.log(Fheight);
			console.log(Mheight);
		    var str = "";
		    str += `<div id="heightContent">`;
		    str += `<br><br>`;
		    str += `당신의 성별은 \${gender}<br>`;
		    str += `당신의 나이는 \${age}<br>`;
		    str += `당신의 아버지의 키는 \${Fheight}<br>`;
		    str += `당신의 어머니의 키는 \${Mheight}<br>`;
		    
		    Bheight = Calculation(Fheight, Mheight, gender);
		    str += `당신의 예상 키는 \${Bheight}`;
		    str += `<br><br><br>`;
		    str += `</div>`;

		    document.querySelector("#heightContents").innerHTML = str;
		}

		function Calculation(Fheight, Mheight, gender) {
			var Bheight;
			console.log(Fheight);
			console.log(Mheight);
			console.log(gender);
			
		    if(gender === "남자") {
		        if((Number(Fheight) + Number(Mheight)) /2 > 190) {
		            Bheight = 195;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 185) {
		            Bheight = 190;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 180) {
		            Bheight = 185;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 180) {
		            Bheight = 180;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 175) {
		            Bheight = 175;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 170) {
		            Bheight = 170;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 165) {
		            Bheight = 165;
		        } else {
		            Bheight = 160;
		        }
		    } else if(gender === "여자") {
		        if((Number(Fheight) + Number(Mheight)) /2 > 190) {
		            Bheight = 185;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 185) {
		            Bheight = 180;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 180) {
		            Bheight = 175;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 180) {
		            Bheight = 170;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 175) {
		            Bheight = 165;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 170) {
		            Bheight = 160;
		        } else if((Number(Fheight) + Number(Mheight)) /2 > 165) {
		            Bheight = 155;
		        } else {
		            Bheight = 150;
		        }
		    }
		    console.log(Bheight);
		    return Bheight;
		}
	</script>

</head>
<body>
	<div class="modal fade" id="modalRegisterForm0" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">BMI 계산기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<i class="fas fa-user prefix grey-text"></i> <input type="text"
							id="height" class="form-control validate"> <label
							data-error="wrong" data-success="right" for="orangeForm-name">신장(cm)</label>
					</div>
					<div class="md-form mb-5">
						<i class="fas fa-envelope prefix grey-text"></i> <input
							type="text" id="weight" class="form-control validate"> <label
							data-error="wrong" data-success="right" for="orangeForm-email">체중(kg)</label>
					</div>
					<div class="md-form mb-4">
						<img src="img/modal/height_sc.jpg"
							style="height: 150px; width: 430px;"> <label
							data-error="wrong"></label>
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<input type="button" id="btn_BMI" value="계산하기"
						onclick="getBMICal()"> <input type="text" id="BMI"
						style="width: 70px;">
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalRegisterForm1" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">키 계산기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-3">
					<div class="md-form mb-4">
						<i class="fas fa-user prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="orangeForm-name">성별</label>
						<select id="gender" class="form-control validate" >
							<option>　</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select>
					</div>
					<div class="md-form mb-4">
						<i class="fas fa-envelope prefix grey-text"></i>
						<label data-error="wrong" data-success="right" for="orangeForm-email">나이</label>
						<input type="number" id="age" class="form-control validate">
					</div>
					<div class="md-form mb-4">
						<i class="fas fa-lock prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="orangeForm-pass">아버지 키</label>
						<input type="number" id="Fheight" class="form-control validate"> 
					</div>
					<div class="md-form mb-4">
						<i class="fas fa-lock prefix grey-text"></i> 
						<label data-error="wrong" data-success="right" for="orangeForm-pass">어머니 키</label>
						<input type="number" id="Mheight" class="form-control validate"> 
					</div>
					<div id="heightContents"></div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button class="btn btn-deep-orange" onclick="content()">결과보기</button>
				</div>
			</div>
		</div>
	</div>


	<div class="banner"
		style="position: absolute; z-index: 120; margin: 0; border: 0; padding: 0; top: 50px; right: 1px;">
		<div class="text-center" id="chase"
			style="position: absolute; width: 120px; height: 280px; background-color: white-space; z-index: 120; border-radius: 30px; margin-top: 160px; right: 0px;">
			<a href="" class="btn btn-default btn-rounded mb-4"
				data-toggle="modal"
				style="width: 100px; height: 100px; margin: 0; border: 0; padding: 0; border-radius: 30px;"
				data-target="#modalRegisterForm0"><img src="img/modal/BMI.png"
				style="width: 100px; height: 100px; border-radius: 30px;"></a> <a
				href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal"
				style="width: 100px; height: 100px; margin: 0; border: 0; padding: 0; border-radius: 30px;"
				data-target="#modalRegisterForm1"><img
				src="img/modal/height.png"
				style="width: 100px; height: 100px; border-radius: 30px;"></a>
		</div>
	</div>
</body>