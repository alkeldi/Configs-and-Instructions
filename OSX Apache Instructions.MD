Start server:
1. `sudo apachectl start`
2. Visit: `http://127.0.0.1/`

Change Root Directory:
1. Replace `DocumentRoot "/Library/WebServer/Documents"` with your `DocumentRoot "your_root_path"`
2. Replace `<Directory "/Library/WebServer/Documents">` with your `<Directory "your_root_path">`

Enable PHP:
1. `sudo vim /etc/apache2/httpd.conf`
2. Uncomment: `LoadModule php7_module libexec/apache2/libphp7.so`

Restart server:
`sudo apachectl restart`

Stop server:
`sudo apachectl stop`
