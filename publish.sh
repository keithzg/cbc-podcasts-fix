#!/bin/bash

# Variables, yay!
OUTPUTDIR=/var/www/cbc
LISTFILE=`pwd`/final.list
TEMPDIR=/tmp/cbc
# If this isn't being run on a webserver, you might want to just rsync it there afterwards.
# In that case, uncomment the following line, and the final one.
#RSYNCPATH="mywebsite.ca:/home/myuser/public_html/cbc/"

# Gonna nuke the contents of the temp directory, so I hope it wasn't something important!
rm -rf $TEMPDIR/
mkdir -p $TEMPDIR
mkdir -p $OUTPUTDIR

# Now we grab all the XML files from the list defined in final.list
pushd $TEMPDIR
cat $LISTFILE | \
while read LINE; do
        wget $LINE
done
popd

# Process the ones in our temp directory and output them elsewhere.
for FEED in $TEMPDIR/*.xml; do
        tidy -xml -output ${OUTPUTDIR}/`basename $FEED` $FEED;
done

# As aforementioned, uncomment this if you're rsyncing the fixed feed files to a server
# or whatnot.
#rsync -a --delete-after $OUTPUTDIR/ $RSYNCPATH
