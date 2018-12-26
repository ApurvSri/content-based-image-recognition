PATH=strcat('F:\data\images2');  %path of images folder
%PATH=strcat('D:\pics\Dp');

fileFolder1 = fullfile(PATH); %..... PLEASE CHANGE LOCATION ACCORDING TO LOCATION OF TEST IMAGES .....%
    dirgray1 = dir(fullfile(fileFolder1,'*.jpg')); %..... IMAGE NAMES MUST BE IN THE SERIES LIKE batc1.jpg,batc2.JPG AND SO ON .....%
    fileNames1 = {dirgray1.name}';
    input1=cell(1,length(fileNames1));
    for i=1:length(fileNames1) 
        input1{i}=strcat(fileFolder1,'\',fileNames1{i});         
    end
    
%    address='F:\nitin-upes\lbp-feature';  % address where you save your LBP feature .csv files
   % mkdir(address);
   LBPftr=[];LBPftr12=[];
   OriginalImage=[];
     for i=1:length(fileNames1)
           imname=strsplit(fileNames1{i},'.');
           tr1 = imread(input1{i});
          % gr=rgb2gray(tr1);
          %imshow(gr);
          %tr1=imcrop(tr);
          %IM2 = imresize(rgb2gray(double(tr1)),[150,150]);
          IM3 = imresize((double(tr1)),[150,150]);
          %OriginalImage=[OriginalImage;IM3];
          IMDataSet = (IM3);
          %LBPftr=LBPN(IM2);
          LBPftr = LBPN(IMDataSet);
          LBPftr1=LBPftr(:);
          LBPftr1=LBPftr1';
          LBPftr2=[LBPftr1 i];
          LBPftr12=[LBPftr12; LBPftr2];
         
          %ImgVector = LBPftr(:);
          %fname=strcat(address,'\',imname{1},'.csv');
          %csvwrite(fname,ImgVector);
          
     end
 %save('LBPftr');
 
     I2=imread('F:\data\images2\6.jpg');
     %I2=imread('D:\pics\Dp\A.jpg');      
     %figure;imshow(I);title('Original Image');
    LBPQftr=[];
    %I2 = imcrop(I);
    %IM2=rgb2gray(I2);
    IMQuery = (imresize((double(I2)),[150,150]));
    %IM2 = imresize((double(I2)),[150,150]);
    xx=LBPN(IMQuery);
    LBPQftr=xx(:);
    %LBPQftr=[LBPQftr;LBPN(IM2)];
