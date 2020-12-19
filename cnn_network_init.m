%ÉèÖÃÍøÂç½á¹¹
function net=cnn_network_init(nclass)
rng('default');
rng(0);
f=1/100;
net.layers={};
net.layers{end+1}=struct('type','conv','weights',{{f*randn(5,5,1,5,'single'),zeros(1,5,'single')}},'stride',1,'pad',0);
%In the first layer of convolution kernel, five 5 * 5 convolution kernels are used with step size of 1 and zero filling
 net.layers{end+1}=struct('type','relu');
 %The activation function is better with relu
 net.layers{end+1}=struct('type','pool','method','max','pool',[2 2],'stride',2,'pad',0);
 %The size of pooling layer is 2, the step size is 2, and the sampling mode is max
 net.layers{end+1}=struct('type','conv','weights',{{f*randn(12,12,1,nclass,'single'),zeros(1,nclass,'single')}},'stride',1,'pad',0);
 %Since the size of the input image is 32 * 32, after 5 * 5 convolution, the size becomes 28 * 28, and after 2 * 2 pooling, the size becomes 14 * 14. Similarly, at the last layer, the size of the feature map is 5 * 5
 net.layers{end+1}=struct('type','relu');
 net.layers{end+1}=struct('type','pool','method','max','pool',[2 2],'stride',2,'pad',0);
 net.layers{end+1}=struct('type','conv','weights',{{f*randn(5,5,1,nclass,'single'),zeros(1,nclass,'single')}},'stride',1,'pad',0);
 %The last layer is full connection layer, and the number of output types is nclass
% %net.layers{end+1}=struct('type','relu');
 net.layers{end+1}=struct('type','dropout','rate',0.5);
 %Using dropout function to avoid over fitting
net.layers{end+1}=struct('type','softmaxloss');%Output connected to softmaxloss
net.meta.inputSize=[28,28,1];
net.meta.trainOpts.learningRate=0.01;
net.meta.trainOpts.numEpochs=150;
net.meta.trainOpts.batchSize=64;
net=vl_simplenn_tidy(net);
