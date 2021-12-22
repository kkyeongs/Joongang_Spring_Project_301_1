<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<style type="text/css">
	#submitLine {
		text-align: center;
	}
	#content {
		margin: 0px auto;
		text-align: center;
		border: 5px solid;
		border-color: aqua;
		width: 50%;
		background-color: white;
	}
</style>
<body>
	<div class="page-section">
		<div class="container">
			<h1 class="text-center wow fadeInUp">***예상키 계산하기***</h1>
			<form id="height_form" class="contact-form mt-5">
				<div class="row mb-3">
					<div class="col-sm-6 py-2 wow fadeInLeft">
						<label>성별</label>
						<select id="gender" class="form-control">
							<option>　</option>
							<option>남자</option>
							<option>여자</option>
						</select>
					</div>
					<div class="col-sm-6 py-2 wow fadeInRight">
						<label>나이</label>
						<input type="number" id="age" class="form-control">
					</div>
					<div class="col-sm-6 py-2 wow fadeInRight">
						<label>아버지 키</label>
						<input type="number" id="Fheight" class="form-control">
					</div>
					<div class="col-sm-6 py-2 wow fadeInRight">
						<label>어머니 키</label>
						<input type="number" id="Mheight" class="form-control">
					</div>
				</div>
				<div id="submitLine" class="col-sm-12 py-2 wow fadeInRight">
					<input type="submit" id="submitDo" class="btn btn-primary wow zoomIn" value="확인하기">
					<button type="button" class="btn btn-primary wow zoomIn" onclick="window.close()">　취소　</button>
				</div>
			</form>
		</div>
		<br><br><br>
		<div id="contents"></div>
	</div>
	<script src="js/expectationHeight.js"></script>
</body>

</html>