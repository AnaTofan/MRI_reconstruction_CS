close all;
clear all;
% generating a row vector
n = 128;
k = 5;
x = zeros(1, n);
peaks = randperm(n);
peaks = peaks(1:k);
x(peaks) = (1:k)/k;

figure(1);
stem(x);
grid on; xlabel('position'); ylabel('x');
title('Original vector x');
axis([0 n -0.25 1.25]);

dim = 2;
X = fftc(x, dim)


figure(2);
stem(X);
grid on; xlabel('position'); ylabel('X fourrier');
title('Fourrier transform of signal x');
axis([0 n -0.25 1.25]);

Xu = zeros(1, n);
Xu(1:4:n) = X(1:4:n);
xu = ifftc(Xu, dim) * 4;


figure(3);
stem(real(xu));
hold on;
stem(imag(xu), "g")
hold off;
grid on; xlabel('position'); ylabel('real(xu)');
title('Real(blue) and imaginary(green) of xu');
axis([0 n -0.25 1.25]);

Xr = zeros(1, n);
prm = randperm(n);
Xr(prm(1:32)) = X(prm(1:32));
xr = ifftc(Xr, dim) * 4;


figure(5);
stem(real(xr));
hold on;
stem(imag(xr), "g")
hold off;
grid on; xlabel('position'); ylabel('real(xr)');
title('Real and imaginary part of xu');
axis([0 n -0.25 1.25]);