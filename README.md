
## Install lefse from bioconda

```bash
conda create -n lefse
conda activate lefse
conda install -c bioconda lefse
```

## Workflow

1. Generate the gingival.txt file:

```bash
## R dependencies must be installed
Rscript --vanilla getData.R
```
2. Run the script:

```bash
## conda activate lefse 
./script.sh
```

3. Deactivate session when the job is done:

```bash
conda deactivate
```

## .res file names

In the .res files, it = iteration and bp = bootstrap value.
