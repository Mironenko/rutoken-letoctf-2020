#!/bin/bash -x

cat > /etc/apt/apt.conf.d/99defaultrelease <<EOF
APT::Default-Release "stable";
EOF
if [ $? -ne 0 ]; then
    exit 1
fi

cp *.list /etc/apt/sources.list.d/ || exit 1
apt-get update || exit 1

apt-get --download-only -y install pcscd pcsc-tools || exit 1
apt-get --download-only -y -t testing install opensc libpam-p11 || exit 1

# nginx
apt-get -y install  nginx

cp ../tls/nginx/01-http/test.local.nginx.conf /etc/nginx/sites-available/
ln -sf /etc/nginx/sites-available/test.local.nginx.conf /etc/nginx/sites-enabled/test.local.nginx.conf

# TODO: setuo GUI for sudo