var exec = require('child_process').exec;

var dotfiles = function dotfiles(){
	var shellCommand = function shellCommand(hyphenE){
		var proto = 'ls -a ./ | grep -v';
		for(var i=0; i<hyphenE.length; i++){
			proto += ' -e '+hyphenE[i];
		}
		return proto;
	};

	var custArray = function custArray(stdout) {
		stdout = stdout.split('\n');
		stdout = stdout.splice(0, stdout.length-1);
		return stdout;
	}

	var grepList = ['"^\.$"','"^\.\.$"', '.git', 'setup.js'];
	exec(shellCommand(grepList), function(err, stdout, stderr){
		if(!err && !stderr){
			stdout = custArray(stdout);
			console.log(stdout);
			return (stdout);
		}
	});
};

var a = dotfiles();
console.log(a);
