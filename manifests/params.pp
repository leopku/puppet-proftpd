# Class: proftpd::params
#
# This class defines default parameters used by the main module class proftpd
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to proftpd class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class proftpd::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'proftpd',
  }

  $service = $::operatingsystem ? {
    default => 'proftpd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'proftpd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'ftp',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/proftpd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0640',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/proftpd',
    default                   => '/etc/sysconfig/proftpd',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/proftpd.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/proftpd',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/proftpd',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/proftpd/proftpd.log',
  }

  $port = '21'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = 'false'
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
