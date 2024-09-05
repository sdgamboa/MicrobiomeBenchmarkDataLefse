How to generate the plots in inst/extdata:

```bash
lefse_plot_features.py --format png --width 15 --height 10 --feature_name k_Bacteria.p_Fusobacteria -f one gingivalplaque.in gingivalplaque_a0.05_w0.05_lda2_it10_bp130.res plotFeat_Fusobacteria.png
lefse_plot_features.py --format png --width 15 --height 10 --feature_name k_Bacteria.p_Firmicutes.c_Bacilli.o_Lactobacillales.f_Streptococcaceae.g_Streptococcus.OTU_97_42482 -f one gingivalplaque.in gingivalplaque_a0.05_w0.05_lda2_it10_bp130.res plotFeat_OTU_97_42482.png
lefse_plot_cladogram.py --dpi 300 --format svg gingivalplaque_a0.05_w0.05_lda2_it10_bp130.res plotCladogram.svg
```
