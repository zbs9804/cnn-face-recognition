function [single_im] = get_single_data(opts)
test_path = 'E:\matlab\bin\mycnn\Yale2\' ;
imdb = load(fullfile(opts.basePath,'imdb.mat'));
single_im = [ ];
tem = 1; 
for i = 1:15
    for j = 9:10
         image_name2 = ['subject',num2str(i,'%02d'),'_',num2str(j),'.bmp'] ;% È¡ÑµÁ·¼¯Í¼Æ¬
         img_tem = imread(strcat(test_path,image_name2)) ;
            img_tem = imresize(img_tem,[28 28]) ;
            imdb.images.data(:,:,1,tem) = img_tem;
            single_im(:,:,1,tem) = img_tem;
            single_im(1,tem) = i ;
            tem = tem + 1;
    end
end

for i = 1:30
    single_im(:,:,1,i) = single_im(:,:,1,i) - imdb.imdb.images.data_mean(:,:);
end
single_im = single(single_im) ;

end

