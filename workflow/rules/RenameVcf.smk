rule RenameVcf:
    input:
        vcf="11-FilterMutectCalls/{sample}.filtered.vcf"
    output:
        vcf=protected("12-FinalCalls/{sample}/{sample}.vcf")
    shell:
        "mkdir -p 12-FinalCalls/{wildcards.sample}; "
        "mv {input.vcf} {output.vcf} "
