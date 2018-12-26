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
  