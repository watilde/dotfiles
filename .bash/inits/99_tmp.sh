#!/bin/bash

# V8
alias x64-build="ninja -C out.gn/x64.release"
alias x64-test="out/x64.release/d8 test/webkit/resources/standalone-pre.js test/webkit/fast/js/JSON-parse-reviver.js"
alias x64-test-all="tools/run-tests.py --arch=x64"
