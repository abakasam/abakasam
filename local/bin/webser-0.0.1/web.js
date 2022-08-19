var networkstream = require('send')
var express = require('express')
express.application = express()
express.router = express.Router()


// TODO: Route failure without any debug info (Complete)

// TODO: Set headers for express globally https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers (Complete)

var PUBLIC_HTML = '/home/cabox/workspace/abakasam/local/public_html'

var options = {
	redirect: false,
	setHeaders: function(response, path, status) {
		response.set('X-TIMESTAMP', Date.now())
	}
}
//express.application.use(express.static(PUBLIC_HTML, options))
express.application.all('*', function(request, response) {
	console.log(request._parsedUrl.path)

	networkstream(request, request._parsedUrl.path, { root: PUBLIC_HTML }).pipe(response)
	
	// TODO: https://www.npmjs.com/package/send	
	// TODO: Use ls and DOM to response.sendFile
})

express.application.get('/hello', function(request, response) {
	response.send('Hello')
})
express.application.get('/404', function(request, response) {
	response.status(404).end()
})
express.application.set('Content-Type', 'text/html')
express.application.get('/', function(request, response) {
	response.sendFile('/home/cabox/workspace/abakasam/local/public_html/index.html')
})
express.application.get('/download', function(request, response) {
	response.download('/home/cabox/workspace/abakasam/local/bin/webser-0.0.1/file')
})
express.application.get('/query', function(request, response) {
	var mysql = require("mysql")

	var configuration = {
		provider: 'https://cleardb.com',
		host: 'us-cdbr-east-04.cleardb.com',
		user: 'b8f3dd1d8d9c29',
		password: '0611b499',
		database: 'heroku_23ebff43a942f06',
		multipleStatements: true
	}

	var connection = mysql.createConnection(configuration)

	var SQL = 'SHOW TABLES'
	connection.query(SQL, [], function(errors, results, fields) {
		response.send(results)
	})

	connection.end()
})
//express.application.get('/store', function(request, response) { MongoDB })

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