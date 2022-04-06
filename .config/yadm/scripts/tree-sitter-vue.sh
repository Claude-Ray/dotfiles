#!/bin/bash

TREE_SITTER_LANG=vue
TREE_SITTER_LANG_GIT=https://github.com/ikatyang/tree-sitter-vue.git
TREE_SITTER_LANG_GIT_DIR=~/git/tree-sitter-vue

source ./tree-sitter-lang.sh
build_grammar
