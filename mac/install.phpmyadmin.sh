#!/bin/bash

echo "Assuming you got git & you already got a mysql server...";

git clone git@github.com:phpmyadmin/phpmyadmin.git ~/.phpmyadmin

echo "alias phpmyadmin='cd ~/phpMyAdmin; php -S localhost:6060'" >> ~/.zshrc
