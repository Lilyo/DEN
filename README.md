# DEN: Disentangling and Exchanging Network for Depth Completion
This is an official implementation of "DEN: Disentangling and Exchanging Network for Depth Completion" in TensorFlow, the goal of our method is "structure" guided raw depth map completion by disentanged common features from a sigle RGBD image.

## Introduction
  	In this research, we propose a Disentangling and Exchanging Network (DEN) to inpainting the depth channel of an RGB-D image, which is captured by a commodity-grade depth camera. When the environment is large, surfaces are shiny, or strong lighting is abundant, the depth channel is often sparse or produced with missing data, while the RGB channels are still dense and store all of the useful information. From this observation, we were thinking about the feasibility of borrowing useful information from RGB image, such as structural information, to complete the obtained sparse depth channel. We started with an assumption that the RGB image and depth image can be decomposed into two main parts: common features and specific features. The common features represent structural information that should be the same in RGB and depth images. The specific features capture the depth information and the color information in depth and RGB images respectively. The structural information extracted from RGB image is then used to guide the depth completion by combining with depth information extracted from depth image. With this idea, we finally came up with a novel architecture for depth completion with #4 types of training objectives. In order to evaluate our architecture, we conducted ablation studies and compared the results with the most advanced CNN-based depth completion methods. Our architecture achieves lowest errors on the ScanNet dataset, outperforms state-of-the-art and also produces qualitatively better results.
## Training:
	-
## Experiment:

### Result of DEN
<img src="https://github.com/Lilyo/DEN/blob/master/fig/2D.png" width="100%">
### Point cloud visualization of DEN and other comparisons.
<img src="https://github.com/Lilyo/DEN/blob/master/fig/visualization%20.png" width="100%">
