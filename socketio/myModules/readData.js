module.exports=function(database,callback){
	const db = database.db('test');
	var collection = db.collection('fs.files');

	collection.find({}).toArray(function(err, result){
		console.log("Found the following records");
		callback(err,result);
	});
};
