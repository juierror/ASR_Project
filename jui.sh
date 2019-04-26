rm -rf data/local/dict_nnet
rm -rf data/lang_nnet
ngram -lm LM/lm.lm -write-lm LM/lm.arpa
gzip LM/lm.arpa
ngram -lm LM/lm.lm -write-lm LM/lm.arpa
