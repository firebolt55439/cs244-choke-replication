#!/bin/bash

set -e

for file in ./indep-utils/dosdbell/Makefile ./indep-utils/model-gen/Makefile ./indep-utils/webtrace-conv/nlanr/Makefile ./indep-utils/webtrace-conv/epa/Makefile ./indep-utils/webtrace-conv/dec/Makefile ./Makefile ./indep-utils/webtrace-conv/ucb/Makefile ./indep-utils/webtrace-conv/Makefile ./doc/Makefile ./doc/kfall/Makefile ./indep-utils/cmu-scen-gen/setdest/Makefile ./emulate/support/src/nrgarp/Makefile; do
    echo "Updating $file"

    # Update -lm  with -lm -framework Cocoa using sed in the Makefile
    sed -i '' 's/ -lm / -lm -framework Cocoa /g' $file

    # Add CHOKe to compiled entities
    sed -i '' 's/queue\/red.o/queue\/red.o queue\/choke.o/g' $file

    # Update "VERSION" with "VERSION2" case-sensitively with sed
    sed -i '' 's/VERSION/VERSION2/g' $file
done
