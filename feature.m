%输入特征脸，返回特征脸
function K=feature(img)
for k=1:6
    n=1;
    for i=1:100
        for j=1:100
            K(i,j,k)=img(n+1);
        end
    end
end