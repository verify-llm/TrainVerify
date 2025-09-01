# TrainVerify Quick Start

1. Create [conda](https://www.anaconda.com/download/success) environment.
    ```
    cd Verdict
    conda env create -f conda-environment.yml
    conda activate verdict
    ```
2. Run demo verification for 2-layer llama model parallelization.
   ```
   python main.py \
    --sm gen_model/mgeners/llama3_default_dp1_pp1_tp1_nm1_gbs128_ly2_h4_hi128_sq128.pkl \
    --pm gen_model/mgeners/llama3_default_dp2_pp2_tp2_nm2_gbs128_ly2_h4_hi128_sq128.pkl \
    --seed 0 \
    --time \
    --max_ser_proc 30 \
    --max_vrf_proc 30 \
    --loglevel INFO \
    --no_cache_nodes \
    --no_cache_stages
   ```
   > Command interpretation: `main.py` is the entry of Verdict. `--sm` and `--pm` sepcify the paths of single-device model's and parallelized model's execution plan respectively. `--seed` sets z3 random seed. `--time` activates timer. `--max_ser_proc` and `--max_vrf_proc` set the multiprocessing pool size for building SSA DAGs, and parallel stage execution respectively. `--loglevel` sets logger level. `--no_cache_nodes` and `--no_cache_stages` ignore any cached data and run verification from scratch.
3. Examine the output. The program should print the following message or similar at the bottom of the output. Indicating successful execution of all stages, as well as the verified end-to-end equivalence.
    ```
    PID: ... - ✅ SUCCESS 
    Stats(success=True, ... )
    ```