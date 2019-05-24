# DEN: Disentangling and Exchanging Network for Depth Completion
You Feng Wu</br>
Thesis in 2019.

This is an official implementation of "DEN: Disentangling and Exchanging Network for Depth Completion" in TensorFlow, the goal of our method is "structure" guided raw depth map completion by disentanged common features from a sigle RGBD image.

## Introduction
  In this research, we propose a Disentangling and Exchanging Network (DEN) to inpainting the depth channel of an RGB-D image, which is captured by a commodity-grade depth camera. When the environment is large, surfaces are shiny, or strong lighting is abundant, the depth channel is often sparse or produced with missing data, while the RGB channels are still dense and store all of the useful information. From this observation, we were thinking about the feasibility of borrowing useful information from RGB image, such as structural information, to complete the obtained sparse depth channel.
  
## Quick Test
1. Download ScanNet testing data in [`./data/`](./data), and unzip it there.
2. Download `650291.ckpt` in [`./pre_train_model/`](./pre_train_model).
3. Modify default setting for '--phase' to 'test' in `main_dc.py`.
4. Run `main_dc.py`.

## Training:
	-
## Experiment:
### Result of DEN
<img src="https://github.com/Lilyo/DEN/blob/master/fig/2D.png" width="100%">
### Point cloud visualization of DEN and other comparisons.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/visualization%20.png" width="100%">

## Evaluation
- We use the MATLAB code [`./matlab/evalDEN.m`](./matlab/evalDEN.m) to evaluate the performance of the depth completion. 
- To evaluate on ScanNet, you need to get accesses to these dataset to download ground truth for the testing set.
- We provide pre-computed results of our method on ScanNet. you will need a MAT file which contain predict result, raw depth and ground truth depth to run evaluation. Download `650291.mat` in [`./result_eval/ScanNet_gan_2layer_4dis_4scale_1con_16ch_36z_36z/`](./result_eval/ScanNet_gan_2layer_4dis_4scale_1con_16ch_36z_36z).

-Please check [`./data_list/ScanNet_test.txt`](./data_list) for the list of testing images. Since the testing data also comes from original dataset, please email Yinda Zhang for download link after getting access to ScanNet.
