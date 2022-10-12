

rule assignment_statistic_totalCounts:
    """
    Statistic of the total (unfiltered counts).
    """
    conda:
        "../../envs/python3.yaml"
    input:
        bc="results/assignment/{assignment}/barcodes_incl_other.sorted.tsv.gz",
        script=getScript("assignment/statistic_total_counts.py"),
    output:
        "results/assignment/{assignment}/statistic/total_counts.tsv.gz",
    log:
        "results/logs/assignment/statistic_totalCounts.{assignment}.log",
    shell:
        """
        python {input.script} --input {input.bc} --output {output} &> {log}
        """


rule assignment_statistic_assignedCounts:
    """
    Statistic of the assigned counts.
    """
    conda:
        "../../envs/python3.yaml"
    input:
        bc="results/assignment/{assignment}/assignment_barcodes.{assignment_config}.sorted.tsv.gz",
        script=getScript("assignment/statistic_total_counts.py"),
    output:
        "results/assignment/{assignment}/statistic/assigned_counts.{assignment_config}.tsv.gz",
    log:
        "results/logs/assignment/statistic_assignedCounts.{assignment}.{assignment_config}.log",
    shell:
        """
        python {input.script} --input {input.bc} --output {output} &> {log}
        """


rule assignment_statistic_assignment:
    """
    Statistic of the filtered assignment.
    """
    conda:
        "../../envs/r.yaml"
    input:
        bc="results/assignment/{assignment}/assignment_barcodes.{assignment_config}.sorted.tsv.gz",
        script=getScript("assignment/statistic_assignment.R"),
    output:
        stats="results/assignment/{assignment}/statistic/assignment.{assignment_config}.tsv.gz",
        plot="results/assignment/{assignment}/statistic/assignment.{assignment_config}.png",
    log:
        "results/logs/assignment/statistic_assignment.{assignment}.{assignment_config}.log",
    shell:
        """
        Rscript {input.script} --input {input.bc} --statistic {output.stats} --plot {output.plot} &> {log}
        """
