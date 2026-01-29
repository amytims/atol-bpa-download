process DOWNLOAD_FILE {
    publishDir "${params.outdir}/raw_reads/${data_type}", mode: 'copy'

    input:
    tuple val(file_name), val(format), val(url), val(md5sum), val(package), val(lane), val(read)
    val(data_type)

    output:
    tuple val("$sample_id"), val("$file_name"), val("$url"), emit: info
    tuple path("$file_name"), val(package), val(lane), val(read), emit: file

    script:
    """
    wget --header="X-CKAN-API-Key: ${params.bpa_api_token}" $url -O $file_name

    echo "$md5sum $file_name" | md5sum -c

    """
}