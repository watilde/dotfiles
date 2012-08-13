var grepList = ['"^\.$"','"^\.\.$"', '.git', 'setup.js'];

var shellCommand = function(hyphenE){
	var proto = 'ls -a ./ | grep -v';
	for(var i=0; i<hyphenE.length; i++){
		proto += ' -e '+hyphenE[i];
	}
	return proto;
};

function custArray(stdout) {
	stdout = stdout.split('\n');
	stdout = stdout.splice(0, stdout.length-1);
	return stdout;
}

var exec = require('child_process').exec;

exec(shellCommand(grepList), function(err, stdout, stderr){
	if(!err){
		stdout = custArray(stdout);
		console.log(stdout);
	}
});
