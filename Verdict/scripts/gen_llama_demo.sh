PYTHONPATH=.:$PYTHONPATH OMP_NUM_THREADS=4 torchrun  \
        --nproc_per_node=1  \
        gen_model/gen_llama3_default.py --policy dp \
            --layers 2 \
            --hidden 128 \
            --heads 4 \
            --dp_size 1 \
            --pp_size 1 \
            --tp_size 1 \
            --gbs 128 \
            --mbs 128 \
            --seqlen 128

PYTHONPATH=.:$PYTHONPATH OMP_NUM_THREADS=4 torchrun  \
        --nproc_per_node=1  \
        gen_model/gen_llama3_default.py --policy hybrid \
            --layers 2 \
            --hidden 128 \
            --heads 4 \
            --dp_size 2 \
            --pp_size 2 \
            --tp_size 2 \
            --gbs 128 \
            --mbs 32 \
            --seqlen 128