class eap6 {
    yumgroup { 'jboss-eap6': 
        ensure => present,
    }
    package { 'jbossas-standalone':
        ensure => installed,
    }
    file { 'jbossas.conf':
        path => '/etc/jbossas/jbossas.conf',
        ensure => file,
        require => Package['jbossas-standalone'],
        # source => '/root/jbossas.conf'
    }
    service { 'jbossas':
        name => 'jbossas',
        ensure => running,
        enable => true,
        subscribe => File['jbossas.conf'],
    }
}

include eap6
