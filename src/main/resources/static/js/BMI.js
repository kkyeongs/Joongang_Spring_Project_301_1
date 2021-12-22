	const form = document.querySelector("#form2");
	const height = document.querySelector("#height");
	const weight = document.querySelector("#weight");
	const content = document.querySelector("#content")
	
	function dosubmit(event) {
	    event.preventDefault();
	    BMI_cal();
	}
	
	function BMI_cal() {
	    const THeight = height.value;
	    const TWeight = weight.value;
	    let RHeight = THeight;
	    console.log(weight.value);
	    console.log(THeight.value);
	    console.log(TWeight.value);
	
	    RHeight = RHeight / 100;
	
	    const bmi = TWeight / (RHeight * RHeight);
	    console.log(bmi);
	    window.open('BMI.jsp?bmi=' + bmi);
	    
	    if(bmi > 50)
	    
	    document.getElementById("content").innerHTML = "<h1>${bmi}</h1>"
	
	}
	form.addEventListener("submit", dosubmit);