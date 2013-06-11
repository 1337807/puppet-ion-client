# This is a placeholder class.
class ion-client{
  include ruby
  exec { 'add-source' :
    command => "curl -s https://gemgate-heroku-internal-gems.herokuapp.com/setup-instructions > /tmp/gem.sh; bash /tmp/gem.sh"
 }
  file { "${boxen::config::envdir}/ion-client.sh":
    source => 'puppet:///modules/ion-client/ion-client.sh' ;
  }

  ruby::gem { 'ion-client' :
    gem => 'ion-client',
    ruby => $version,
    require => Exec['add-source']
  }
}
