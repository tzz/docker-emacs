build:
	@echo "Building emacs image with build-arg $(EXTRA)"
	docker run -it --rm --privileged --pid=host alpine sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"
	docker build -t emacs:gnutls --build-arg $(EXTRA) -f Dockerfile.multistage . || echo build failed, proceeding anyway
	docker run -it --rm --privileged --pid=host alpine sh -c "echo 1 > /proc/sys/kernel/randomize_va_space"
