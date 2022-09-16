var MongoClient = require('mongodb').MongoClient;
var url ='mongodb://abakasam:fd0giUk0NM5ZbbOx@cluster0.zm8a2.azure.mongodb.net:27017'
var dbName = 'myFirstDatabase'

MongoClient.connect(url, function(err, client) {
	var adminDb = client.db(dbName).admin();

	adminDb.listDatabases(function(err, dbs) {
		client.close()
	})
})