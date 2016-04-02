if which foreman-installer > /dev/null 2>&1; then
	echo 'Keep Calm, TheForeman already installed!'
else
	# Install theforeman
	echo "Oh GOD! I'm installing TheForeman for you kid..."
	sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
	sudo yum -y install epel-release http://yum.theforeman.org/releases/1.11/el7/x86_64/foreman-release.rpm
	sudo yum -y upgrade puppet
	yum clean all
	sudo yum -y install foreman-installer
	sudo foreman-installer
fi
