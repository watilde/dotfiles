#!/bin/bash

# V8
alias v8-build="ninja -C out.gn/x64.release"
alias v8-test="out.gn/x64.release/d8 test/webkit/resources/standalone-pre.js test/webkit/fast/js/JSON-parse-reviver.js"
alias v8-test-all="tools/run-tests.py --arch-and-mode=x64.release"
alias v8-issues="open https://bugs.chromium.org/p/v8/issues/list"
