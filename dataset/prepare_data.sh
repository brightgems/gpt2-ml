#!/usr/bin/env bash

NUM_FOLDS=1024
MAX_SEQ_LENGTH=512
IN_FN=${1}
OUT_FN=${2}

rm -rf logs_${MAX_SEQ_LENGTH}
mkdir logs_${MAX_SEQ_LENGTH}
parallel -j $(nproc --all) --will-cite "python dataset/prepare_data.py -fold {1} -num_folds ${NUM_FOLDS} -base_fn ${OUT_FN} -input_fn ${IN_FN} -max_seq_length ${MAX_SEQ_LENGTH} > logs_${MAX_SEQ_LENGTH}/log{1}.txt" ::: $(seq 0 $((${NUM_FOLDS}-1)))
