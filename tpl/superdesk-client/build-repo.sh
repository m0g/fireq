{{>superdesk-server/build-repo.sh}}

chunks=/var/tmp/e2e-chunks.py
cat <<"EOF" > $chunks
{{>e2e-chunks.py}}
EOF
python3 $chunks
unset chunks
