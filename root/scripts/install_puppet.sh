#!/bin/sh

# Install ruby and require for beaker
apt-get update
apt-get install --no-install-recommends -y rubygems make ruby-dev libxml2 libxml2-dev libxslt1-dev g++ zlib1g-dev

# Install puppet
gem install puppet -v=${PUPPET_VERSION}

# Install ruby lib
gem install rspec && gem install rspec-puppet && gem install rspec-puppet-facts
gem install puppetlabs_spec_helper
gem install puppet-lint

# Install puppet modules
puppet module install puppetlabs/stdlib
puppet module install garethr/docker


# Install beaker
gem install nokogiri -- --use-system-libraries=true --with-xml2-include=/usr/include/libxml2
gem install beaker-rspec -v 6.2.3
gem install beaker -v 4.0.0

# Clean install
apt-get clean
rm -rf /var/lib/apt/lists/*