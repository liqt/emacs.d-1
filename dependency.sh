#!/usr/bin/env bash
#Description:
#resolve the dependency for emacs(to make it become a delightful os)
set -e
set -x

# check if pip exists
type pip>/dev/null 2>&1 || {
    echo >&2 " require pip but it's not installed.  Aborting.";
    exit 1;
}
# check if npm exists 
type npm>/dev/null 2>&1 || {
    echo >&2 " require yarn but it's not installed.  Aborting.";
    exit 1;
}
#run as root
echo "start to install emacs  dependecy"
#emacs javascript-edit mode (ie js2-mode depedency):
#install "tern" to use the auto-completion and documentation features
echo "Start to install tern"
npm i tern -g
#to use the formatting features,install js-beautify
echo "Start to install js-beautify"
npm i js-beautify -g
#syntax checker Program;which Flycheck dependens on
#  install Pylint for Python
echo "start to install Python syntax checker"
pip3 install pylint --user
# install Eslint for Javascript
echo "start to install Javascript synatx checker"
sudo yarn global add eslint 
#install required Python packages for Elpy
#if [ $(pip install rope;echo $?) != 0 ]
#Either of these
echo "Start to install ipython"
pip3 install ipython --user
echo "Start to install rope "
pip3 install rope --user
#pip install jedi
#Flake8 for code checks;syntax checker as pylint
echo "Start to install flake8"
pip3 install flake8 --user
#importmagic for aotumatic imports as IDE does
echo  "Start to install importmagic"
pip3 install importmagic --user
#To be able to suppress unused imports easily,install autoflake
echo "Start to install autoflake"
pip3 install autoflake --user
#and  autopep8 for automatic PEP8 formatting(which is used to format python code)
echo "Start to install autopep8"
pip3 install autopep8 --user
#and yapf for code formatting
echo "Start to install yapf"
pip3 install yapf  --user
#install virtualenv for jedi (python auto-completion)
echo "Start to install virtualenv"
pip3 install virtualenv --user
#install jedi(anaconda dependencies)
echo "Start to install jedi"
pip3 install jedi --user
#install json-rpc(anaconda dependencies)
echo "Start to install json-rpc"
pip3 install json-rpc --user
#install service_factory(anaconda dependencies)
echo "Start to install service_factory"
pip3 install service_factory --user
#install epc
echo "Start to install epc"
pip3 install epc --user
# install isort
echo "Start to install isort"
pip3 install isort --user
# install virtualenvwrapper
echo "Start to install virtualenvwrapper"
pip3 install virtualenvwrapper --user
# install python-language-server
pip3 install python-language-server --user

# install python-language-server
echo "Start to install language server"
pip3 install python-language-server --user

# install latex dependency -- Pygments
pip3 install Pygments --user
echo "Install gocode"
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/oracle
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-outline
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/cweill/gotests/...


echo "Install rust-lang"
curl https://sh.rustup.rs -sSf | sh

echo "Install racer dependency"
rustup component add rust-src
cargo install racer
cargo install cargo-edit
cargo install cargo-script
