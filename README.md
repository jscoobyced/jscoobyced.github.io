# JScoobyCed .deb packages repository

## How to add this repository

Removing old version:
```
sudo rm /etc/apt/sources.list.d/jscoobyced-dev.list
sudo rm /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg
```

Adding the new one:
```
wget -qO - https://jscoobyced.github.io/KEY.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg add -
echo "deb https://jscoobyced.github.io/ ./" | sudo tee /etc/apt/sources.list.d/jscoobyced-dev.list
sudo apt update
```

If you get an error like
```
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY XXXXXXXXXXX
```
you can resolve by doing this:
```
gpg --export --armor XXXXXXXXXXX | sudo apt-key add -
```

The reason is I didn't publish a signing server, so you need to tell your keystore to trust my key.

## List of packages

No package available yet. Coming very soon.