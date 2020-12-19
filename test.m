run(fullfile('D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\matconvnet-1.0-beta25\matconvnet-1.0-beta25\matlab\vl_setupnn.m')) ;  
opts=init_parameters();
single_im=get_single_data(opts);
%imdb=load(fullfile(opts.basePath,'imdb.mat'));
net=load_network(opts);
accuracy=recognize(net,imdb.images);