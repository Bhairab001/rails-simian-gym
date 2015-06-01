A simple application made to exercise the simian army and showcase some integration practices with Jenkins.

a
Configuration and environment (for Ubuntu 14.04. Others similar)

TODO: further automate the following:
# rvm installation

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo \curl -sSL https://get.rvm.io | bash -s stable --rails
bash --login
rvm install ruby-2.2.2
rvm use 2.2.2
sudo apt-get install -y git
git clone https://github.com/fabioarciniegas/rails-simian-gym.git
gem install rails --version=4.2.1

# Installing passenger
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get install apt-transport-https ca-certificates

#in /etc/apt/sources.list.d/passenger.list
deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main

sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update

sudo apt-get install libapache2-mod-passenger

#sudo a2enmod passenger
#sudo apache2ctl stop; sudo apache2ctl start

# apache virtual host configuration
# get path to correct ruby by passenger-path


	DocumentRoot /home/ubuntu/rails-simian-gym/public
	RailsEnv development
	PassengerRuby /home/ubuntu/.rvm/gems/ruby-2.2.2/wrappers/ruby

	<Directory "/home/ubuntu/rails-simian-gym/public/">
	    Options Indexes FollowSymlinks
            Require all granted
	</Directory>




