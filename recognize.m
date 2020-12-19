function accuracy=recognize(net,im)
res=vl_simplenn(net,im.data);
disp(res(end));
scores=squeeze(gather(res(end).x));
[bestScore,best]=max(scores);
accuracy=length(find(best==im.label))/length(im.label);