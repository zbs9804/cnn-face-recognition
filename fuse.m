%������ȡͼƬ
function [A,avt] = fuse(bigimg)
% clc;
% % path1 = 'C:/Users/shifa/Desktop/01.jpg';
% % path2 = 'C:/Users/shifa/Desktop/02.jpg';
% % path3 = 'C:/Users/shifa/Desktop/03.jpg';
% file_path = 'E:\matlab\bin\D1\';% ͼ���ļ���·�� ?
% img_path_list = dir(strcat(file_path,'*.bmp'));%��ȡ���ļ���������bmp��ʽ��ͼ�� ?
% img_num = length(img_path_list);%��ȡͼ��������?
% I=cell(1,img_num);
% n=1;
% BIG=zeros(10000,0);
 AVG=zeros(100,100);
% %   image_name = img_path_list(9).name;% ͼ����
% %         image = imread(strcat(file_path,image_name));
% %         imshow(image);
% if img_num > 0 %������������ͼ�� 
%     for j = 1:img_num %��һ��ȡͼ��
%         image_name = img_path_list(j).name;% ͼ����
%         image = imread(strcat(file_path,image_name));
%         %I{j}=image;
%         fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ���� ?
%         BIG=[BIG,yuzhi(image)];
%       % [temcb,temcr] = yuzhi(image);
%        %tem1 = tem1 + temcb;
%         %tem2 = tem2 + temcr;
%         %����ֱ�ӿ��Է���ϸ��Ԫ���ݵķ�ʽ��������
%     end
% end
av = mean(bigimg');
n = 1;
for i=1:100%AVG��ƽ��ֵ����
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
        A(i,j)=bigimg(i,j)-av(i);%A����������ȥ�Լ���ƽ��ֵ
    end
end
end