function [single_im,imdb] = get_single_data(opts)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
test_path = 'E:\matlab\bin\D3\Yale2\' ;
imdb = load(fullfile(opts.basePath,'imdb.mat'));
test_list = dir(strcat(test_path,'*.bmp')) ;

single_im = [ ];
tem = 1; 
for i = 1:15
    for j=11
         image_name2 = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'] ;% 取训练集图片
            img_tem = imread(strcat(test_path,image_name2)) ;
            img_tem = imresize(img_tem,[28 28]) ;
            single_im(:,:,1,tem) = img_tem;
            single_im(1,tem) = i ;
            tem = tem + 1;
    end
end

for i = 1:15
    single_im(:,:,1,i) = single_im(:,:,1,i) - imdb.imdb.images.data_mean(:,:);
end
single_im = single(single_im) ;

end

