#!/bin/bash
>test.csc
(/Applications/CovScript.app/Contents/MacOS/covscript/bin/cs enum.csc) >> test.csc
# (cat binary.csc) >> test.csc
# (cat logi.csc) >> test.csc
(cat main.csc) >> test.csc
(/Applications/CovScript.app/Contents/MacOS/covscript/bin/cs test.csc)
>test.csc
rm test.csc