rule Polysolver:
    container: "shub://IARCbioinfo/polysolver-singularity:v4"
    input:"06-ApplyRecalibration/{sample}.recalibrated.bam"
    output: "HLAtypes/{sample}/winners.hla.txt"
    resources:
        runtime=lambda wildcards, attempt: 30 * attempt,
    group: "Polysolver"
    params: config["unload_intel"]
    log: "HLAtypes/{sample}/{sample}.log"
    shell:
        "{params} "
        "/home/polysolver/scripts/shell_call_hla_type "
        "{input} Unknown 1 hg38 STDFQ 0 "
        "HLAtypes/{wildcards.sample} "
        "&> {log} "
