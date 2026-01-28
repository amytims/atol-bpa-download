def readYAML(yamlfile) {
    return new org.yaml.snakeyaml.Yaml().load(yamlfile.text)
}

process READ_YAML {
    input:
    val(yaml)

    exec:
    // Read input
    def input = readYAML(yaml)
    
    def sd = input.reads

    input.view()

    sd.view()

}