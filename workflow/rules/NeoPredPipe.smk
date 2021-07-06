rule NeoPredPipe:
    input:
        vcf="12-FinalCalls/{sample}/{sample}.vcf",
        hlatypes="HLAtypes/{sample}/hla_types.txt",
        genecounts="01-Kallisto/{sample}/abundance_counts_only.tsv"
    output:
        indelssum="results/{sample}/{sample}.neoantigens.Indels.summarytable.txt",
        indels="results/{sample}/{sample}.neoantigens.Indels.txt",
        pointsum="results/{sample}/{sample}.neoantigens.summarytable.txt",
        point="results/{sample}/{sample}.neoantigens.txt"
    log: "results/{sample}/{sample}.log"
    resources:
        runtime=lambda wildcards, attempt: 1440 * attempt
    group:
        "NeoPredPipe"
    params:
        loc=config["neopipe_loc"],
        vcf_dir="12-FinalCalls/{sample}/"
    envmodules:
        "intel",
        "python2"
    conda:
        "../envs/neopred.yaml"
    shell:
        "python {params.loc}/NeoPredPipe.py "
        "-I {params.vcf_dir} "
        "-H {input.hlatypes} "
        "-o results/{wildcards.sample} "
        "-n {wildcards.sample} "
        "-x {input.genecounts} "
        "-m -d "
        "&> {log} "
