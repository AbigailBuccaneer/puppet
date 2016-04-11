#!/usr/bin/env ruby
#^syntax detection

user { 'abigail':
    ensure => 'present',
    managehome => true,
    groups => ['sudo'],
}

