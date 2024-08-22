library(MicrobiomeBenchmarkData)
library(MicrobiomeBenchmarkDataAnalyses)
library(dplyr)
library(purrr)
library(tidySummarizedExperiment)
dat_name <- 'HMP_2012_16S_gingival_V35'
conditions_col <- 'body_subsite'
conditions <- c(condB = 'subgingival_plaque', condA = 'supragingival_plaque')
tse <- getBenchmarkData(dat_name, dryrun = FALSE)[[1]]
col_data <- tse |> 
    colData() |> 
    as.data.frame() |> 
    tibble::rownames_to_column("sample_name") |> 
    as_tibble()
subjects <- col_data |> 
    pull(subject_id) |> 
    unique()
sample_names <- vector("list", length(subjects))
names(sample_names) <- subjects
for (i in seq_along(subjects))  {
    current_subject <- subjects[i]
    sub_dat <- col_data |> 
        filter(subject_id == current_subject) |> 
        slice_max(order_by = visit_number, with_ties = TRUE, n = 1)
    if (nrow(sub_dat) < 2) {
        next
    }
    lgl_vct <- all(sort(sub_dat[[conditions_col]]) == conditions)
    if (isFALSE(lgl_vct)) {
        next
    }
    sample_names[[i]] <- sub_dat
}
sample_names <- discard(sample_names, is.null)
col_data_subset <- bind_rows(sample_names)
selected_samples <- col_data_subset |> 
    pull(sample_name)
tse_subset <- tse[, selected_samples]
tse_subset <- filterTaxa(tse_subset)


counts <- tse_subset |> 
    assay() |> 
    as.data.frame() %>% 
    tibble::rownames_to_column('feature') |> 
    mutate(across(.cols = everything(), .fns = ~as.character(.x))) 
colnames(counts) <- paste0("col", seq_along(counts))    

sm <- tse_subset |> 
    colData() |> 
    as.data.frame() |> 
    tibble::rownames_to_column('Sample') |> 
    select(body_subsite, Sample) |> 
    t() |> 
    as.data.frame() |> 
    tibble::rownames_to_column('helper_col') |> 
    mutate(across(.cols = everything(), .fns = ~ as.character(.x))) 
colnames(sm) <- paste0('col', seq_along(sm))

dat <- bind_rows(sm, counts)
colnames(dat) <- NULL

write.table(
    dat, 'gingivalplaque.txt', sep = '\t', row.names = FALSE, col.names = FALSE,
    quote = FALSE
)
