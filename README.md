
## Generate the input dataset

Generate the gingival.txt file:

```bash
## R dependencies must be installed
Rscript --vanilla getData.R
```

## Install and use lefse with a python3 virtual environment

Install lefse from github within a python3 environment:

```bash
python3 -m venv env
source env/bin/activate
pip install git+https://github.com/SegataLab/lefse.git
```

Run lefse. The python environment must be active:

```bash
source env/bin/activate
./script.sh
```

When the session is over, deactivate the python environment with:

```bash
deactivate
```

## .res file names

In the .res files, it = iteration and bp = bootstrap value.

## Installing with conda

The lefse package can be installed from github using conda

```bash
conda create -n lefse
conda activate lefse
conda install pip r
pip install git+https://github.com/SegataLab/lefse.git
```
Deactivate conda environment when the job is over:

```bash
conda deactivate
```

