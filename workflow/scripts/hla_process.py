#!/usr/bin/env python3
# Note that there will be the snakemake variable

hlawinnersfile = snakemake.input[0]

with open(hlawinnersfile, 'r') as hlafile:
    hlaList = []
    for line in hlafile.readlines():
        lineArray = line.rstrip('\n').split('\t')
        hlaList.append(lineArray[1])
        if lineArray[2] != lineArray[1]:
            hlaList.append(lineArray[2])
        else:
            hlaList.append('NA')
    with open(snakemake.output[0], 'w') as outFile:
        outFile.write('Patient\tHLA-A_1\tHLA-A_2\tHLA-B_1\tHLA-B_2\tHLA-C_1\tHLA-C_2\n')
        outFile.write(snakemake.wildcards["sample"] + '\t' + ('\t').join(hlaList) + '\n')
