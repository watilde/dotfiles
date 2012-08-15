var dotfiles = (function (){
	var shell = function shell(hyphenE){
		var proto = 'ls -a ./ | grep -v';
		for(var i=0; i<hyphenE.length; i++){
			proto += ' -e '+hyphenE[i];
		}
		return proto;
	};

	var plastic = function plastic(stdout) {
		stdout = stdout.split('\n');
		stdout = stdout.splice(0, stdout.length-1);
		return stdout;
	}

	var exec = require('child_process').exec
	    , child
	    , grepList = ['"^\.$"','"^\.\.$"', '.git', 'setup.js'];

	child = exec(shell(grepList),function(err, stdout, stderr){
		if(!err){
			stdout = plastic(stdout);
			return stdout;
		}else{
			console.log('exec error: ' + err);
		}
	});
})();

console.log("dotfiles:"+dotfiles);
