if which puppet > /dev/null 2>&1; then
	echo 'Keep Calm, Puppet already installed!'
else
	echo "Oh GOD! I'm installing Puppet for you kid..."
	sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
  sudo yum -y install puppet
fi
