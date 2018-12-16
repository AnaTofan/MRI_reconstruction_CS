clear all;
close all;
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
X = fftc(x, dim);
Y = zeros(1, n);
prm = randperm(n);
Y(prm(1:32)) = X(prm(1:32));
y = ifftc(Y, dim) * 4;

figure(2);
stem(imag(y), "g");
hold on;
stem(real(y));
hold off;
grid on; xlabel('position'); ylabel('y');
title('Real and imaginary part of the inverse transform');
axis([0 n -0.25 1.25]);

X1 = Y
lambda = 0.01
errors = zeros(1, 100);
for i = 1:100
  x1 = ifftc(X1, dim);
  xst = SoftThresh2(x1, lambda);
  X1 = fftc(xst, dim);
  X1 = X1.*(real(Y)==0) + Y; 
  errors(i) = mean(abs(xst - x));
end

Xnew = ifftc(X1, dim)
figure(3);
stem(real(xst));
hold on;
stem(imag(xst), "g");
hold off;
grid on; xlabel('position'); ylabel('X recovered');
title(['Recovered signal for \lambda = ' num2str(lambda)]);
axis([0 n -0.25 1.25]);

figure(9);
plot(errors);
title(['Errors for \lambda = ' num2str(lambda)]);

X1 = Y
lambda = 0.05
errors = zeros(1, 100);
for i = 1:100
  x1 = ifftc(X1, dim);
  xst = SoftThresh2(x1, lambda);
  X1 = fftc(xst, dim);
  X1 = X1.*(real(Y)==0) + Y; 
  errors(i) = mean(abs(xst - x));
end

Xnew = ifftc(X1, dim)
figure(3);
stem(real(xst));
hold on;
stem(imag(xst), "g");
hold off;
grid on; xlabel('position'); ylabel('X recovered');
title(['Recovered signal for \lambda = ' num2str(lambda)]);
axis([0 n -0.25 1.25]);

figure(9);
plot(errors);
title(['Errors for \lambda = ' num2str(lambda)]);

X1 = Y
lambda = 0.1
errors = zeros(1, 100);
for i = 1:100
  x1 = ifftc(X1, dim);
  xst = SoftThresh2(x1, lambda);
  X1 = fftc(xst, dim);
  X1 = X1.*(real(Y)==0) + Y; 
  errors(i) = mean(abs(xst - x));
end

Xnew = ifftc(X1, dim)
figure(3);
stem(real(xst));
hold on;
stem(imag(xst), "g");
hold off;
grid on; xlabel('position'); ylabel('X recovered');
title(['Recovered signal for \lambda = ' num2str(lambda)]);
axis([0 n -0.25 1.25]);

figure(9);
plot(errors);
title(['Errors for \lambda = ' num2str(lambda)]);


% RECONSTRUCTION FOR EQUISPACED UNDERSAMPLED SIGNAL
dim = 2;
X = fftc(x, dim);
Xu = zeros(1, n);
Xu(1:4:n) = X(1:4:n);
xu = ifftc(Xu, dim) * 4;

figure(2);
stem(imag(xu), "g");
hold on;
stem(real(xu));
hold off;
grid on; xlabel('position'); ylabel('imag(y)');
title('Real and imaginary part of the inverse transform equispaced');
axis([0 n -0.25 1.25]);

X2 = Xu
lambda = 0.1
figure(3);
errors = zeros(1, 100);
for i = 1:100
  x2 = ifftc(X2, dim) * 4;
  xst2 = SoftThresh2(x2, lambda);
  stem(real(xst2));
  hold on;
  stem(imag(xst2), "g");
  hold off;
  grid on; xlabel('position'); ylabel('x recovered');
  title(['Recovered signal \lambda = ' num2str(lambda)]);
  axis([0 n -0.25 1.25]);
  drawnow;
  errors(i) = mean(abs(xst2 - x));
  X2 = fftc(xst2, dim);
  X2 = X2.*(Xu==0) + Xu; 
end


%Xnew2 = ifftc(X2, dim)
figure(9);
plot(errors);
title(['Errors for \lambda = ' num2str(lambda)]);