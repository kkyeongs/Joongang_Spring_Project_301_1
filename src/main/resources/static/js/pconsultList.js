const subBar = document.querySelector("a#subTitle");
const inpuBar =  document.querySelector("input#inputbar");
const submitBar = document.querySelector("input#submitbar");

const HIDDEN_CLASS = "hidden";

function openBar(event){
	event.preventDefault();
    console.log("hello");
    inpuBar.classList.toggle(HIDDEN_CLASS);
    submitBar.classList.toggle(HIDDEN_CLASS);
}

subBar.addEventListener("click",openBar);
	
	
