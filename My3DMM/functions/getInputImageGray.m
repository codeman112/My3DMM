function input_texture = getInputImageGray(input_img,Tr,averageShapeVector)
%��ȡ����ͼ���Ӧ������������ֵ
%����Ķ����ڶ�ά�Ͻ��м����
%
%�ж�ͼ���Ƿ�Ϊ�Ҷ�ͼ
if size(input_img, 3) == 3
    input_img = double(rgb2gray(input_img));
else
    input_img = double(input_img);
end
[width height] = size(input_img);


%�õ��任���ƽ������
TS = averageShapeVector;
averageShapeTr = [TS(:,1) TS(:,3)];
averageShapeTr = Tr.b * averageShapeTr * Tr.T + [ones(64140,1) * Tr.c(1,1) ones(64140,1) * Tr.c(1,2)]; 
averageShapeTr = round(averageShapeTr);
input_texture = zeros(64140,1);
z_buffer_map = zeros(width,height);
for index = 1:64140
%     if index >= 32070
%         index = 96210 - index;
%     end
    if(averageShapeTr(index,1) <= 1) 
        averageShapeTr(index,1) = 2; end
    if(averageShapeTr(index,1) >= height)
        averageShapeTr(index,1) = height - 1;end;
    if(averageShapeTr(index,2) <= 1)
         averageShapeTr(index,2) = 2;end
    if(averageShapeTr(index,2) >= width)
         averageShapeTr(index,2) = width - 1;end
     z_buffer_map(height-averageShapeTr(index,1) + 1,averageShapeTr(index,2)) = z_buffer_map(height-averageShapeTr(index,1)+1,averageShapeTr(index,2))+1;   
     if(z_buffer_map(height-averageShapeTr(index,1) + 1,averageShapeTr(index,2)) > 2)  
          input_texture(index,1) = (input_img(height-averageShapeTr(index,1) + 1,averageShapeTr(index,2),:)+input_img(height-averageShapeTr(index,1)+2,averageShapeTr(index,2),:))/2;  
     else
          input_texture(index,1) = input_img(height-averageShapeTr(index,1) + 1,averageShapeTr(index,2),:);
     end
end



