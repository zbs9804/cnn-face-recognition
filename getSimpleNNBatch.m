function [images,labels]=getSimpleNNBatch(imdb,batch)
images=imdb.images.data(:,:,:,batch);
labels=imdb.images.label(1,batch);