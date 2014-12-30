function [result] = gradient_2D_to_3D(ControlPoints2D,ModelPoint2D)
% get the transformation matrix
%得到转换矩阵
%
[D Y,Tr]=procrustes(ControlPoints2D,ModelPoint2D);
R=[1 0;0 0;0 1];
result=Tr.b.*R.*Tr.T;%返回一个3*2的矩阵，这里需要转置一下
result=result';
