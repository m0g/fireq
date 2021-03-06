### Client part
{{>add-node.sh}}

cd {{repo_client}}
npm i grunt-cli
npm i bower
time npm install
time bower --allow-root install

time \
SUPERDESK_URL='<SUPERDESK_URL>' \
SUPERDESK_WS_URL='<SUPERDESK_WS_URL>' \
SUPERDESK_RAVEN_DSN='<RAVEN_DSN>' \
IFRAMELY_KEY='<IFRAMELY_KEY>' \
EMBEDLY_KEY='<EMBEDLY_KEY>' \
SYNDICATION='<SYNDICATION>' \
grunt build --force
