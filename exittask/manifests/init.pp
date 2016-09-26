# This class run 'master' or 'node' classes
# Check VM by variable 'is_puppetserver'
class exittask {
  notice( "The factor 'is_puppetserver' is ${::is_puppetserver}" )
  if $::is_puppetserver == 'true' {
    include exittask::master
  }
  else {
    include exittask::node
  }
}
