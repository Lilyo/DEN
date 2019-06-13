# DEN: Disentangling and Exchanging Network for Depth Completion
This is an official implementation of "DEN: Disentangling and Exchanging Network for Depth Completion" by You-Feng Wu at CCU 2019. This repo offers the original implementation of the paper in Tensorflow.</br>
The goal of our method is "structure" guided raw depth map completion by disentanged common features from a sigle RGBD image.

- Result of DEN.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/2D.png" width="90%">

## Introduction
In this research, we propose a Disentangling and Exchanging Network (DEN) to inpainting the depth channel of an RGB-D image, which is captured by a commodity-grade depth camera. When the environment is large, surfaces are shiny, or strong lighting is abundant, the depth channel is often sparse or produced with missing data, while the RGB channels are still dense and store all of the useful information. From this observation, we were thinking about the feasibility of borrowing useful information from RGB image, such as structural information, to complete the obtained sparse depth channel.
  
## Quick Test(UNOPENED)
1. Download ScanNet testing data in [`./data/`](./data), and unzip it there.
2. Download `650291.ckpt` in [`./pre_train_model/`](./pre_train_model).
3. Modify default setting and run `main_dc.py`.
```bash
python main_dc.py --phase test
```

## Pre-trained Model(UNOPENED)
We provide pre-trained models on ScanNet dataset. Please check [`./checkpoint/ScanNet_gan_2layer_4dis_4scale_1con_60ch_36z_36z/`](./checkpoint/ScanNet_gan_2layer_4dis_4scale_1con_60ch_36z_36z) for download links.

## Depth Completion Dataset
- ScanNet. The original dataset is from https://github.com/ScanNet/ScanNet. Please check link for details of the dataset and how to sign agreement. Zhang et al. render depth from ScanNet dataset for training and evaluating depth completion. Please check 
https://github.com/yindaz/DeepCompletionRelease for more details. 

## Training(UNOPENED)
	-
## Experiment
- Error visualization.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/error.png" width="90%">

- Point cloud visualization of DEN and other comparisons.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/visualization%20.png" width="90%">

## Evaluation
- We use the MATLAB code [`./matlab/evalDEN.m`](./matlab/evalDEN.m) to evaluate the performance of the depth completion. 
- To evaluate on ScanNet, you need to get accesses to these dataset to download ground truth for the testing set.
- We provide pre-computed results of our method on ScanNet. You will need a MAT file which contain predict result, raw depth and ground truth depth to run evaluation. Download `650291.mat` in [`./result_eval/ScanNet_gan_2layer_4dis_4scale_1con_60ch_36z_36z/`](./result_eval/ScanNet_gan_2layer_4dis_4scale_1con_60ch_36z_36z).

- Please check [`./data_list/ScanNet_test.txt`](./data_list) for the list of testing images. Since the testing data also comes from original dataset, please email Yinda Zhang for download link after getting access to ScanNet.

## Benchmark

- Error metrics on ScanNet dataset:

	| RGBD-Both   |  Rel  |  RMSE  | tRMSE | delta1 | delta2 | delta3 |
	|---------------------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
	| [Bilateral](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/11/shkf_eccv2012.pdf) (_ECCV2012_) | 0.0844 | 0.4118 | 0.2539 | 0.9073 | 0.9412 | 0.9584 |
	| [Zhang et al.](http://deepcompletion.cs.princeton.edu/paper.pdf) (_CVPR2018_)  | 0.0877 | 0.3201 | 0.2284 | 0.9213 | 0.9588 | 0.9764 |
	| **DEN** | **0.0748** | **0.3043** | **0.2195** | **0.9247** | **0.9621** | **0.9794** |
	
	| RGBD-Valid   |  Rel  |  RMSE  | tRMSE | delta1 | delta2 | delta3 |
	|---------------------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
	| [Bilateral](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/11/shkf_eccv2012.pdf) (_ECCV2012_) | 0.0494 | 0.2485 | 0.1710 | 0.9588 | 0.9757 | 0.9857 |
	| [Zhang et al.](http://deepcompletion.cs.princeton.edu/paper.pdf) (_CVPR2018_)  | 0.0490 | 0.2484 | 0.1709 | 0.9588 | 0.9757 | 0.9856 |
	| **DEN** | **0.0470** | **0.2300** | **0.1636** | **0.9617** | **0.9786** | **0.9877** |

	| RGBD-Invalid   |  Rel  |  RMSE  | tRMSE | delta1 | delta2 | delta3 |
	|---------------------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
	| [Bilateral](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/11/shkf_eccv2012.pdf) (_ECCV2012_) | 0.2266 | 0.6974 | 0.4098 | 0.7560 | 0.8398 | 0.8781 |
	| [Zhang et al.](http://deepcompletion.cs.princeton.edu/paper.pdf) (_CVPR2018_)  | 0.2016 | 0.4714 | 0.3460 | 0.8113 | 0.9092 | 0.9492 |
	| **DEN** | **0.1567** | **0.4574** | **0.3332** | **0.9160** | **0.9134** | **0.9551** |
