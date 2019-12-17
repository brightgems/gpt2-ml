sh dataset/prepare_data.sh /data/corpus/ ./train_512/ 16

python3 train.py -config_file configs/base.json \
-input_file train_512/* -output_dir models_512 \
-max_seq_length 512 -train_batch_size 4 -learning_rate 3e-6 \
-num_warmup_steps 50000 -num_train_steps 100000\
-save_checkpoints_steps 10000