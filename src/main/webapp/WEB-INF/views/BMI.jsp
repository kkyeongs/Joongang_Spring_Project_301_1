<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* EmpController */
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

</script>
</head>
<body>
<div>
	<form id="frm">
		<ul style="  list-style:none; padding-left: 10px; padding-bottom: 10px;">
			<li>
				<label>신장</label>
				<span class="s1">
				<input type="text" title="신장" maxlength="6" style="width:104px;ime-mode:disabled;" id="height" name="height">cm<br>
				</span>
				<label>체중</label>
				<span class="s2">
				<input type="text" id="weight" title="체중"  name="weight" maxlength="6" style="width:104px;ime-mode:disabled;">kg<br>
				</span>
				
				<!-- <input type="submit" value="계산"><br> -->
			
				<div style="padding-top: 100px;">	
					<input type="button" id="btn_BMI"     value="BMI계산"  onclick="getBMICal()">
					<input type="text"  id="BMI" style="width: 70px;" >
				</div>	
			</li>
		</ul>	
	</form>
	<!-- <div id="content">
	</div> -->
</div>
	
<!-- <script src="js/BMI.js">

</script> -->

 </body>
</html>