function [outcb,outcr] = yuzhi(img)
%YUZHI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%img = imread(path);
y = rgb2ycbcr(img);
y1 = y(:,:,2);
y2 = y(:,:,3);

outcb = mean(y1(:));
outcr = mean(y2(:));

end

