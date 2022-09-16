var express = require('express')
express.application = express()
express.router = express.Router()

var PUBLIC_HTML = '/home/cabox/workspace/abakasam/local/public_html'

express.application.all('*', function(request, response) {
	var file = PUBLIC_HTML + request._parsedUrl.pathname
	
	if(request.method == 'POST') {}

	console.log(request.get('Content-Disposition'))
	
	response.sendFile(file)
})

var multer = require('multer')
var upload = multer({
	dest: 'uploads/'
})

express.application.get('/form', function(request, response) {
	response.send('<form action="/upload" method="post" enctype="multipart/form-data"><input type="file" name="file"/><p>Name<input type="text" name="name"/></p><input type="submit"/></form>')
})
express.application.post('/upload', upload.single('file'), function(request, response) {
	response.send(request.query.name)
	response.send('Finish upload!')
})

express.application.listen(3000)