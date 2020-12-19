path_test = 'D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\D1\dht.jpg';
ptest = imread(path_test);%原图
temtest = ptest;%识别后1
temtest2 = ptest;%识别后2
t = rgb2ycbcr(ptest);
tem = t;
tcb = tem(:,:,2);
tcr = tem(:,:,3);
[l,r] = size(tcb);
[yu_cb,yu_cr]=yuzhi(ptest);
for i = 1:l
    for j = 1:r
        if tcb(i,j)<(yu_cb-20) || tcb(i,j)>(yu_cb+20)
            temtest(i,j,:) = 0;
            temtest2(i,j,:) = 0;
        else
            temtest(i,j,:) = 255;
        end
        if tcr(i,j)>(yu_cr-20) && tcr(i,j)<(yu_cr+20)
            temtest(i,j,:) = 0;
            temtest2(i,j,:) = 0;
        else 
            temtest(i,j,:) = 255;
        end
    end
end
% 
 temtest;%二值化后
% rectangle(1,2,3,4);
% Dilation
se=strel('square',3);%3×3方阵内粗处理
    im_Region=imopen(temtest,se);%开运算（先膨胀后腐蚀）
    im_Region=imclose(im_Region,se);%闭运算（先腐蚀后膨胀）
    im_Region=imfill(im_Region,'holes');%填洞
se1=strel('square',8);%8×8方阵内精处理
    im_Region=imerode(im_Region,se1);%腐蚀
    im_Region=imdilate(im_Region,se1);%膨胀
    
imgr = rgb2gray(im_Region);

% [L,num] = bwlabel(imgr,8);
% STATS = regionprops(L,'BoundingBox');
 [im_Face,num]=bwlabel(imgr,8);%获取所有4连通区域
% %从第一个连通区域开始判断该区域是否为脸部皮肤
% for i=1:num
%     [r,c]=find(im_Face==i);%第i个连通区域
%     len=max(r)-min(r)+1;%连通区域长度
%     wid=max(c)-min(c)+1;%连通区域宽度
%     area_sq=len*wid;%连通区域面积
%     area=size(r,1);%连通区域像素点个数
%     %开始判断
%     for j=1:size(r,1)
%         if (len/wid<0.6)|(len/wid>2.4)|area/area_sq<0.65
%             im_Face(r(j),c(j))=0;%将不是人脸皮肤的像素点涂黑
%         else
%             continue;
%         end
%     end
% end

[r c]=find(im_Face~=0);
r_min=min(r);
r_max=max(r);
c_min=min(c);
c_max=max(c);

wid = c_max-c_min;%宽
len = r_max-r_min;%长
len = wid * (1/0.8);
%显示框选人脸后的图像
figure(2)
subplot(2,2,4);
imshow(ptest);%左上角图片
title('基于肤色的人脸检测');
rectangle('Position',[c_min r_min wid len],'EdgeColor','r');
subplot(2,2,1);
imshow(ptest);%右下角图片
subplot(2,2,2);
imshow(temtest);%右上角图片
subplot(2,2,3);
imshow(im_Face);%左下角图片 
% figure(1)
% imshow(im_Face);
% title('1');
% figure(2);
% imshow(imgr);
% figure(3)
% subplot(1,2,1)
% imshow(ptest);
% title('原图像');
% subplot(1,2,2)
% imshow(temtest2);