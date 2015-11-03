#!/bin/bash 
# This script installs puppet and then configures the required yumgroup type for installing yumgroups

# Install the correct RHEL version of puppet
if [ `grep '5\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-5.noarch.rpm;
    yum install puppet -y;

    echo "Adding yumgroup puppet type"
    # copy the provider and type into place
    mkdir /usr/lib/ruby/site_ruby/1.8/puppet/provider/yumgroup
    # Need the absolute path here because it isn't executed from this directory
    cp /root/plugins/puppet/custom-type/yumgroup/default.rb /usr/lib/ruby/site_ruby/1.8/puppet/provider/yumgroup/
    cp /root/plugins/puppet/custom-type/yumgroup.rb /usr/lib/ruby/site_ruby/1.8/puppet/type/
fi

if [ `grep '6\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm;
    yum install puppet -y;

    echo "Adding yumgroup puppet type"
    # copy the provider and type into place
    mkdir /usr/lib/ruby/site_ruby/1.8/puppet/provider/yumgroup
    # Need the absolute path here because it isn't executed from this directory
    cp /root/plugins/puppet/custom-type/yumgroup/default.rb /usr/lib/ruby/site_ruby/1.8/puppet/provider/yumgroup/
    cp /root/plugins/puppet/custom-type/yumgroup.rb /usr/lib/ruby/site_ruby/1.8/puppet/type/
fi

if [ `grep '7\.' /etc/redhat-release | wc -l` -eq 1 ]; then
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm;
    yum install puppet -y;

    echo "Adding yumgroup puppet type"
    # copy the provider and type into place
    mkdir /usr/share/ruby/vendor_ruby/puppet/provider/yumgroup
    # Need the absolute path here because it isn't executed from this directory
    cp /root/plugins/puppet/custom-type/yumgroup/default.rb /usr/share/ruby/vendor_ruby/puppet/provider/yumgroup/
    cp /root/plugins/puppet/custom-type/yumgroup.rb /usr/share/ruby/vendor_ruby/puppet/type/
fi

# Included in the plugin are two manifests
# Uncomment the line below to install the RPM version of the EWS/EAP product

# EWS Manifest
# puppet apply plugins/puppet/manifests/ews2.pp

# EAP Manifest
# puppet apply plugins/puppet/manifests/eap6.pp
