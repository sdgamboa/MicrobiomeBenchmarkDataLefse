
## Generate the input dataset

Generate the gingival.txt file:

```bash
## R dependencies must be installed
Rscript --vanilla getData.R
```
## Install and use lefse from bioconda

```bash
conda create -n lefse
conda activate lefse
conda install -c bioconda lefse
```


Run lefse. The python environment must be active:

```bash
source env/bin/activate
./script.sh
```

When the session is over, deactivate the python environment with:

```bash
conda deactivate
```

## .res file names

In the .res files, it = iteration and bp = bootstrap value.


