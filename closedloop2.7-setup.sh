#!/usr/bin/env bash

python_version=python2.7
venv_name=venv

echo "Is 'venv' the folder name of the virtual environment?(Y/n)"
read answer
if [[ "${answer}" == n ]] ; then
  echo "Please enter the folder name of the virtual environment:"
  read venv_name
  while [[ ! -d "./${venv_name}" ]] ; do
    echo "Folder does exist."
    echo "Please enter the folder name of the virtual environment:"
    read venv_name 
  done
fi

pip install setuptools==44.1.1
pip install numpy watchdog nodeenv openaps openaps-contrib matplotlib

apt-get download python-dev python-software-properties

dpkg -x ./python-dev* ./dev
dpkg -x ./python-software-properties* ./software-properties

mv ./dev ./${venv_name}/lib/${python_version}/site-packages
mv ./software-properties ./${venv_name}/lib/${python_version}/site-packages 

rm ./python-dev*
rm ./python-software-properties*

nodeenv -p --node=12.22.1
npm init -g
npm install -g json oref0

cp -f ./basal-set-temp.js ./${venv_name}/lib/node_modules/oref0/lib/
cp -f ./determine-basal.js ./${venv_name}/lib/node_modules/oref0/lib/determine-basal/
cp -f ./oref0-determine-basal.js ./${venv_name}/lib/node_modules/oref0/bin/

cd ./openaps2.7
git init

echo "Auto-installation finished!"








