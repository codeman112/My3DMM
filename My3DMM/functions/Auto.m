function [inputControlPoints,im] = Auto(img)


[im,landmark_points,  landmark_names, img_width, img_height]=facepp_demo(img);

inputControlPoints=getControlPoints(landmark_points,  landmark_names, img_width, img_height);
%得到83个特征点
end
