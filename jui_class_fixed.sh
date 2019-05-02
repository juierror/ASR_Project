rm -rf data/local/dict_nnet
rm -rf data/lang_nnet
./LM/build_class_ngram ./LM/asr.manual.classes ./LM/transcript_mac_2.txt 3 ./LM/asr.vocab ./LM/lm.lm
ngram -lm LM/lm.lm -write-lm lm.arpa
gzip lm.arpa
ngram -lm LM/lm.lm -write-lm lm.arpa
./prepare_LG.sh lexicon_words.txt lm.arpa exp/nnet2_online/phones.txt data/local/dict_nnet data/lang_nnet
rm -rf data/lang_nnet_g
./utils/format_lm.sh data/lang_nnet lm.arpa.gz lexicon_words.txt data/lang_nnet_g
utils/mkgraph.sh data/lang_nnet_g exp/nnet2_online exp/nnet2_online/graph
