First run script gen_simcode.R to generate simulation code. Demonstration on leverage data will be generated from leverage_template.R, the output script will be title leverage_i.R, with random_seed = i. Likewise, demonstration on outiler scenarios will be generated using template basic_template.R

After execution of all the generated R scripts, run combine.R to aggregate simulation outcome. In the end, run summary_mean.R and summary_median.R for summary statistics.

The two html files are the summarized outcome of our simulation.