path_test = 'D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\D1\dht.jpg';
ptest = imread(path_test);%ԭͼ
temtest = ptest;%ʶ���1
temtest2 = ptest;%ʶ���2
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
 temtest;%��ֵ����
% rectangle(1,2,3,4);
% Dilation
se=strel('square',3);%3��3�����ڴִ���
    im_Region=imopen(temtest,se);%�����㣨�����ͺ�ʴ��
    im_Region=imclose(im_Region,se);%�����㣨�ȸ�ʴ�����ͣ�
    im_Region=imfill(im_Region,'holes');%�
se1=strel('square',8);%8��8�����ھ�����
    im_Region=imerode(im_Region,se1);%��ʴ
    im_Region=imdilate(im_Region,se1);%����
    
imgr = rgb2gray(im_Region);

% [L,num] = bwlabel(imgr,8);
% STATS = regionprops(L,'BoundingBox');
 [im_Face,num]=bwlabel(imgr,8);%��ȡ����4��ͨ����
% %�ӵ�һ����ͨ����ʼ�жϸ������Ƿ�Ϊ����Ƥ��
% for i=1:num
%     [r,c]=find(im_Face==i);%��i����ͨ����
%     len=max(r)-min(r)+1;%��ͨ���򳤶�
%     wid=max(c)-min(c)+1;%��ͨ������
%     area_sq=len*wid;%��ͨ�������
%     area=size(r,1);%��ͨ�������ص����
%     %��ʼ�ж�
%     for j=1:size(r,1)
%         if (len/wid<0.6)|(len/wid>2.4)|area/area_sq<0.65
%             im_Face(r(j),c(j))=0;%����������Ƥ�������ص�Ϳ��
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

wid = c_max-c_min;%��
len = r_max-r_min;%��
len = wid * (1/0.8);
%��ʾ��ѡ�������ͼ��
figure(2)
subplot(2,2,4);
imshow(ptest);%���Ͻ�ͼƬ
title('���ڷ�ɫ���������');
rectangle('Position',[c_min r_min wid len],'EdgeColor','r');
subplot(2,2,1);
imshow(ptest);%���½�ͼƬ
subplot(2,2,2);
imshow(temtest);%���Ͻ�ͼƬ
subplot(2,2,3);
imshow(im_Face);%���½�ͼƬ 
% figure(1)
% imshow(im_Face);
% title('1');
% figure(2);
% imshow(imgr);
% figure(3)
% subplot(1,2,1)
% imshow(ptest);
% title('ԭͼ��');
% subplot(1,2,2)
% imshow(temtest2);