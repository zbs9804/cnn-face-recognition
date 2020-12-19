function [outcb,outcr] = yuzhi(img)
%YUZHI 此处显示有关此函数的摘要
%   此处显示详细说明
%img = imread(path);
y = rgb2ycbcr(img);
y1 = y(:,:,2);
y2 = y(:,:,3);

outcb = mean(y1(:));
outcr = mean(y2(:));

end

