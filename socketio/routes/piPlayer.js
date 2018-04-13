var express = require('express');
var router = express.Router();
var getFileFromDB = require('../myModules/getFileFromDB');
var readData = require('../myModules/readData');
var mpg = require('mpg123');
var MongoClient = require('mongodb').MongoClient;
var config = require('../myModules/config');
var deleteData = require('../myModules/deleteData');

var player = new mpg.MpgPlayer();
var currentVolume = 100;
var currentIndex = 0;
var dbUrl = config.dbUrl();
var fileList = new Array();

MongoClient.connect(dbUrl, function(err, database){
	readData(database, function(err, filelist){
		database.close();
		for (var i=0; i< filelist.length; i++){
			fileList.push(filelist[i]._id.toString());
		}

	});
});

function play(fileid){
	getFileFromDB(fileid, function(filename){
		console.log('play on pi');
		player.play("Temp/"+filename);
	});
}

function autoPlay(){
	currentIndex++;
	if (currentIndex == fileList.length)
		currentIndex = 0;

	play(fileList[currentIndex]);
}

//player.on('end',autoPlay);

router.get('/play', function(req, res){
	var fileid = req.param('id');
	currentIndex = fileList.indexOf(fileid);

	if (currentIndex <  0) {
		currentIndex = 0;
	}

	play(fileList[currentIndex]);
	res.redirect('/');

});

router.get('/volume', function(req, res){
	var flag = req.param('flag');

	if(flag == 'U') {
		currentVolume += 10;
	} else if (flag == 'D') {
		currentVolume -= 10;
	}

	if (currentVolume > 100) {
		currentVolume = 100;
	} else if (currentVolume < 0) {
		currentVolume = 0;
	}

	player.volume(currentVolume);

	res.redirect('/');
});

router.get('/pause', function(req, res){
	player.pause();

	res.redirect('/');
});

router.get('/stop', function(req, res){
	player.stop();

	res.redirect('/');
});

router.get('/delete', function(req, res){
	var fileid = req.param('id');
	
	MongoClient.connect(dbUrl, function(err, database){
		deleteData(database,fileid, function(){
			database.close();
			var delIndex = fileList.indexOf(fileid);
			fileList.splice(delIndex,1);
			res.redirect('/');
		});

	});
});

router.get('/next', function(req, res){
	currentIndex++;
	
	if(currentIndex == fileList.length)
		currentIndex = 0;

	play(fileList[currentIndex]);
});

router.get('/prev', function(req, res){
	currentIndex--;
	
	if (currentIndex < 0)
		currentIndex = (fileList.length-1);
	
	play(fileList[currentIndex]);
});

module.exports = router;
