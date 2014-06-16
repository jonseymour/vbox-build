build: image src
	docker run -v ${PWD}/src:/var/src vbox-build bash -c 'KERN_INCL=/usr/src/linux/include/generated/uapi ./configure --disable-hardening && . env.sh && kmk'


run:	src
	docker run -it -v ${PWD}/src:/var/src vbox-build bash

image:
	docker build -t vbox-build .

src:
	@echo "Create a symbolic link called src which points at the top of the VirtualBox src tree"
