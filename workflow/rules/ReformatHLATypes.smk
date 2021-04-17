rule ReformatHLATypes:
    input:
        "HLAtypes/{sample}/winners.hla.txt"
    output:
        protected("HLAtypes/{sample}/hla_types.txt")
    script:
        "../scripts/hla_process.py"
