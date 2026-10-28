# DL4STG Assignment 2 - Question 2

AI651: Deep Learning for Space, Time and Graphs, Fall 2026.

## Report and results

- [Compiled Q2 report](output/pdf/DL4STG_PA2_Q2_Report.pdf): 18 pages, covering Q2.1-Q2.17, Tables 1-6, Figures 1-6 and the video-9925 diagnostic.
- [Editable LaTeX project](report/main.tex): PA1 visual style, concise prose and readable figure labels. Open the `report` folder or run `report/build.ps1` with XeLaTeX available.
- [LaTeX source bundle](output/pdf/DL4STG_PA2_Q2_Report_Source.zip): all sources and figure assets needed to compile the report.
- `DL4STG_PA2_Q2.ipynb`: final executed Colab notebook with all 17 answers. Minor prose corrections clarify axial/diagonal reach and appearance attribution; experimental code and outputs are unchanged.
- `outputs/`: all exported tables, figures, captions, eight required GIFs, full-precision metrics and example selections.

The report preserves Q2.5 and Q2.11 verbatim. Q2.17 is 91 words. Table entries use the recorded mean and the two seeds; wrapped consistency gaps remain in scientific notation. All numerical results and figure cases match the executed notebook.

## Models and protocol

A is the prescribed two-layer ConvLSTM with 480,784 parameters. B adds uniform square-symmetry augmentation at 1x. C uses uniformly sampled 1x/2x/3x windows. D uses C's sampling and changes the second ConvLSTM layer to dilation 2 with padding 2: its reach is 12 original pixels per axis, versus A's 8, with the same parameter count.

Every learned model completed exactly 30 epochs for seeds 0 and 1, using Adam at 1e-3, batch size 32 and final-epoch weights. Training and evaluation used an NVIDIA A100-SXM4-40GB. Timing and environment metadata are recorded in the notebook and JSON exports.

The final model is symmetrised D. It averages eight complete inverse-transformed forecasts, with no additional training and one shared set of weights. Both seeds of symmetrised B and D are reported in Table 6.

Figure 3 and Figure 6(a) use mirror videos 9257/9348 and rotation videos 9497/9925. Figure 5 and Figure 6(b) use speed video 9021, whose digits remain separated in every displayed true frame. Cases are fixed across models.

## Reproducing in Colab

Runtime files are stored under `MyDrive/DL4STG_PA2`: datasets in `data`, figures/tables in `outputs`, and checkpoints in `training_runs/{model}_seed{seed}`. Large datasets, weights and prediction tensors stay in Drive and are excluded from Git. Completed training calls resume without adding epochs; an unfinished epoch is repeated from its saved starting state.

For a full reproduction, follow the notebook stages in order. With completed Drive checkpoints and exports, use these fresh-runtime restore orders:

- Baseline stress tests: sections **1-4, 6-7, 14-15, 24**, then **28-36**.
- B-D training/evaluation: sections **1-4, 6-7, 14-16, 20, 24, 28-29**, then **37-46**. Section 16 supplies `masked_video_mse`; section 20 supplies checkpoint and RNG helpers.
- Final evaluation: sections **1-4, 6-7, 14-15, 38**, then **47-53**. Stage 9 includes its own imports, checkpoint loader, group operations and evaluation helpers. It requires no training.

Section 53 creates `MyDrive/DL4STG_PA2/q2_final_results.zip`. Its report-sized `outputs/` contents are tracked here; the archive and duplicate extraction directory are ignored. GIF paths in the PDF captions resolve to `outputs/gifs/` in this repository.

## Frozen predictions

- `predictions/Q2.5.md`: original prediction, committed before baseline stress tests in `31adeaa74eaec058ac1a8b2f945f9e2c0c178ea8`.
- `DL4STG_PA2_Q2_2-5.ipynb`: preserved executed and answered pre-test notebook.
- `predictions/Q2.11.md`: original three-sentence prediction, committed before B-D training in `2e5b8f5866a2de7c84ae2ed73e1f58e150513758`.

These files remain unchanged. The report includes the repository link on its first page. The repository must be public at submission time.
