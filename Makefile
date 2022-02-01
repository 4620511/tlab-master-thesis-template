.PHONY: all
all: abstract thesis

abstract.pdf: abstract_en.pdf abstract_ja.pdf concat-abstracts

abstract_en.pdf: __compile-abstract-en clean

abstract_ja.pdf: __compile-abstract-ja clean

thesis.pdf: __compile-thesis clean

.PHONY: clean
clean:
	@./bin/clean

.PHONY: concat-abstracts
concat-abstracts:
	@docker-compose -f ./docker/pdfunite/docker-compose.yml run --rm pdfunite

.PHONY: convert-punctuation
convert:
	@find -name "*.tex" | xargs sed -i -e 's/、/，/g'
	@find -name "*.tex" | xargs sed -i -e 's/。/．/g'

.PHONY: __compile-abstract-en
__compile-abstract-en:
	@docker-compose -f ./docker/latex/docker-compose.yml run --rm latex latexmk abstract_en.tex

.PHONY: __compile-abstract-ja
__compile-abstract-ja:
	@docker-compose -f ./docker/latex/docker-compose.yml run --rm latex latexmk abstract_ja.tex

.PHONY: __compile-thesis
__compile-thesis:
	@docker-compose -f ./docker/latex/docker-compose.yml run --rm latex latexmk thesis.tex

