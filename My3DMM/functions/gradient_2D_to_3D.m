function [result] = gradient_2D_to_3D(ControlPoints2D,ModelPoint2D)
% get the transformation matrix
%�õ�ת������
%
[D Y,Tr]=procrustes(ControlPoints2D,ModelPoint2D);
R=[1 0;0 0;0 1];
result=Tr.b.*R.*Tr.T;%����һ��3*2�ľ���������Ҫת��һ��
result=result';
