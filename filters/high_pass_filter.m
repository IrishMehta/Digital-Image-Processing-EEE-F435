img=imread('cameraman.tif');%enter name of picture here
subplot(221),imshow(img);
fft_img=fft2(img);
fft_img=fftshift(fft_img);
subplot(222),imshow(mat2gray(log(1+abs(fft_img))));%this is for display purposes only
[r,c]=size(img);
filter=zeros(r);


for i=1:r
    for j=1:c
        filter(i,j)=1-exp(-((i-r/2)^2+(j-c/2)^2)/200);
    end
end

subplot(223),imshow(filter);
final_img=fft_img.*filter;
final_img=ifft2(final_img);
subplot(224),imshow(mat2gray(abs(final_img)));