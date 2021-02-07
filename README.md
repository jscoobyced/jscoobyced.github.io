# JScoobyCed .deb packages repository

This repository includes all the custom `.deb` debian packages I often use. If
 you want to create your own Debian repository you can copy this repo and
 follow these 5 steps:
- delete the `repo` directory (it will be automatically re-created later)
- open a terminal and type:
```
chmod u+x ./scripts/*.sh
./scripts/init-gpg.sh
```
This will intialize your GPG keys. You should see the new `repo` directory,
 a `KEY.gpg` file and an `amd64` directory in it.
- Copy your `.deb` packages in the `base` directory
- In the terminal, type
```
./scripts/update-packages.sh
```
This will sign your packages and create all necessary Debian files.
- Publish the `repo` folder on a web-server available from the machines you
 want to use these packages.