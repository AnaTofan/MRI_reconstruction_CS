load brain.mat
figure(1);
imshow(abs(im), []);
 
% Mask Unif
M = fft2c(im);
M_us = (M.*mask_unif)./pdf_unif;

im_us = ifft2c(M_us);

figure(2);
figure(3);
imshow(abs(cat(2, im, im_us, (im_us-im)*10)), [0,1]);

% Mask Vardens
M = fft2c(im);
M_vd = (M.*mask_vardens)./pdf_vardens;

im_vd = ifft2c(M_vd);

figure(4);
imshow(abs(cat(2, im, im_vd, (im_vd - im)*10)), [0,1]);
W = Wavelet;
% use initial image
im_W = W*im;
figure(5);
imshowWAV(im_W);

lambda1 = 0.05;
lambda2 = 0.25;
lambda3 = 0.5;
% use image created with the sampling
imW = W * im_vd;
figure(7);
% imshow(abs(imW) > lambda, [])

subplot(1,3,1)
imshow(abs(imW) > lambda1, [])
title('lambda = 0.05')
subplot(1,3,2)
imshow(abs(imW) > lambda2, [])
title('lambda = 0.25')
subplot(1,3,3)
imshow(abs(imW) > lambda3, [])
title('lambda = 0.5')

%M = fft2c(im).*mask_vardens;
%M_vd = (M)./pdf_vardens;

%im_vd = ifft2c(M_vd);
im_final = im_vd;
figure(8);
error = zeros(1, 20);
chosen_lambda =  0.025;
for i = 1:20
im_final = W' *(SoftThresh(W*im_final, chosen_lambda));
im_final = ifft2c(fft2c(im_final).*(1-mask_vardens)+ M.*mask_vardens);
error(i)  = sum(abs(im_final - im), "all")/(512 * 512);
imshow(abs(im_final),[]); 
%im_wavelet = W * im_final;
%imshow(abs(im_wavelet) > chosen_lambda, [])
title(i)
drawnow;
end

figure(9);
plot(error);


%im_vd = ifft2c(M_vd);
im_final = im_us;
figure(8);
error = zeros(1, 20);
chosen_lambda =  0.25;
for i = 1:20
im_final = W' *(SoftThresh(W*im_final, chosen_lambda));
im_final = ifft2c(fft2c(im_final).*(1-mask_unif)+ M.*mask_unif);
error(i)  = sum(abs(im_final - im), "all")/(512 * 512);
imshow(abs(im_final),[]); 
%im_wavelet = W * im_final;
%imshow(abs(im_wavelet) > chosen_lambda, [])
title(i)
drawnow;
end

figure(9);
plot(error);