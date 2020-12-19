%这里是前向传播

%-------------------------------------------------------------------------------------------------------------------
%初始化
%-------------------------------------------------------------------------------------------------------------------
run(fullfile('D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\matconvnet-1.0-beta25\matconvnet-1.0-beta25\matlab\vl_setupnn.m')) ; 
opts = init_parameters( );%初始化
imdb = load_data(opts);%读数据
 
net = cnn_network_init(opts.nclass);
net.meta.normalization.averageImage = imdb.images.data_mean ;%存图像均值


%-------------------------------------------------------------------------------------------------------------------
%训练过程
%-------------------------------------------------------------------------------------------------------------------
trainfn = @cnn_train ;
[net, info] = trainfn(net, imdb, getBatch(),  ...
'expDir', opts.expDir, ...
  'val', find(imdb.images.set == 2),'numEpochs',150) ;


                            


