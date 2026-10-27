# DL4STG Assignment 2

AI651: Deep Learning for Space, Time and Graphs, Fall 2026.

## Notebooks and saved predictions

- `DL4STG_PA2_Q2.ipynb`: working Colab notebook, including executed results and written answers through Q2.5.
- `DL4STG_PA2_Q2_2-5.ipynb`: preserved executed and answered notebook at the pre-stress-test checkpoint.
- `predictions/Q2.5.md`: verbatim Q2.5 answer extracted from that checkpoint. It must remain unchanged after baseline stress testing begins.
- `AI_USAGE.md`: working record of AI assistance for the final report disclosure.

## Current progress

Data/window checks, optical-flow analysis, both 30-epoch model A training runs (seeds 0 and 1), original-test-set baseline evaluation, Table 2, Figure 2, and answers Q2.1-Q2.5 are complete. Baseline mirror, rotation, and speed stress tests have not yet been run in this workflow.

The baseline uses the handout's architecture, Adam at 1e-3, batch size 32, and final-epoch weights. Training and baseline evaluation ran on an NVIDIA A100-SXM4-40GB. The notebook records environment versions, per-seed results, and measured timing.

## Running in Colab

Open the working notebook in Google Colab and connect Google Drive. Runtime paths are created under `MyDrive/DL4STG_PA2`, with datasets in `data`, figures/tables in `outputs`, and epoch checkpoints in `training_runs`.

On a fresh runtime, restore the imports, Drive connection, dataset/split/window definitions, and model/training definitions. Existing training checkpoints resume automatically; completed runs do not need retraining. Read the stage headings before launching cells.

Large datasets and checkpoint/prediction tensors are kept in Drive and excluded from Git. Exported report figures, GIFs, tables, and report sources can be added as work proceeds.

## Submission

The final PDF report will include the repository link, required results, written answers, and AI-use disclosure. The repository must be public at submission time. Q2.11 predictions must also be committed before training B-D.
