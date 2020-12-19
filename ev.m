function [ni,outvt] = ev(avimg)%输入去平均矩阵，输出对角矩阵和特征向量
%求对角矩阵和特征向量
%   la:λ   avimg：平均矩阵    evt:特征向量
n = 6;
temvt = avimg' * avimg;
[y,x] = eig(temvt);%特征向量，特征值
temx = x;
ni = zeros(1,n);%放特征值最大的几个
%[l1,l2] = size(x);
for i = 1:n
    [ni(i),tem] = find(temx==max(max(temx)));%找出最大值的位置
    temx(find(temx==max(max(temx)))) = -1;
end
% for i = 2:n
%     outvt = cat(2,avimg*y(:,ni(i-1)),avimg*y(:,ni(i)));
% end
outvt = [avimg*y(:,ni(1)) avimg*y(:,ni(2)) avimg*y(:,ni(3)) avimg*y(:,ni(4)) avimg*y(:,ni(5)) avimg*y(:,ni(6))];
end

