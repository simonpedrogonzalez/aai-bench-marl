#!/bin/bash

# ====== CONFIGURE THIS ======
REMOTE_USER="u1528314"
REMOTE_HOST="notchpeak2.chpc.utah.edu"
REMOTE_BASE="/uufs/chpc.utah.edu/common/home/u1528314/aai-bench-marl/outputs"
REMOTE_FOLDER="qmix_balance_mlp__7c7f22ca_25_04_23-14_46_37"
ZIP_NAME="qmix_balance_mlp__7c7f22ca_25_04_23-14_46_37.zip"
# ============================

# SSH + zip on remote
ssh ${REMOTE_USER}@${REMOTE_HOST} << EOF
cd ${REMOTE_BASE}
zip -r ${ZIP_NAME} ${REMOTE_FOLDER}
EOF

# SCP download to current local folder
scp ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_BASE}/${ZIP_NAME} ./outputs/

# Unzip the downloaded file
unzip ./outputs/${ZIP_NAME} -d ./outputs/
# Remove the zip file
rm ./outputs/${ZIP_NAME}
