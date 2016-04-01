# depot_tool
set -x PATH=$PATH:/Users/watilde/Development/depot_tools

# server
alias server='python -m SimpleHTTPServer'

# V8
alias x64="out/x64.release/d8 test/webkit/resources/standalone-pre.js test/webkit/fast/js/JSON-parse-reviver.js test/webkit/resources/standalone-post.js"
alias ia32="out/ia32.release/d8 test/webkit/resources/standalone-pre.js test/webkit/fast/js/JSON-parse-reviver.js test/webkit/resources/standalone-post.js"
alias run-tests="tools/run-tests.py --arch=x64"

# Added by travis gem
# [ -f /Users/watilde/.travis/travis.sh ] && source /Users/watilde/.travis/travis.sh

# Added by the Heroku Toolbelt
set -x PATH="/usr/local/heroku/bin $PATH"
