# Starter

This project is just a quick start template for my Java maven projects.

The idea here is to get a clean folder with a new git project (not pointing to this project) and an empty Java project with Maven and unit tests libraries.

You also have the option to just remove the git support if don't want to version this project.

# How to use it

## Solution 1
`git clone https://github.com/MaBeuLux88/starter <NEW-PROJECT>`

Then run the `init.sh` script to
- rename the maven project
- destroy OR regenerate the .git folder (see options with `./init.sh -h`)

## Solution 2
Use directly the zip from github:

```sh
wget --quiet https://github.com/MaBeuLux88/starter/archive/master.zip && \
unzip -qq master.zip && mv starter-master <NEW-PROJECT> && rm -rf master.zip && \
cd <NEW-PROJECT> && ./init.sh -ng <NEW-PROJECT>
```

## Solution 3
Same as solution 2 but industrialised.

Add the following function in your bash_aliases:

```bash
function starter {
  wget --quiet https://github.com/MaBeuLux88/starter/archive/master.zip
  unzip -qq master.zip
  for project in "$@"
  do
    cp -r starter-master ${project}
    cd ${project}
    ./init.sh -ng ${project}
    cd ..
  done
  rm -rf master.zip starter-master
}
```

Usage : `starter project-a project-b project-c`