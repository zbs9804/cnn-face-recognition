%����ͼ��
opts = init_parameters();
single_im = get_single_data(opts);
run(fullfile('D:\WeChat Files\zzz15911721117\FileStorage\File\2019-07\matconvnet-1.0-beta25\matconvnet-1.0-beta25\matlab\vl_setupnn.m')) ;  


%ʹ������ģ��
net = load_network(opts);

acc = recognize(net,imdb.images);