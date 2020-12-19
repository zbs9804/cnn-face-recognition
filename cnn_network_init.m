%…Ë÷√Õ¯¬ÁΩ·ππ
function net=cnn_network_init(nclass)
rng('default');
rng(0);
f=1/100;
net.layers={};
net.layers{end+1}=struct('type','conv','weights',{{f*randn(5,5,1,5,'single'),zeros(1,5,'single')}},'stride',1,'pad',0);
 net.layers{end+1}=struct('type','relu');
 net.layers{end+1}=struct('type','pool','method','max','pool',[2 2],'stride',2,'pad',0);
 net.layers{end+1}=struct('type','conv','weights',{{f*randn(12,12,1,nclass,'single'),zeros(1,nclass,'single')}},'stride',1,'pad',0);
 net.layers{end+1}=struct('type','relu');
 net.layers{end+1}=struct('type','pool','method','max','pool',[2 2],'stride',2,'pad',0);
 net.layers{end+1}=struct('type','conv','weights',{{f*randn(5,5,1,nclass,'single'),zeros(1,nclass,'single')}},'stride',1,'pad',0);
% %net.layers{end+1}=struct('type','relu');
 net.layers{end+1}=struct('type','dropout','rate',0.5);
net.layers{end+1}=struct('type','softmaxloss');
net.meta.inputSize=[28,28,1];
net.meta.trainOpts.learningRate=0.01;
net.meta.trainOpts.numEpochs=150;
net.meta.trainOpts.batchSize=64;
net=vl_simplenn_tidy(net);