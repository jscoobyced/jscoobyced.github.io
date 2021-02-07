#!/bin/bash

source ./.env
export GNUPGHOME="${PWD}/${GPGHOME}"

init_gpg() {
  echo "Initializing GPG in ${1}."
  if [ ! -d ${1} ]; then
    mkdir ${1}
  fi

  rm -f ${1}/gpg.conf ${1}/key-config repo/KEY.gpg

  echo "cert-digest-algo SHA256" > ${1}/gpg.conf
  echo "digest-algo SHA256" >> ${1}/gpg.conf
  chmod 700 ${1}
  chmod 644 ${1}/gpg.conf
}

get_data() {
	local prompt="$1"
	local invalue

	printf 'Enter value for %s: ' "$prompt" >&2
	read -r invalue

	test -n "$invalue" || return 1
	printf '%s' "$invalue"
}

GPGNameReal=$(get_data 'fullname')
GPGNameComment=$(get_data 'comment')
GPGNameEmail=$(get_data 'email')
GPGPassphrase=$(get_data 'phassphrase')

init_gpg "${GNUPGHOME}"

GPGCFG="${GNUPGHOME}/key-config"

cat > "${GPGCFG}" <<-EOF
    %echo Generating an OpenPGP key
    Key-Type: RSA
    Key-Length: 4096
    Subkey-Type: RSA
    Subkey-Length: 4096
    Name-Real: $GPGNameReal
    Name-Comment: $GPGNameComment
    Name-Email: $GPGNameEmail
    Passphrase: $GPGPassphrase
    Expire-Date: 0
    %commit
    %echo Keys have been created.
EOF

gpg --batch --no-tty --gen-key "${GPGCFG}"

gpg --no-default-keyring --list-secret-keys
GPGKEYID=$(gpg --no-tty --list-secret-keys --with-colons 2>/dev/null | awk -F: '/^sec:/ { print $5 }')

echo "Exporting key."
mkdir -p repo/amd64
gpg --output repo/KEY.gpg --armor --export ${GPGKEYID}