function [ ControlPoints2D ] = getControlPoints(landmark_points,  landmark_names, img_width, img_height)
%GETCONTROLPOINTS Summary of this function goes here
%   Detailed explanation goes here
% a(1)=38; a(2)=47; a(3)=65; a(4)=22; a(5)=26; a(6)=68; a(7)=72; a(8)=2; a(9)=4; a(10)=7;
% a(11)=9; a(12)=1; a(13)=19; a(14)=16; a(15)=13; a(16)=11;
% 
% 
% for k=1:16
%     t=getfield(landmark_points,landmark_names{a(k)});
%          %=======repair side face=====
%      if(k==12)
%            t.y=t.y-2.3;
%      end
%     if(k>=9&&k<=11)t.x=t.x+1.2;end
%      if(k>=13&&k<=15)t.x=t.x-1.2;  end 
%     %=======================
%     ControlPoints2D(k,1)=t.x*img_width/100;
%     ControlPoints2D(k,2)=t.y*img_height/100;
% end



%得到83个人脸特征点
for k=1:83
    t=getfield(landmark_points,landmark_names{k});
         %=======repair side face=====
     if(k==1)
           t.y=t.y-2.3;
     end
    if(k>=4&&k<=9)t.x=t.x+1.2;end
     if(k>=13&&k<=19)t.x=t.x-1.2;  end 
    %=======================
    ControlPoints2D(k,1)=t.x*img_width/100;
    ControlPoints2D(k,2)=t.y*img_height/100;

end
% 



end

