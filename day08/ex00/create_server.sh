sudo apt-get install -y git-core
sudo apt-get install -y curl
sudo apt-get install -y vim
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
. /home/vagrant/.rvm/scripts/rvm
yes 3 | gem uninstall rails railties
gem install rails -v 4.2.7
gem install puma
sudo apt-get install -y postgresql
sudo apt-get install -y libpq-dev
sudo apt-get install -y nodejs

mkdir /home/vagrant/site
cd /home/vagrant/site
rails new foubarre -d postgresql
cd foubarre
rails g scaffold component great_data
echo "Component.create(great_data: 'foo_bar_name')" >> db/seeds.rb
bundle install
sed -i -e "s/username: foubarre/username: vagrant/g" config/database.yml

sudo su - postgres -c "psql -c \"create role vagrant with createdb login password 'vagrant';\""

RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
sed -i "2iroot to: 'components#index'" config/routes.rb
echo "<h1><%=Rails.env%></h1>">app/views/components/index.html.erb

sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/hosts
RAILS_ENV=production rake assets:precompile
SECRET_KEY_BASE=$(RAILS_ENV=production rake secret) puma -e production -b 'tcp://0.0.0.0:3000' config.ru
