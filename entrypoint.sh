#!/bin/sh -l

lftp $INPUT_FTP_HOST -u $INPUT_FTP_USERNAME,$INPUT_FTP_PASSWORD -e "$([ "$INPUT_DISABLE_SSL_CERTIFICATE_VERIFICATION" == true ] && echo "set ssl:verify-certificate false;") mirror --verbose --reverse $([ "$INPUT_DELETE" == true ] && echo "--delete") $INPUT_LOCAL_SOURCE_DIR $INPUT_DIST_TARGET_DIR; exit"