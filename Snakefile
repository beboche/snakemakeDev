FASTQS = ["MiniFastqTest_R1", "MiniFastqTest_R2"]


rule fastqc:
    input:
        fq=expand("test_input/{sample}.fastq.gz", sample=FASTQS)
    output:
        "test_output/{sample}/FASTQC_DIR/{sample}.html"
    shell:
        "mkdir test_output/{sample} && mkdir test_output/{sample}/FASTQC_DIR/ && mkdir test_output/{sample}/FASTQC_DIR/tmp && /usr/local/bin/fastqc --threads 4 -d test_output/{sample}/FASTQC_DIR/tmp {input} -o test_output/{sample}/FASTQC_DIR/" 
# rule bwa_map:
#     input:
#         "data/genome.fa",
#         "data/samples/A.fastq"
#     output:
#         "mapped_reads/A.bam"
#     shell:
#         "bwa mem {input} | samtools view -Sb - > {output}"

#works
# rule fastqc:
#     input:
#         fqR1="test_input/MiniFastqTest_R1.fastq.gz",
#         fqR2="test_input/MiniFastqTest_R2.fastq.gz"
#     output:
#         "test_output/MiniFastqTest/FASTQC_DIR/MiniFastqTest_R1.html",
#         "test_output/MiniFastqTest/FASTQC_DIR/MiniFastqTest_R2.html"
#     shell:
#         #"mkdir test_output/MiniFastqTest",
#         #"mkdir test_output/MiniFastqTest/FASTQC_DIR/",
#         #"mkdir test_output/MiniFastqTest/FASTQC_DIR/tmp",#on est limite ennombre de commandes apparemment
#         "/usr/local/bin/fastqc --threads 4 -d test_output/MiniFastqTest/FASTQC_DIR/tmp {input.fqR1} {input.fqR2} -o test_output/MiniFastqTest/FASTQC_DIR/"