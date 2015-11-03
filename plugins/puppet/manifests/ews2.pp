class ews2 {
    yumgroup { 'jboss-ews2': 
        ensure => present,
    }
    package { 'httpd':
        ensure => installed,
    }
    file { 'httpd.conf':
        path => '/etc/httpd/conf/httpd.conf',
        ensure => file,
        require => Package['httpd'],
        # source => '/root/httpd.conf'
    }
    service { 'httpd':
        ensure => running,
        enable => true,
        subscribe => File['httpd.conf'],
    }
}

include ews2
