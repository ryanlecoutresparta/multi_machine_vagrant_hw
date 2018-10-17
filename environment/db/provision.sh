sudo apt-get update
sudo apt-get upgrade -y
# Install things that MongoDB needs:
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Make sure that the apt has the info it needs to install the custom version of MongoDB
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18


sudo rm /etc/mongod.conf
sudo ln -s /home/vagrant/db/environment/db/mongod.conf /etc/mongod.conf

sudo systemctl restart mongod
sudo systemctl enable mongod
