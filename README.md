# FilmTracker Demo

#Feature list:  

* Administrator Login
* Admin can create/edit/delete Person 
* Admin can create multiple types of person
* Admin can assign role to a new person such as Artist, Admin, Actors etc. 
* Admin can create/edit/delete roles
* Admin can create/edit/delete Films/Movies
* Admin can associate Many movies to one person. 
* Admin can update movie watchlist.
* All admin actions are logged.

**Tools & Technologies:** PHP7, Composer, AWS,  MySQL, Laravel, mailtrap, laravel quickadmin, ubuntu


#Install Instructions
Requirements
OS: Ubunut
 

**Step 1:  Install composer**
`curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer`

**Step 2:  Install git** 
`sudo apt-get install git`

**Step 3: Install PHP7 with required modules** 
`sudo apt-get install -y language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install  php7.0 php7.0-mysql php7.0-cli php7.0-gd php7.0-json php7.0-fpm`

**Step 4: Setup MySQL Database server**
`sudo apt-get install mysql-server
sudo mysql_secure_installation
sudo mysql_install_db`

*Note: You'll be prompted to create a root password during the installation. Choose a secure one and make sure you remember it, because you'll need it later.*

**Steo 5: Configure Apache Server**
`sudo a2enmod rewrite`

Edit conf file
`vi /etc/apache2/sites-available/000-default.conf`
Update the Document root
DocumentRoot /var/www/html/laravel/public
`<Directory "/var/www/html/laravel/public/">
  AllowOverride All
</Directory>
sudo server apache2 restart'

**Step 6: Get the source from github**
`git clone git@github.com:shamim7777/laravel.git
cd laravel`

**Step 7: Create database**
`mysql -u root -p 
->create database filmtracker;
->use filmtracker;
->source database.sql;
->exit;`

**Step 8: Update .env file with the database information**
`DB_CONNECTION=mysql
DB_HOST=127.0.0.1 
DB_PORT=3306
DB_DATABASE=demoadmin
DB_USERNAME=root
DB_PASSWORD=yourpassword`

**Step 9: Update Mailtrap info**
`MAIL_DRIVER="smtp"
MAIL_HOST="mailtrap.io"
MAIL_PORT=2525
MAIL_USERNAME=379214cf12b110
MAIL_PASSWORD=333446a25d6fd0
MAIL_ENCRYPTION=null`

**Step 10: Set file permissions for storage and cache** 
`chmod -R 755 vendor storage`

**Step 11: Initialize application**
`composer update
php artisan optimize
php artisan clear-compiled
php artisan cache:clear`

Voilà!!! Check it out here http://www.yourdomain.com/

This install instruction is pretty elaborated. Its important how each components works in different tier. That's is why I wrote this long setup guide. But this process is lot easier when we Laravel Homestead in Vagrant Box. 

Thank You
@shamim7777



