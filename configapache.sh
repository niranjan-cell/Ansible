sudo apt-get update
sudo apt install apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc unzip -y
cd /var/www/html/
sudo rm -f index.html
sudo a2enmod rewrite
cd html
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo mv wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod g+s {} \;
sudo chmod g+w /var/www/html/wp-content
sudo chmod -R g+w /var/www/html/wp-content/themes
sudo chmod -R g+w /var/www/html/wp-content/plugins
cd /etc/apache2/sites-available/
sudo cp 000-default.conf domain.com.conf
sudo vim domain.com.conf

'''''
ServerName domain.com
ServerAlias www.domain.com
ServerAdmin webmaster@localhost
DocumentRoot /var/www/html

''''''
''''
sudo a2ensite domain.com.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
''''