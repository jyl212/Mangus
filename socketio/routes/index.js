var express = require('express');
var router = express.Router();
var MongoClient = require('mongodb').MongoClient
	, assert = require('assert');
var config = require('../myModules/config');
var readData = require('../myModules/readData');

var dbUrl = config.dbUrl();

/* GET home page. */
router.get('/', function(req, res, next) {
	MongoClient.connect(dbUrl, function(err,db){
		readData(db,function(err,data){
			assert.equal(err,null);
			db.close();
		  res.render('index',{title:'upload',filelist:data});
		});
	});
});

module.exports = router;
