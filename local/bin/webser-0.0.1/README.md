# Webser

Simple node web server

## Running

	PUBLIC_HTML=/home/cabox/workspace/abakasam/local/public_html
	export PUBLIC_HTML
	node web.js

## Debug

	DEBUG=express:* ../iojs-3.3.1/node web.js

## Features

Iniatiate mutliple features by configuration files per application

### Set headers
### Serve directory
### URL path
### Not Found
### Display file
### Download file
### Query database
### Query metadata
### Process form
### Upload file
### Default public_html 

## Documentation

	PUBLIC_HTML=/home/cabox/workspace/abakasam/local/public_html
	export PUBLIC_HTML
	cp express.docs.zip $PUBLIC_HTML
	cd $PUBLIC_HTML
	mkdir express
	mv express.docs.zip express
	cd express
	unzip express.docs.zip
	http://localhost:3000/express/expressjs.com