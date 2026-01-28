def readYAML(yamlfile) {
    return new org.yaml.snakeyaml.Yaml().load(yamlfile.text)
}

process READ_YAML {
    input:
    val(yaml)

    output:
    val sd
    val input

    exec:
    // Read input
    def input = readYAML(yaml)
    
    def sd = input.reads



}