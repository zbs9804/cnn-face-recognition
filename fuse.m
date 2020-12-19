%批量读取图片
function [A,avt] = fuse(bigimg)
% clc;
% % path1 = 'C:/Users/shifa/Desktop/01.jpg';
% % path2 = 'C:/Users/shifa/Desktop/02.jpg';
% % path3 = 'C:/Users/shifa/Desktop/03.jpg';
% file_path = 'E:\matlab\bin\D1\';% 图像文件夹路径 ?
% img_path_list = dir(strcat(file_path,'*.bmp'));%获取该文件夹中所有bmp格式的图像 ?
% img_num = length(img_path_list);%获取图像总数量?
% I=cell(1,img_num);
% n=1;
% BIG=zeros(10000,0);
 AVG=zeros(100,100);
% %   image_name = img_path_list(9).name;% 图像名
% %         image = imread(strcat(file_path,image_name));
% %         imshow(image);
% if img_num > 0 %有满足条件的图像 
%     for j = 1:img_num %逐一读取图像
%         image_name = img_path_list(j).name;% 图像名
%         image = imread(strcat(file_path,image_name));
%         %I{j}=image;
%         fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名 ?
%         BIG=[BIG,yuzhi(image)];
%       % [temcb,temcr] = yuzhi(image);
%        %tem1 = tem1 + temcb;
%         %tem2 = tem2 + temcr;
%         %这里直接可以访问细胞元数据的方式访问数据
%     end
% end
av = mean(bigimg');
n = 1;
for i=1:100%AVG是平均值矩阵
    for j=1:100
        AVG(i,j)=av(n);
        n=n+1;
    end
end
avt=av';
%imshow(AVG',[]);
A=zeros(10000,90);
for i=1:10000
    for j=1:90
        A(i,j)=bigimg(i,j)-av(i);%A是输入矩阵减去自己的平均值
    end
end
end