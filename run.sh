#!/bin/bash
 
if [ ! $elasticsearch_host ] ; then
    elasticsearch_host=http://localhost:9200
fi
 
cat << EOF > /etc/nginx/sites-enabled/kibana.conf
    server {
        listen       0.0.0.0:9200;
        location / {
            proxy_pass  ${elasticsearch_host};
            proxy_read_timeout 60s;
            proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
            proxy_redirect default;
            proxy_buffering off;
        }
    }
EOF
