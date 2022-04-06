#!/bin/bash

# Building grammar for tree-sitter
build_grammar() {
  if ! [ -d $TREE_SITTER_LANG_GIT_DIR ]; then
    mkdir -p $TREE_SITTER_LANG_GIT_DIR
    git clone $TREE_SITTER_LANG_GIT $TREE_SITTER_LANG_GIT_DIR
  fi
  cd $TREE_SITTER_LANG_GIT_DIR

  gcc ./src/parser.c ./src/scanner.cc -fPIC -I./ --shared -o $TREE_SITTER_LANG.so

  [[ -z $TREE_SITTER_DIR ]] && TREE_SITTER_DIR=~/.tree-sitter/bin
  mkdir -p $TREE_SITTER_DIR
  cp $TREE_SITTER_LANG.so $TREE_SITTER_DIR
}
