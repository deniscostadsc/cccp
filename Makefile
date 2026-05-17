DOCUMENT = cccp

.PHONY: clean pdf

clean:
	@rm -rf cccp.pdf

pdf: clean
	@docker run --rm -v ${PWD}:/data -u $(id -u):$(id -g) pandoc/latex cccp.md -o cccp.pdf -V geometry:"margin=0.75in" --toc
