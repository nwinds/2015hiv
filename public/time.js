var xmlRequest;
function CreateRequest () {
	// body...
	if(window.ActiveObject)
	{
		/** if web browser support AxtiveX object, then create a XMLHttpRequest suppoting IE */
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHTTPRequest)
	{
		/** if web browser support XMLHttpRequest object, the directly create a XMLHTTPRequest */
		return new XMLHttpRequest();
	}
}

function ResponseHandler () {
	// body...
	if (xmlRequest.readyState == 4 && xmlRequest.status == 200) {
		var reqContent = xmlRequest.responseText;
		document.getElementById("now").innerHTML = reqContent;
	};
}		


function AjaxAccess () {
	// body...
	xmlRequest = CreateRequest();						/* create XMLHttpRequest object */
	xmlRequest.onreadystatechange = ResponseHandler;	/* set up callback function */
	xmlRequest.open("GET", "store/nowtime");			/* initialize request */
	xmlRequest.send(null);
}

window.onload = function(){
	AjaxAccess();
}