#!/bin/bash
. ~/.dockerfcn/common.sh
. ~/.dockerfcn/osd.sh
. ~/.dockerfcn/services.sh
. ~/.dockerfcn/fl.sh
. ~/.dockerfcn/aws.sh

zshup() {
	source ~/.zshrc
}


alias nyan="docker run -it supertest2014/nyan"

#https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc
