%读数据到imdb
function imdb=load_data(opts)
sum=single(zeros(28,28));
sett=1;
for i=1:15
    for j=1:10
        image_name1=['subject',num2str(i,'%02d'),'_',num2str(j,'%d'),'.bmp'];
        img_tem = imread(strcat('E:\matlab\bin\mycnn\Yale2\',image_name1)) ;
        img_tem = imresize(img_tem,[28 28]) ;
        imdb.images.data(:,:,1,sett) = img_tem;
        if j<7
        imdb.images.label(1,sett)=i;%属于哪张人脸
        imdb.images.set(sett)=1;
        end
        if j==7||j==8
            imdb.images.label(1,sett)=i;
            imdb.images.set(sett)=2;
        end
        if j==9||j==10
            imdb.images.label(1,sett)=i;
            imdb.images.set(sett)=3;
        end
        sett=sett+1;%训练集标识
    end
end
imdb.images.data=single(imdb.images.data);%
for i=1:90
    sum(:,:)=sum(:,:)+imdb.images.data(:,:,1,i);%求和
end
imdb.images.data_mean=single(sum./90);%取平均
for i=1:150
imdb.images.data(:,:,1,i)=imdb.images.data(:,:,1,i)-imdb.images.data_mean;%减平均
end
save('imdb','imdb');