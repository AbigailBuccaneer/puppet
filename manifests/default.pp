#!/usr/bin/env ruby
#^syntax detection

include '::stdlib'
include '::ntp'

user { 'abigail':
    ensure => 'present',
    managehome => true,
    groups => ['sudo'],
}

file_line { 'sudo_group_rule':
    path => '/etc/sudoers',
    match => '%sudo',
    line => '%sudo ALL=(ALL:ALL) ALL',
}
