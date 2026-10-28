# DL4STG Assignment 2

AI651: Deep Learning for Space, Time and Graphs, Fall 2026.

## Notebooks and saved predictions

- `DL4STG_PA2_Q2.ipynb`: working Colab notebook, including executed results through Stage 8, answers through Q2.14, and the unexecuted final stage.
- `DL4STG_PA2_Q2_2-5.ipynb`: preserved executed and answered notebook at the pre-stress-test checkpoint.
- `predictions/Q2.5.md`: verbatim Q2.5 answer extracted from that checkpoint. It must remain unchanged after baseline stress testing begins.
- `predictions/Q2.11.md`: verbatim three-sentence prediction recorded before training B-D. It must remain unchanged in the final report.
- `outputs/`: exported tables, figures, captions, GIFs, full-precision summary metrics, and example selections.

## Current progress

Data/window checks, optical-flow analysis, all A-D training runs (seeds 0 and 1, 30 epochs each), baseline stress tests, and Table 5 evaluation are complete. The working notebook contains the executed results through Stage 8 and answers through Q2.14. Tables 1-5, Figures 1-5, and the four Figure 3 GIFs are saved under `outputs/`; the remaining Stage 8 metadata is also saved in Drive and will be included in the final report archive. Stage 9 code is ready but has not been executed.

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

The stress-test cells have been executed and the exported results reviewed. Answers Q2.6-Q2.10 and the pre-training Q2.11 prediction are recorded. Models B-D have subsequently completed training. The frozen Q2.5 prediction and the answered pre-test notebook remain unchanged.

## Stage 8: augmented training and Table 5

The exact Q2.11 prediction was committed before B-D training in `2e5b8f5866a2de7c84ae2ed73e1f58e150513758`. The training code embeds that prediction and its checksum in every checkpoint.

- B uses model A's architecture and normal-speed windows with uniformly sampled square symmetries.
- C uses model A's architecture and uniformly sampled 1x, 2x and 3x speeds, with the prescribed valid starts.
- D uses C's sampling protocol and changes only the second ConvLSTM layer to dilation 2 with padding 2. It has the same 480,784 parameters and a strictly larger reach: 12 original pixels per axis, approximately 17 diagonally.

In the current runtime, run sections **37-40**, review the checks in **39**, then run **41-43** for all six training runs and **44-46** for Table 5. Each model/seed uses fresh initialization, exactly 30 epochs, Adam at 1e-3 and batch size 32. Saved epoch-boundary checkpoints resume completed work; a partial epoch is repeated.

In a fresh runtime, restore sections **1-4, 6-7, 14-15, 24, 28-29**, then run **37-46**. Section 40 defines the shared masked loss and checkpoint/RNG helpers directly, and training reports missing setup sections before taking any optimizer steps. Earlier training and stress-test experiments do not need rerunning. Keep the baseline A100 runtime when practical so the hardware is comparable.

If an older copy of section 41 reports `capture_random_states` as undefined, run section 20 and retry section 41. If `masked_video_mse` is undefined, run section 16 as well. Successfully saved epochs resume automatically; an epoch that failed before checkpoint saving is repeated.

Table 5 evaluates A-D on the same 1,000 test videos at start 1, using both seeds. It includes original and transformed errors, consistency gaps, short-horizon errors at all three speeds, parameter counts, mean epoch training times and inference time for 1,000 original videos. A is evaluated again to measure inference time on the same hardware; its weights are unchanged. Matching partial evaluation results resume from a progress file.

Section 46 exports `MyDrive/DL4STG_PA2/stage8_results.zip`, containing Table 5, full-precision metrics, hardware labels, training summaries, model D's design and correctness-check outputs. Review it before answering Q2.13-Q2.14 and starting the final symmetrisation stage.

The augmentation/window rules, constructor parameter arithmetic, spatial support and frozen prediction checks were verified locally. The actual PyTorch forward/backward checks in section 39 must pass in Colab before training.

The recorded Stage 8 run passed section 39, completed all six B-D training runs and evaluated Table 5 on an A100. Section 40 contains a later setup repair and is marked unexecuted; rerun it only if resuming training. The recorded runs used the equivalent shared helpers restored from sections 16 and 20.

## Stage 9: final symmetry average, Table 6 and Figure 6

The final model is symmetrised D, the handout's default. It averages the inverse-transformed outputs of eight complete nine-step forecasts. Each branch uses its own autoregressive feedback, and no additional training is performed. There is one set of 480,784 learned parameters.

In the current runtime, run sections **47-53**. Section 48 checks exact group consistency up to floating-point error; sections 49-50 evaluate both seeds of symmetrised B and D and generate Table 6; sections 51-52 generate Figure 6 and a fixed-video diagnostic for Q2.16; section 53 packages the results. Original inference timing includes all eight transformations, complete forward passes, inverse transformations and averaging. Training time is inherited from the underlying learned model.

In a fresh GPU runtime, restore sections **1-4, 6-7, 14-15 and 38**, then run **47-53**. Stage 9 supplies its own imports, group functions, checkpoint loader and evaluation helpers. It reads final-epoch checkpoints and the completed Stage 8 metrics from Drive.

Figure 6(a) uses the original Figure 3 cases: mirror videos 9257 and 9348, and rotation videos 9497 and 9925. Its captions name the four new GIFs under `outputs/gifs/`. Figure 6(b) uses original speed video 9021, preserving Figure 5's displayed frame numbers. No cases are reselected. A supplementary A/B/C/D/final comparison on rotated video 9925 supports the distinction between correct motion and guaranteed consistency.

Section 53 exports `MyDrive/DL4STG_PA2/q2_final_results.zip`, collecting Tables 1-6, Figures 1-6, captions, the eight required GIFs, summary metrics and diagnostic comparisons. It excludes datasets, checkpoints and prediction tensors. Extract its `outputs/` folder into the repository, then use the measured results to finish Q2.15-Q2.17. Q2.17 is limited to 150 words.

The proof of exact equivariance is included before section 47. Local checks exercised the actual wrapper source using NumPy, all eight group operations, an incorrect-inverse negative control, setup dependencies, formatting and the GIF layout. Section 48 supplies the actual PyTorch checks for Colab; learned-model Table 6 results remain pending.
