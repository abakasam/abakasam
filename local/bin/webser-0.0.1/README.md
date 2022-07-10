Webser - Simple node web server

DEBUG=express:* ../iojs-3.3.1/node web.js

// TODO: Fix express callback with next in request
express
function(request, response, next) {
	request.next = next
	request.next()
}

// TODO: Parse URL parameters from slug
MDN URL

// TODO: Find public_html from command not code
public_html	 (website)

// TODO: Local node databases not system or linux
database (local)
 programming MongoDB
 information MySQL

Multer Upload Example

const express = require('express')
const multer  = require('multer')
const upload = multer({ dest: 'uploads/' })

const app = express()
app.get('/', function(req, res) { res.send('<form action="/profile" method="post" enctype="multipart/form-data"><input type="file" name="avatar" /><input type="submit"/></form>') })
app.post('/profile', upload.single('avatar'), function (req, res, next) {res.send('hello')})
app.post('/photos/upload', upload.array('photos', 12), function (req, res, next) {res.send('hello2')})

const cpUpload = upload.fields([{ name: 'avatar', maxCount: 1 }, { name: 'gallery', maxCount: 8 }])
app.post('/cool-profile', cpUpload, function (req, res, next) {res.send('hello3')})

app.listen(3000)