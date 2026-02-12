process DOWNLOAD_FILE {
    publishDir "${params.outdir}/${data_type}", mode: 'copy'

    input:
    tuple val(pkg), val(file_name), val(url), val(md5sum), val(lane), val(read)
    val(data_type)

    output:
    //tuple val("$sample_id"), val("$file_name"), val("$url"), emit: info
    tuple val(pkg), val(lane), val(read), path("$file_name"), emit: file

    script:
    """
    wget --header="X-CKAN-API-Key: ${params.bpa_api_token}" $url -O $file_name

    echo "$md5sum $file_name" | md5sum -c
    """
}