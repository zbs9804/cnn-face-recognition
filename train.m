run(fullfile('D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\matconvnet-1.0-beta25\matconvnet-1.0-beta25\matlab\vl_setupnn.m')) ; 
opts=init_parameters();
imdb=load_data(opts);
net=cnn_network_init(opts.nclass);
net.meta.normalization.averageImage=imdb.images.data_mean;
trainfn=@cnn_train;
[net,info]=trainfn(net,imdb,getBatch(),'expDir',opts.expDir,'val',find(imdb.images.set==3),'numEpochs',100);