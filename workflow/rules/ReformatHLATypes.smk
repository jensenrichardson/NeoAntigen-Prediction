rule ReformatHLATypes:
    input:
        "HLAtypes/{sample}/winners.hla.txt"
    output:
        "HLAtypes/{sample}/hla_types.txt"
    script:
        "../scripts/hla_process.py"
