rule NeoPredPipe:
    input:
        vcf="12-FinalCalls/{sample}/{sample}.vcf",
        hlatypes="HLAtypes/{sample}/hla_types.txt",
        genecounts="01-Kallisto/{sample}/abundance_counts_only.tsv"
    output:
        folder=directory("results/{sample}"),
        indelssum="results/{sample}/{sample}.neoantigens.Indels.summarytable.txt",
        indels="results/{sample}/{sample}.neoantigens.Indelstxt",
        pointsum="results/{sample}/{sample}.neoantigens.summarytable.txt",
        point="results/{sample}/{sample}.neoantigens.txt"
    log: "results/{sample}/{sample}.log"
    resources:
        runtime=lambda wildcards, attempt: 480 * attempt
    group:
        "NeoPredPipe"
    params:
        loc=config["neopipe_loc"],
        vcf_dir="12-FinalCalls/{sample}/"
    envmodules:
        "python2"
    conda:
        "../envs/neopred.yaml"
    shell:
        "python {params.loc}/NeoPredPipe.py "
        "-I {params.vcf_dir} "
        "-H {input.hlatypes} "
        "-o {output.folder} "
        "-n {wildcards.sample} "
        "-x {input.genecounts} "
        "-m "
        "&> {log} "
