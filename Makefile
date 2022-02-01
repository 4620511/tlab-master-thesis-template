.PHONY: all
all: abstract thesis

.PHONY: abstract
abstract: abstract-en abstract-ja concat-abstracts

.PHONY: abstract-en
abstract-en: __compile-abstract-en clean

.PHONY: abstract-ja
abstract-ja: __compile-abstract-ja clean

.PHONY: thesis
thesis: __compile-thesis clean

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
	@docker-compose -f ./docker/latex/docker-compose.yml run --rm latex latexmk main.tex

