DOCUMENT = cccp

.PHONY: clean pdf

clean:
	@rm -rf cccp.pdf

pdf: clean
	@docker run \
		--rm \
		-v "$(shell pwd):/data" \
		-u "$$(id -u):$$(id -g)" \
		--platform linux/amd64 pandoc/latex \
		$(DOCUMENT).md \
		-o $(DOCUMENT).pdf
