function net=load_network(opts)
net=load(fullfile(opts.modelDir,opts.modelName));
net=net.net;
net.layers{end}.type='softmax';
