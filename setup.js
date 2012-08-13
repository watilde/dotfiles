function fileList(stdout) {
	stdout = stdout.split('\n');
	var files = stdout.splice(2,stdout.length-3);
	for(i = 0; i < files.length; i++){
		if(files[i] == ".git" | files[i] == "setup.js"){
			files.splice(i,1);
		}
	}
	return files;
}

var exec = require('child_process').exec;

exec('ls -a ./', function(err, stdout, stderr){
	if(!err){
		var files = fileList(stdout);
		console.log(files);
	}
});
