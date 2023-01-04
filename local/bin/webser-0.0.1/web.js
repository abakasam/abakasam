var express = require('express')
express.application = express()
express.router = express.Router()

var PUBLIC_HTML = '/home/cabox/workspace/abakasam/local/public_html'

express.application.all('*', function(request, response) {
	var file = PUBLIC_HTML + request._parsedUrl.pathname
	
	if(request.method == 'POST') {}
	
	filename = file.split('/')
	filename = filename[filename.length - 1]
	
	response.sendFile(file)
	console.log('File loaded ', filename)
})
  
express.application.listen(3000, function() {
	console.log('Server listening at 3000')
})