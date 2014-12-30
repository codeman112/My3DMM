
clc;
clear;
addpath functions
addpath functions/face++


%%
%输入参数
where = '.';
folder = 'traindata';
load([where '/' folder '/traindata.mat']);

%%
%得到输入图像的特征点
img = 'test_1.bmp';
[ControlPoints2D,input_image] = Auto(img);

%%
%进行PA分析,得到变换矩阵
[D Y,Tr] = procrustes(ControlPoints2D,traindata.ModelPoints2D);

%根据得到的变换去获取输入图像人脸的纹理数据，这里都是灰度值。
%get the input_image gray value
TS = traindata.averageShapeVector;
input_texture = getInputImageGray(input_image,Tr,TS);

%得到模型的灰度和梯度图
[model_gd, model_gray] = get_image_gradient(traindata);

%第一次迭代
alpha_star = first_itration();




%平均模型和特征向量都需要发生变换
alpha = ones(50,1)*0.02;
shapeModel = shapModel2D + reshape((alpha.*shapeVector)',64140,3);%初始化模型
shapeModel2D = [shapeModel(:,1) shapeModel(:,3)]; %投影矩阵
shapeModel2D_T=Tr.b*shapModel2D*Tr.T+[ones(64140,1)*Tr.c(1,1) ones(64140,1)*Tr.c(1,2)]; %变换后的投影矩阵
%得到对应点输入图像的灰度值






