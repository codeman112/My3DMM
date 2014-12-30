function [model_gd, model_gray]= get_image_gradient(options)
%this function is used to compute the image gradient
%input:image
%output:gradient
%ֻ�Ƕ���άͼ������ݶ�
%��άͼ����Ҫչ���������ʾ
height = 300;  %ת�����ͼ��ĸ߶�
width = 300;   %ת�����ͼ����
phi = 1000;
% averageShapeVectorstruct = load('f:\project\Database\Formerdata\Match_Version3.0\data\averageShapeVector.mat','averageShapeVector');
% averageTextureVectorstruct = load('f:\project\Database\Formerdata\Match_Version3.0\data\averageTextureVector.mat');
averageShapeVector = options.averageShapeVector;
averageTextureVector = options.averageTextureVector;
[row col] = size(averageShapeVector);
heightCy = zeros(row,1);
heightCy = averageShapeVector(:,3);
thetaCy = zeros(row,1);

for i = 1:row
    thetaCy(i,1) = atan2(averageShapeVector(i,1),averageShapeVector(i,2));   
end
max_heightCy = max(heightCy);
min_heightCy = min(heightCy);
max_theta = max(thetaCy);
min_theta = min(thetaCy);

heightCy = heightCy - min_heightCy;  %��ͼ�����ƽ��
thetaCy = (thetaCy - min_theta).*phi;

diff_heightCy = max_heightCy - min_heightCy;
diff_theta = (max_theta - min_theta)*phi;

unitTheta = width/diff_theta;
unitHeight = height/diff_heightCy;

Y = round(thetaCy.*unitTheta+1);   %��һ����ͼ��
X = round(height-heightCy.*unitHeight+1); %ͼ��ת

image = imread('map.png');
for i = 1:row
    image(X(i,1),Y(i,1),1) = averageTextureVector(i,1); 
    image(X(i,1),Y(i,1),2) = averageTextureVector(i,2); 
    image(X(i,1),Y(i,1),3) = averageTextureVector(i,3); 
end

for i=3:297
     for j=3:297
         zz=image(i,j,1)||image(i,j,2)||image(i,j,3);
         if(zz==0)
             image(i,j,1)=image(i,j+1,1); 
             image(i,j,2)=image(i,j+1,2);
             image(i,j,3)=image(i,j+1,3);
         end
     end
end
for i=3:297
     for j=3:297
         zz=image(i,j,1)||image(i,j,2)||image(i,j,3);
         if(zz==0)
             image(i,j,1)=image(i+1,j,1); 
             image(i,j,2)=image(i+1,j,2);
             image(i,j,3)=image(i+1,j,3);
         end
     end
end
image_gray = double(rgb2gray(image));
[model_gdx,model_gdy] = gradient(double(image_gray));
model_gd_image = abs(model_gdx) + abs(model_gdy);
model_gd = zeros(row,1);
for i=1:row 
    model_gd(i,1) = model_gd_image(X(i,1),Y(i,1));
end

%��������ͼ��ĻҶ�
TF = [0.299; 0.587; 0.114];
model_gray = double(options.averageTextureVector * TF);




%����








% [input_gdx,input_gdy] = gradient(double(input_img));
% [model_gdx,model_gdy] = gradient(double(model_img));
% 
% input_gd = abs(input_gdx)+abs(input_gdy);
% model_gd = abs(model_gdx)+abs(model_gdy);



