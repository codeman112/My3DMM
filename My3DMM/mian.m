
clc;
clear;
addpath functions
addpath functions/face++


%%
%�������
where = '.';
folder = 'traindata';
load([where '/' folder '/traindata.mat']);

%%
%�õ�����ͼ���������
img = 'test_1.bmp';
[ControlPoints2D,input_image] = Auto(img);

%%
%����PA����,�õ��任����
[D Y,Tr] = procrustes(ControlPoints2D,traindata.ModelPoints2D);

%���ݵõ��ı任ȥ��ȡ����ͼ���������������ݣ����ﶼ�ǻҶ�ֵ��
%get the input_image gray value
TS = traindata.averageShapeVector;
input_texture = getInputImageGray(input_image,Tr,TS);

%�õ�ģ�͵ĻҶȺ��ݶ�ͼ
[model_gd, model_gray] = get_image_gradient(traindata);

%��һ�ε���
alpha_star = first_itration();




%ƽ��ģ�ͺ�������������Ҫ�����任
alpha = ones(50,1)*0.02;
shapeModel = shapModel2D + reshape((alpha.*shapeVector)',64140,3);%��ʼ��ģ��
shapeModel2D = [shapeModel(:,1) shapeModel(:,3)]; %ͶӰ����
shapeModel2D_T=Tr.b*shapModel2D*Tr.T+[ones(64140,1)*Tr.c(1,1) ones(64140,1)*Tr.c(1,2)]; %�任���ͶӰ����
%�õ���Ӧ������ͼ��ĻҶ�ֵ






