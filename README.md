NAME
====
vbox-build - a Dockerfile for building VirtualBox source tree on Ubuntu 14.04

DESCRIPTION
===========

This project builds a Docker container which has Ubuntu 14.04 and all the VirtualBox dependencies installed and
then runs the VirtualBox configuration and build steps.

STEPS
=====

Install Docker.

	apt-get install docker.io

Clone this repo.

	git clone https://github.com/jonseymour/vbox-build vbox-build

Checkout the SVN source for virtual box.

	cd vbox-build
	svn co http://www.virtualbox.org/svn/vbox/trunk src

Run the Docker build.

	make 
