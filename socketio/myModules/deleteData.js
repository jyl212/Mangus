var ObjectID = require('mongodb').ObjectID;

module.exports = function(database, id, collback){
	const db = database.db('test');
	var fileCollection = db.collection('fs.files');
	var chunksCollection = db.collection('fs.chunks');
	var objId = new ObjectID(id);
	console.log(id);

	fileCollection.deleteOne({"_id" : objId});
	chunksCollection.deleteMany({"files_id" : objId});
	
	collback();
};
