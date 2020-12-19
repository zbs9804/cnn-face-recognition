close all;
clear all;
clc;
% % path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/Yale2/subject01_1.bmp';
% img = imread(path);
% img = im2double(img);%ͼ���һ��
file_path = 'E:\matlab\bin\D2\Yale2/';% ͼ���ļ���·�� 
img_path_list = dir(strcat(file_path,'*.bmp'));%��ȡ���ļ���������bmp��ʽ��ͼ��
%img_num = length(img_path_list);%��ȡͼ��������
%if img_num > 0 %������������ͼ�� 
img = zeros(10000,90);
tem=zeros(10000,1);
for i = 1:15%����������
    for j = 1:6 %��һ��ȡͼ��ĳ���˵�����������
        %num2str(i,'%02d')
        image_name = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'];% ͼ����
        %image_name = [num2str(i,'%d'),'.bmp'];
        tem_img = imread(strcat(file_path,image_name));
        %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����    
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
[x,y] = ev(A);%y������������important
feature = y'*A;

%���������ӻ�
for o = 1:6 %6����������
    img1 = y(:,o);
    img1 = reshape(uint8(img1),100,100);
    subplot(2,3,o)
    imshow(img1);%��ʾ������
end

counter = 0;

%���õ�
for m = 1:15%����������
    for k = 7:11 %��һ��ȡͼ��ĳ���˵�����������
        %num2str(m,'%02d')
        test_name = ['subject',num2str(m,'%02d'),'_',num2str(k),'.bmp'];% ͼ����
        test_tem_img = imread(strcat(file_path,test_name));
        %res = distance(test_feature,feature);
        test_img = zeros(10000,1);
        n = 1;
        for i = 1:100
            for j = 1:100
                test_img(n,1) = test_tem_img(i,j);
                test_img(n,1) = test_img(n,1) - avt(n,1);%���Լ���ƽ����
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
% imshow(p);%��ʾ������



% test_path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/test/22.bmp';
% test_tem_img = imread(test_path);
% imshow(test_tem_img);
% test_img = zeros(10000,1);
% n = 1;
% for i = 1:100
%     for j = 1:100
%         test_img(n,1) = test_tem_img(i,j);
%         test_img(n,1) = test_img(n,1) - avt(n,1);%���Լ���ƽ����
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
% %fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����
% subplot(1,2,2)
% %test_path = 'C:/Users/shifa/Desktop/zhongkeyuan/D2/train/';
% pre_name = [num2str(res,'%d'),'.bmp'];
% %image_name = ['subject',num2str((floor(res/15)+1),'%02d'),'_',num2str(rem(res,11)),'.bmp'];
% pre_test = strcat(filepath,pre_name);
% imshow(pre_test);
% title('ԭͼ');
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
%[x,y] = ev(img);%������ֵx����������y

% temx = x;
% xi = zeros(1,6);
% for i = 1:6
%     xi(i) = find(temx==max(max(temx)));%�ҳ����ֵ��λ��
%     temx(find(temx==max(max(temx)))) = -1;
% end
% outvt = [y(:,sqrt(xi(1))),y(:,sqrt(xi(2))),y(:,sqrt(xi(3))),y(:,sqrt(xi(4))),y(:,sqrt(xi(5))),y(:,sqrt(xi(6)))];
