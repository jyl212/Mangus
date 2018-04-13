var MongoClient = require('mongodb').MongoClient
	, assert = require('assert');
var ObjectID = require('mongodb').ObjectID;
var GridFSBucket = require('mongodb').GridFSBucket;
var fs = require('fs');
var config = require('./config');

var dbUrl = config.dbUrl();

module.exports=function(fileid, callback){
	console.log(fileid);
	MongoClient.connect(dbUrl, function(err, database){
		if (err) console.error(err);			
		const db = database.db('test');
		var collection = db.collection('fs.files');

		var fileinfo = collection.findOne({'_id':new ObjectID(fileid)}, function(err,doc){
		console.log(doc);
		var bucket = new GridFSBucket(db);
		var filename = doc.filename;
		var ext = getExtensionOfFilename(filename);

		var writable = fs.createWriteStream("Temp/temp"+ext);
		var readStream = bucket.openDownloadStreamByName(filename);

		readStream.pipe(writable);

		writable.on('error', function(error){
			assert.ifError(error);
		});

		writable.on('finish', function(){
			console.log('load file complete');
			callback('temp'+ext);
		});
	});

	});
} 

/** * 파일명에서 확장자명 추출
 * @param filename 파일명
 * @returns _fileExt 확장자명
 */ 
function getExtensionOfFilename(filename) { 

	var _fileLen = filename.length; 
	
	/**
	 * lastIndexOf('.')
	 * 뒤에서부터 '.'의 위치를 찾기위한 함수
	 * 검색 문자의 위치를 반환한다.
	 * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
	 */ 
	var _lastDot = filename.lastIndexOf('.');
	
	// 확장자 명만 추출한 후 소문자로 변경
	var _fileExt = filename.substring(_lastDot, _fileLen).toLowerCase();
	
	return _fileExt;
}
