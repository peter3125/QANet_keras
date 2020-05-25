#!/bin/bash

# re-entrant - check existance of files before acting

cd original_data/

if [ ! -f "train-v1.1.json" ]; then
  curl -O https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json
else
  printf "train v1.1 already downloaded\n"
fi

if [ ! -f "dev-v1.1.json" ]; then
  curl -O https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json
else
  printf "dev v1.1. already downloaded\n"
fi

if [ ! -f "glove.840B.300d.zip" ]; then
  curl -O http://downloads.cs.stanford.edu/nlp/data/glove.840B.300d.zip
else
  printf "glove 840B 300d zip already downloaded\n"
fi

if [ ! -f "glove.840B.300d.txt" ]; then
  printf "unzipping global 840B 300d zip\n"
  unzip glove.840B.300d.zip
else
  printf "glove 840B 300d txt already extracted\n"
fi

cd ..
# run the pre-processing?
if [ ! -f "dataset_wordpiece/trainset_wordpiece.pkl" ]; then
  python preprocess.py
else
  printf "pre-processing already done\n"
fi
