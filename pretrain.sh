sh dataset/prepare_data.sh /data/corpus/ ./train_512/ 16

python3 train.py -config_file configs/base.json \
-input_file train_512/* -output_dir models_512 \
-init_checkpoint gs://pyai/models/mega/model.ckpt-100000 \
-max_seq_length 1024 -train_batch_size 16 -lea-rning_rate 1e-6 \
-num_train_steps 100000 -num_warmup_steps 10000 -save_checkpoints_steps 1000 \
-iterations_per_loop 1000 -use_tpu 1 -tpu_name brightgems