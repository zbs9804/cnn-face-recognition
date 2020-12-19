function [images,labels] = getSimpleNNBatch(imdb,batch)
    images = imdb.images.data(:,:,:,batch);
    labels = imdb.images.labels(1,batch);
%获取图片和对应标签
end