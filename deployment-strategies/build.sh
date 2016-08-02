#!/bin/bash

OUTPUT_FILE_NAME='paper.pdf'

CITATION_STYLE_LANGUAGE_FILE_NAME='acm-proceedings.csl'
STYLE_FILE_NAME='acm-style.cls'
COPYRIGHT_FILE_NAME='acmcopyright.sty'

if [ ! -f ./$CITATION_STYLE_LANGUAGE_FILE_NAME ]; then
  echo "Downloading missing citation style language (CSL) file..."
  curl https://raw.githubusercontent.com/citation-style-language/styles/master/acm-sig-proceedings.csl --create-dirs -o $CITATION_STYLE_LANGUAGE_FILE_NAME
fi

if [ ! -f $STYLE_FILE_NAME ]; then
  echo "Downloading missing style template..."
  curl https://www.acm.org/binaries/content/assets/publications/article-templates/sig-alternate-05-2015.cls -o $STYLE_FILE_NAME
fi

if [ ! -f $COPYRIGHT_FILE_NAME ]; then
  echo "Downloading missing copyright file..."
  curl http://www.acm.org/binaries/content/assets/publications/article-templates/acmcopyright.sty -o $COPYRIGHT_FILE_NAME
fi

echo "Building document as '$OUTPUT_FILE_NAME'..."

pandoc \
  --standalone \
  --smart \
  --number-sections \
  --include-in-header style.tex \
  --filter pandoc-fignos \
  --biblio ../references.bib \
  --filter pandoc-citeproc \
  --csl $CITATION_STYLE_LANGUAGE_FILE_NAME \
  --from markdown+autolink_bare_uris \
  --output $OUTPUT_FILE_NAME \
  metadata.yml \
  src/introduction.md \
  src/background.md \
  src/method-and-results.md \
  src/discussion.md \
  src/conclusion.md \
  src/references.md
