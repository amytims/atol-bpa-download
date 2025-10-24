# atol-data-mover

Download data files from BPA data portal for AToL's Genome Engine.

## Usage

To run using jsonlines data output from the `atol-bpa-datamapper` pipeline:

```
nextflow run amytims/atol-data-mover \
    --sample_id taxid106636 \
    --jsonl /path/to/data_mapper_output.jsonl \
    --bpa_api_token ${BPA_API_TOKEN} \
    --outdir <OUTPUT_DIRECTORY> \
    --pacbio_data --hic_data
```

Optionally, a samplesheet in .csv format can be used instead - for use when files of interest are not captured in the datamapper output.
See [`assets/samplesheet_example.csv`](assets/samplesheet_example.csv) for an example.

```
nextflow run amytims/atol-data-mover \
    --sample_id taxid106636 \
    --use_samplesheet \
    --samplesheet assets/samplesheet_example.csv \
    --bpa_api_token ${BPA_API_TOKEN} \
    --outdir <OUTPUT_DIRECTORY> \
    --pacbio_data --hic_data
```

To show all options, use:

```
nextflow run amytims/atol-data-mover --help
```
