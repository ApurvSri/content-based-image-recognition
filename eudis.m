A=[];
%M=[];
%vector=cell(zeros(size(LBPftr12,1)));
for i=1:size(LBPftr12,1)
    %D=LBPftr(1+i:150+i,:);
    len=size(LBPftr12,2)-1;
    vector=LBPftr12(i,1:len);
    idx=LBPftr12(i,len+1);
    %euclidean distance 
    A=[A;(sqrt(sum(LBPQftr'-vector).^2)) idx];
    
    
    A=[A;sum(sum(abs(LBPQftr'-vector))) idx];
end

%sort(A);
for i=1:1:size(LBPftr12,1)
    for j=i:1:size(LBPftr12,1)
        if A(i)>=A(j)
            t = A(i);
            A(i)=A(j);
            A(j)=t;
            
            t1=A(i,2);
            A(i,2)=A(j,2);
            A(j,2)=t1;
        end
    end
end
nResults = input('Enter number of output images');

NRows = ceil((nResults+1) / 3);


subplot(NRows,3,1); imshow(I2); title('Query Image');
for i=1:nResults
   ind=A(i,2);
   imname=strcat(fileFolder1,'\',fileNames1(ind));
   subplot(NRows,3,i+1)
   imshow(imname{1});
   str = sprintf('Im %d: %.3f',i,A(i,1));
   title(str);
   %title(strcat('distance--',num2str(A(i,1))));
end
            

%min=A(1);
%p=0;
%for i=2:1:6
%        if A(i)<=min
 %       min=A(i);
  %      p=i;
   %     end
%end
%fprintf('The minimum distance is %5.2f for the %f th image', min,p);

%fprintf('The minimum distance is %5.2f', A(1,1));
%fprintf('Query Image');
%imshow(I2);
%fprintf('Most Similar Image');
%imshow(imshow(A(1,2)));
    


