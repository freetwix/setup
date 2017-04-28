# resolve any readline problems, check:
#
#   irb> ü
#
# see: https://gist.github.com/jasoncodes/1223731

# prevent problems with old certificates
# * curl-ca-bundle installed via brew
#
# optional done: linked openssl (keg-only) into system / maybe problems with macosx!
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

CONFIGURE_OPTS="--disable-install-doc \
  --with-readline-dir=$(brew --prefix readline) \
  --with-openssl-dir=$(brew --prefix openssl)"

export CONFIGURE_OPTS