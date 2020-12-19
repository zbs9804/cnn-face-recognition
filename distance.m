function [r] = distance(a,b)
%UNTITLED Summary of this function goes here
%«Û≈∑ œæ‡¿Î
d=+inf;
flag=0;
for i=1:90
    tmp = b(:,i);
    td=norm(a-tmp);
    if td < d
        d = td;
        flag=i;
    end
end
if rem(flag,6)==0
    r=flag/6;
else
    r=floor((flag-1)/6)+1;
end
