#!/usr/bin/env bash
function usage {
  message="$(cat <<EOF
./init [OPTIONS] PROJECT_NAME

OPTIONS:
  -ng, --no-git
      Will not initialise a new git project.
  
PROJECT_NAME must validate the regex "^[a-z][0-9a-z-]*$".
EOF
)"
  echo "${message}" >&2
  exit 1
}

function setProjectName {
  if ! [[ ${1} =~ ^[a-z][0-9a-z-]*$ ]]; then
    usage
  fi
  projectName=$1
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -h|--help) usage;;
    -ng|--no-git) noGit="true"; shift 1;;

    -*) echo "unknown option: $1" >&2; usage;;
    *) setProjectName "$1"; shift 1;;
  esac
done

if [[ -z ${projectName} ]]; then
  usage
fi

sed -i s/starter/${projectName}/g pom.xml
rm -rf .git init.sh
if [[ ${noGit} = "true" ]]; then
  rm -f .gitignore
else
  git init -q
  echo "You can now run these commands if you want:"
  echo "> git remote add origin <LINK>"
  echo "> git push -u origin master"
fi
