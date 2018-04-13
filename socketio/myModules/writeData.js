module.exports=function(database,data,callback){
	const db = database.db('test');
	var collection = db.collection('fs.files');

	collection.insertOne(data, function(err,result){
		callback(err,result);		
	});
}
