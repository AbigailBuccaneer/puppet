include '::stdlib'
include '::ntp'
include '::logrotate'

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

package { 'vim': ensure => 'latest' }
$vimrc =
'source /usr/local/share/vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect("/usr/local/share/vim/bundle/{}")
syntax on
filetype plugin indent on'
file { '/etc/vim/vimrc.local': content => $vimrc }

package { 'git': ensure => 'latest' }

file { '/usr/local/share/vim': ensure => 'directory' }
file { '/usr/local/share/vim/bundle': ensure => 'directory' }

vcsrepo { '/usr/local/share/vim/bundle/vim-pathogen':
    ensure => 'latest',
    provider => 'git',
    source => 'https://github.com/tpope/vim-pathogen.git',
}

vcsrepo { '/usr/local/share/vim/bundle/sensible.vim':
    ensure => 'latest',
    provider => 'git',
    source => 'https://github.com/tpope/vim-sensible.git',
}

vcsrepo { '/usr/local/share/vim/bundle/vim-puppet':
    ensure => 'latest',
    provider => 'git',
    source => 'https://github.com/rodjek/vim-puppet.git',
}
