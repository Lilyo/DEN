# DEN: Disentangling and Exchanging Network for Depth Completion
You Feng Wu</br>
Thesis in 2019.

This is an official implementation of "DEN: Disentangling and Exchanging Network for Depth Completion" in TensorFlow, the goal of our method is "structure" guided raw depth map completion by disentanged common features from a sigle RGBD image.

## Introduction
  In this research, we propose a Disentangling and Exchanging Network (DEN) to inpainting the depth channel of an RGB-D image, which is captured by a commodity-grade depth camera. When the environment is large, surfaces are shiny, or strong lighting is abundant, the depth channel is often sparse or produced with missing data, while the RGB channels are still dense and store all of the useful information. From this observation, we were thinking about the feasibility of borrowing useful information from RGB image, such as structural information, to complete the obtained sparse depth channel.
##Quick Test
	-
## Training:
	-
## Experiment:
### Result of DEN
<img src="https://github.com/Lilyo/DEN/blob/master/fig/2D.png" width="100%">
### Point cloud visualization of DEN and other comparisons.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/visualization%20.png" width="100%">

## Evaluation
