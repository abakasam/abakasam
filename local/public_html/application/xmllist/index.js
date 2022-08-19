var request = new XMLHttpRequest()

//request.addEventListener('load', function() {
//	var data = this.responseText
//	var xml = (new DOMParser()).parseFromString(data, 'text/xml')
//})

request.open('GET', 'https://drifty-abakasam720639.codeanyapp.com/xmllist/list.xml')
request.send()

