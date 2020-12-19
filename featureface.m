close all;
clear all;
clc;
% % path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/Yale2/subject01_1.bmp';
% img = imread(path);
% img = im2double(img);%图像归一化
file_path = 'E:\matlab\bin\D2\Yale2/';% 图像文件夹路径 
img_path_list = dir(strcat(file_path,'*.bmp'));%获取该文件夹中所有bmp格式的图像
%img_num = length(img_path_list);%获取图像总数量
%if img_num > 0 %有满足条件的图像 
img = zeros(10000,90);
tem=zeros(10000,1);
for i = 1:15%读样本人数
    for j = 1:6 %逐一读取图像（某个人的样本数量）
        %num2str(i,'%02d')
        image_name = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'];% 图像名
        %image_name = [num2str(i,'%d'),'.bmp'];
        tem_img = imread(strcat(file_path,image_name));
        %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名    
        %tem_img = im2double(tem_img);
        %tem_img =  (double(tem_img) - double(min(min(tem_img)))) / (double(max(max(tem_img)))-double(min(min(tem_img))));
        tem_img = tem_img';
        n=1
        for o=1:100
            for p=1:100
                tem(n,1)=tem_img(o,p);
                n=n+1;
            end
        end
        img(:,i) = tem; 
    end
end

[A,avt] = fuse(img);
[x,y] = ev(A);%y是特征向量，important
feature = y'*A;

%特征脸可视化
for o = 1:6 %6个特征向量
    img1 = y(:,o);
    img1 = reshape(uint8(img1),100,100);
    subplot(2,3,o)
    imshow(img1);%显示特征脸
end

counter = 0;

%有用的
for m = 1:15%读样本人数
    for k = 7:11 %逐一读取图像（某个人的样本数量）
        %num2str(m,'%02d')
        test_name = ['subject',num2str(m,'%02d'),'_',num2str(k),'.bmp'];% 图像名
        test_tem_img = imread(strcat(file_path,test_name));
        %res = distance(test_feature,feature);
        test_img = zeros(10000,1);
        n = 1;
        for i = 1:100
            for j = 1:100
                test_img(n,1) = test_tem_img(i,j);
                test_img(n,1) = test_img(n,1) - avt(n,1);%测试集减平均脸
                n = n+1;
            end
        end
        test_feature = y' * test_img;
       % imshow(test_feature)
        res = distance(test_feature,feature);
        if res == m
            counter = counter + 1;
        end
    end
end

counter
% p = zeros(100,100);
% 
% for i = 1:100
%     for j = 1:100
%         p(i,j) = y((i-1)*100+j,1);
%     end
% end
% figure(1);
% p = uint8(p);
% imshow(p);%显示特征脸



% test_path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/test/22.bmp';
% test_tem_img = imread(test_path);
% imshow(test_tem_img);
% test_img = zeros(10000,1);
% n = 1;
% for i = 1:100
%     for j = 1:100
%         test_img(n,1) = test_tem_img(i,j);
%         test_img(n,1) = test_img(n,1) - avt(n,1);%测试集减平均脸
%         n = n+1;
%     end
% end
% test_feature = y'*test_img;
% %imshow(test_feature)
% res = distance(test_feature,feature);%6x1,6x90
% res
% count = 0;
% 
% filepath = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/train/'
% figure(2)
% subplot(1,2,1)
% imshow(test_path);
% title('test');
% test_path
% %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名
% subplot(1,2,2)
% %test_path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/train/';
% pre_name = [num2str(res,'%d'),'.bmp'];
% %image_name = ['subject',num2str((floor(res/15)+1),'%02d'),'_',num2str(rem(res,11)),'.bmp'];
% pre_test = strcat(filepath,pre_name);
% imshow(pre_test);
% title('原图');
% pre_test

% a =  test_feature;
% b = feature;
% d=+inf;
% flag=0;
% for i=1:6
%     tmp = b(:,i);
%     td=sqrt(sum((a-tmp).^2));
%     if td < d
%         d = td;
%         flag=i;
%     end
% end
% r = flag;
% r
%A = uint8(A);
% AVG = zeros(100,100);
% for i=1:100
%     for j=1:100
%         AVG(i,j)=A(i*j,1);
%     end
% end
%imshow(AVG);
%[x,y] = ev(img);%求特征值x和特征向量y

% temx = x;
% xi = zeros(1,6);
% for i = 1:6
%     xi(i) = find(temx==max(max(temx)));%找出最大值的位置
%     temx(find(temx==max(max(temx)))) = -1;
% end
% outvt = [y(:,sqrt(xi(1))),y(:,sqrt(xi(2))),y(:,sqrt(xi(3))),y(:,sqrt(xi(4))),y(:,sqrt(xi(5))),y(:,sqrt(xi(6)))];
