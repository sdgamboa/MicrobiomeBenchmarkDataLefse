# A package for running lefse and microbiomeMarker on MicrobiomeBenchmarkData

## Lefse (conda version)

Check the inst/scripts for source code.
Check the inst/extdata directory for results.

### Install lefse from bioconda

```bash
conda create -n lefse
conda activate lefse
conda install -c bioconda lefse
```

### Workflow

1. Generate the gingival.txt file:

```bash
## R dependencies must be installed
Rscript --vanilla getData.R
```
2. Run the script:

```bash
## conda activate lefse 
./runLefse.sh
```

3. Deactivate session when the job is done:

```bash
conda deactivate
```

### .res file names
+ a = anova threshold
+ w = wilcoxon threshold
+ lda = lda threshold
+ it = iteration
+ bp = bootstrap
