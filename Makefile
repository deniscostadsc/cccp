DOCUMENT = cccp

.PHONY: clean pdf

clean:
	@rm -rf cccp.pdf

pdf: clean
	@docker run \
		--platform linux/amd64 \
		--rm \
		-v ${PWD}:/data \
		-u $(id -u):$(id -g) pandoc/latex cccp.md \
		-o cccp.pdf \
		-V geometry:"margin=0.75in" \
		-V classoption:twocolumn \
		-V classoption:landscape \
		-V date="$(shell date '+%d/%m/%Y')" \
		-H settings.tex \
		--toc
