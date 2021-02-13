#!/bin/bash
source ./.env
export GNUPGHOME="${PWD}/${GPGHOME}"

check_package() {
  echo "Checking if ${1} is installed"
  CHKPKG=$(dpkg --list | grep ${1} | grep "ii" | wc -l)
  if [ "0" == "${CHKPKG}" ]; then
    sudo apt install -y ${1}
  else
    echo "${1} is installed."
  fi
}

cd repo
GPGKEYID=$(gpg --no-tty --list-secret-keys --with-colons 2>/dev/null | awk -F: '/^sec:/ { print $5 }')

echo "Cleaning up meta-data."
rm -f Packages Packages.gz Release Release.gpg InRelease ../index.html

echo "Checking dependencies:"
check_package dpkg-dev
check_package dpkg-sig

cat ../index.html.tpl > ../index.html

HAVEPKG=$(ls -l amd64/ | grep -v "total ")
HAVEPKG=${HAVEPKG}$(ls -l ../base/ | grep ".deb")

if [ "" != "${HAVEPKG}" ]; then
  echo "Signing packages."
  dpkg-sig -k ${GPGKEYID} --sign builder ../base/*.deb
  mv ../base/*.deb ./amd64/

  echo "Creating new meta-data."
  apt-ftparchive packages amd64 > Packages
  gzip -k -f Packages
  apt-ftparchive release . > Release
  gpg --default-key ${GPGKEYID} -abs -o Release.gpg Release
  gpg --default-key ${GPGKEYID} --clearsign -o InRelease Release

  PACKAGES=$(cd ..;find . -name "*.deb" | xargs ls -ctgGh | awk '{if(NF==7) print "<tr><td><a href=\""$7"\">"$7"</td><td>"$3"</td><td>"$4 $5"\t"$6"</td></tr>\r\n"}')
  echo $PACKAGES >> ../index.html
fi

echo \</table\>\</body\>\</html\> >> ../index.html