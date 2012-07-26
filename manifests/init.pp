# = Class: proftpd
#
# This is the main proftpd class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, proftpd class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $proftpd_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, proftpd main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $proftpd_source
#
# [*source_dir*]
#   If defined, the whole proftpd configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $proftpd_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $proftpd_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, proftpd main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $proftpd_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $proftpd_options
#
# [*service_autorestart*]
#   Automatically restarts the proftpd service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $proftpd_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $proftpd_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $proftpd_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $proftpd_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for proftpd checks
#   Can be defined also by the (top scope) variables $proftpd_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $proftpd_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $proftpd_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $proftpd_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $proftpd_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for proftpd port(s)
#   Can be defined also by the (top scope) variables $proftpd_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling proftpd. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $proftpd_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $proftpd_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $proftpd_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $proftpd_audit_only
#   and $audit_only
#
# Default class params - As defined in proftpd::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of proftpd package
#
# [*service*]
#   The name of proftpd service
#
# [*service_status*]
#   If the proftpd service init script supports status argument
#
# [*process*]
#   The name of proftpd process
#
# [*process_args*]
#   The name of proftpd arguments. Used by puppi and monitor.
#   Used only in case the proftpd process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user proftpd runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $proftpd_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $proftpd_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include proftpd"
# - Call proftpd as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class proftpd (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits proftpd::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $proftpd::bool_absent ? {
    true  => 'absent',
    false => $proftpd::version,
  }

  $manage_service_enable = $proftpd::bool_disableboot ? {
    true    => false,
    default => $proftpd::bool_disable ? {
      true    => false,
      default => $proftpd::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $proftpd::bool_disable ? {
    true    => 'stopped',
    default =>  $proftpd::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $proftpd::bool_service_autorestart ? {
    true    => Service[proftpd],
    false   => undef,
  }

  $manage_file = $proftpd::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $proftpd::bool_absent == true
  or $proftpd::bool_disable == true
  or $proftpd::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $proftpd::bool_absent == true
  or $proftpd::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $proftpd::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $proftpd::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $proftpd::source ? {
    ''        => undef,
    default   => $proftpd::source,
  }

  $manage_file_content = $proftpd::template ? {
    ''        => undef,
    default   => template($proftpd::template),
  }

  ### Managed resources
  package { 'proftpd':
    ensure => $proftpd::manage_package,
    name   => $proftpd::package,
  }

  service { 'proftpd':
    ensure     => $proftpd::manage_service_ensure,
    name       => $proftpd::service,
    enable     => $proftpd::manage_service_enable,
    hasstatus  => $proftpd::service_status,
    pattern    => $proftpd::process,
    require    => Package['proftpd'],
  }

  file { 'proftpd.conf':
    ensure  => $proftpd::manage_file,
    path    => $proftpd::config_file,
    mode    => $proftpd::config_file_mode,
    owner   => $proftpd::config_file_owner,
    group   => $proftpd::config_file_group,
    require => Package['proftpd'],
    notify  => $proftpd::manage_service_autorestart,
    source  => $proftpd::manage_file_source,
    content => $proftpd::manage_file_content,
    replace => $proftpd::manage_file_replace,
    audit   => $proftpd::manage_audit,
  }

  # The whole proftpd configuration directory can be recursively overriden
  if $proftpd::source_dir {
    file { 'proftpd.dir':
      ensure  => directory,
      path    => $proftpd::config_dir,
      require => Package['proftpd'],
      notify  => $proftpd::manage_service_autorestart,
      source  => $proftpd::source_dir,
      recurse => true,
      purge   => $proftpd::source_dir_purge,
      replace => $proftpd::manage_file_replace,
      audit   => $proftpd::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $proftpd::my_class {
    include $proftpd::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $proftpd::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'proftpd':
      ensure    => $proftpd::manage_file,
      variables => $classvars,
      helper    => $proftpd::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $proftpd::bool_monitor == true {
    monitor::port { "proftpd_${proftpd::protocol}_${proftpd::port}":
      protocol => $proftpd::protocol,
      port     => $proftpd::port,
      target   => $proftpd::monitor_target,
      tool     => $proftpd::monitor_tool,
      enable   => $proftpd::manage_monitor,
    }
    monitor::process { 'proftpd_process':
      process  => $proftpd::process,
      service  => $proftpd::service,
      pidfile  => $proftpd::pid_file,
      user     => $proftpd::process_user,
      argument => $proftpd::process_args,
      tool     => $proftpd::monitor_tool,
      enable   => $proftpd::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $proftpd::bool_firewall == true {
    firewall { "proftpd_${proftpd::protocol}_${proftpd::port}":
      source      => $proftpd::firewall_src,
      destination => $proftpd::firewall_dst,
      protocol    => $proftpd::protocol,
      port        => $proftpd::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $proftpd::firewall_tool,
      enable      => $proftpd::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $proftpd::bool_debug == true {
    file { 'debug_proftpd':
      ensure  => $proftpd::manage_file,
      path    => "${settings::vardir}/debug-proftpd",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
