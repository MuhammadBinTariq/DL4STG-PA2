# DL4STG Assignment 2

AI651: Deep Learning for Space, Time and Graphs, Fall 2026.

## Notebooks and saved predictions

- `DL4STG_PA2_Q2.ipynb`: working Colab notebook, including executed results through Stage 7 and written answers through Q2.11.
- `DL4STG_PA2_Q2_2-5.ipynb`: preserved executed and answered notebook at the pre-stress-test checkpoint.
- `predictions/Q2.5.md`: verbatim Q2.5 answer extracted from that checkpoint. It must remain unchanged after baseline stress testing begins.
- `predictions/Q2.11.md`: verbatim three-sentence prediction recorded before training B-D. It must remain unchanged in the final report.
- `outputs/`: exported tables, figures, captions, GIFs, full-precision summary metrics, and example selections.

## Current progress

Data/window checks, optical-flow analysis, both 30-epoch model A training runs (seeds 0 and 1), original-test-set baseline evaluation, and baseline mirror, rotation, and speed stress tests are complete. The working notebook contains the executed results through Stage 7. Tables 1-4, Figures 1-5, and the four Figure 3 GIFs are saved under `outputs/`; written answers currently cover Q2.1-Q2.11. Models B-D have not yet been trained in this workflow.

The baseline uses the handout's architecture, Adam at 1e-3, batch size 32, and final-epoch weights. Training and baseline evaluation ran on an NVIDIA A100-SXM4-40GB. The notebook records environment versions, per-seed results, and measured timing.

## Running in Colab

Open the working notebook in Google Colab and connect Google Drive. Runtime paths are created under `MyDrive/DL4STG_PA2`, with datasets in `data`, figures/tables in `outputs`, and epoch checkpoints in `training_runs`.

On a fresh runtime, restore the imports, Drive connection, dataset/split/window definitions, and model/training definitions. Existing training checkpoints resume automatically; completed runs do not need retraining. Read the stage headings before launching cells.

Large datasets and checkpoint/prediction tensors are kept in Drive and excluded from Git. Exported report figures, GIFs, tables, and report sources can be added as work proceeds.

## Submission

The final PDF report will include the repository link, required results, and written answers. The repository must be public at submission time. Q2.11 predictions must also be committed before training B-D.

## Baseline stress-test results and runtime restoration

Stage 7 in the working notebook implements Tables 3-4 and Figures 3-5, including the four required Figure 3 GIFs. The pre-test Q2.5 commit is `31adeaa74eaec058ac1a8b2f945f9e2c0c178ea8`.

In a fresh Colab GPU runtime, rerun numbered sections **1-4, 6-7, 14-15, and 24**, then run the new sections **28-36**. The saved model checkpoints and original prediction caches are loaded from Drive; no training or optical-flow rerun is needed.

Figure 3 uses original test videos 9257 and 9348 for mirroring, and 9497 and 9925 for rotation. These are the two largest seed-0 consistency gaps for each transformation. Figure 4 marks these cases across all 1,000 test videos.

Figure 5 uses original test video 9021. Visual inspection confirms that the two digits remain separated in every displayed ground-truth frame at all three speeds. The component-based screen in section 34 is only a candidate-selection aid.

Section 36 saves `MyDrive/DL4STG_PA2/baseline_stress_results.zip`. Its exported `outputs/` files are tracked in this repository, preserving the GIF paths in the Figure 3 captions. The local archive and duplicate extraction folder are ignored. The archive excludes large datasets and model/prediction tensors.

The stress-test cells have been executed and the exported results reviewed. Answers Q2.6-Q2.10 and the pre-training Q2.11 prediction are now recorded. The next stage implements and trains B-D. The frozen Q2.5 prediction and the answered pre-test notebook remain unchanged.
