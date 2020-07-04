#!/bin/sh -l

# Construct the exclude commands
for excludedPath in "${INPUT_EXCLUDE[@]}"
do
  EXCLUDE="$EXCLUDE --exclude $excludedPath"
done

lftp $INPUT_FTP_HOST -u $INPUT_FTP_USERNAME,$INPUT_FTP_PASSWORD -e "$([ "$INPUT_DISABLE_SSL_CERTIFICATE_VERIFICATION" == true ] && echo "set ssl:verify-certificate false;") mirror --verbose --reverse $([ "$INPUT_DELETE" == true ] && echo "--delete") $EXCLUDE $INPUT_LOCAL_SOURCE_DIR $INPUT_DIST_TARGET_DIR; exit"