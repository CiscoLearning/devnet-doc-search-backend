# DevNet Expert Search Backend

This repo contains the code to generate the Lucene index for the DevNet Expert
search engine.  Due to the index's size, it is NOT included here.

## Prerequisites

The index generation code requires a modern Java compiler and runtime engine.

Before building the index, download the `glove.6B.300d.txt` dictionary file
(e.g., from https://www.kaggle.com/datasets/thanakomsn/glove6b300dtxt) and place
it in the `dict` subdirectory.  This file must be named `glove.6B.300d.txt`.

### Compile the Classes

Run the script `scripts/compile-classes.sh` to compile the Java classes needed to build
the index.  These files are taken from the example Lucene search engine code.

## Generating the Index

To generate the index, pick a target directory containing _text_ files to index.  Then run
the command `scripts/generate-index.sh SOURCE_DIR INDEX_DIR` where `SOURCE_DIR` is the
path to the files to index and `INDEX_DIR` is the directory into which the index will
be placed.

When configuring the frontend, point to the index location.  While you won't have the
same documentation that the exam has, you can get a good sense of how the search engine
works and how its results look.
