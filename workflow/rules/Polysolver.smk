rule Polysolver:
    container: "shub://IARCbioinfo/polysolver-singularity:v4"
    input:"06-ApplyRecalibration/{sample}.recalibrated.bam"
    output: "HLAtypes/{sample}/winners.hla.txt"
    resources:
        runtime=lambda wildcards, attempt: 720 * attempt,
    group: "Polysolver"
    log: "HLAtypes/{sample}/{sample}.log"
    shell:
        "/home/polysolver/scripts/shell_call_hla_type "
        "{input} Unknown 1 hg38 STDFQ 0 "
        "HLAtypes/{wildcards.sample} "
        "&> {log} "
