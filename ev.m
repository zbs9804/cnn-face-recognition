function [ni,outvt] = ev(avimg)%����ȥƽ����������ԽǾ������������
%��ԽǾ������������
%   la:��   avimg��ƽ������    evt:��������
n = 6;
temvt = avimg' * avimg;
[y,x] = eig(temvt);%��������������ֵ
temx = x;
ni = zeros(1,n);%������ֵ���ļ���
%[l1,l2] = size(x);
for i = 1:n
    [ni(i),tem] = find(temx==max(max(temx)));%�ҳ����ֵ��λ��
    temx(find(temx==max(max(temx)))) = -1;
end
% for i = 2:n
%     outvt = cat(2,avimg*y(:,ni(i-1)),avimg*y(:,ni(i)));
% end
outvt = [avimg*y(:,ni(1)) avimg*y(:,ni(2)) avimg*y(:,ni(3)) avimg*y(:,ni(4)) avimg*y(:,ni(5)) avimg*y(:,ni(6))];
end

