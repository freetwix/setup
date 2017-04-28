# support for awsenv
#
# $> brew tap Luzifer/tools
# $> brew install awsenv
#

function set_aws {
  eval $(awsenv shell $1)
}

function login_aws {
  open $(awsenv console $1)
}