function [imdb] = load_data(opts)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% img_list = dir(strcat(file_path1,'*.bmp')) ;%��ȡ����bmp�ļ�
% imdb.images = [ ] ;
file_path1 = 'E:\matlab\bin\D3\Yale2\' ; %�õڶ������ݼ� ORL ����
tem = 1 ;
for i = 1:15
    for j = 1:9
        if j < 7
            image_name1 = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'] ;% ȡѵ����ͼƬ
            img_tem = imread(strcat(file_path1,image_name1)) ;
            img_tem = imresize(img_tem,[28 28]) ;
            imdb.images.data(:,:,1,tem) = img_tem;
            imdb.images.labels(1,tem) = i ;
            imdb.images.set(tem) = 1 ;%ѵ����
            tem = tem + 1;
        end
        if j < 10 && j > 7
            image_name1 = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'] ;% ȡ��֤��ͼƬ
            img_tem = imread(strcat(file_path1,image_name1)) ;
            img_tem = imresize(img_tem,[28 28]) ;
            imdb.images.data(:,:,1,tem) = img_tem;
            imdb.images.labels(1,tem) = i ;
            imdb.images.set(tem) = 2 ;%��֤��
            tem = tem + 1;
        end
    end
end
index = find(imdb.images.set == 1);
imdb.images.data = single(imdb.images.data);
sum = single(zeros(28,28));
for i = 1:90
            sum(:,:) = sum(:,:) + imdb.images.data(:,:,1,index(i));
end
imdb.images.data_mean = single(sum./90);
for i = 1:120
    imdb.images.data(:,:,1,i) = imdb.images.data(:,:,1,i) - imdb.images.data_mean(:,:);
end

save('imdb','imdb') ;%����imdb

end

