server {
    listen 80;
    server_name tweb.aiminders.com;
    access_log /var/log/nginx/access.log combined;
    location / {
      proxy_set_header   X-Real-IP $remote_addr;
      proxy_set_header   Host      $http_host;
      proxy_pass         http://101.132.167.104:5003;
    }
}
