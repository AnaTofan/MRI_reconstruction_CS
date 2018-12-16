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

% adding noise to the signal
v = 0.05; % variance
sigma = sqrt(v); % standard deviation
N = normrnd(0, v, [1, n]);
Y = x + N;

figure(2);
stem(Y);
grid on; xlabel('position'); ylabel('y');
title('Noisy vector y');
axis([0 n -0.25 1.25]);


% Try to denoise
lambda1 = 0.01;
x_hat1 = (1/(1 + lambda1))*Y;
lambda2 = 0.05;
x_hat2 = (1/(1 + lambda2))*Y;

lambda3 = 0.1;
x_hat3 = (1/(1 + lambda3))*Y;

lambda4 = 0.2;
x_hat4 = (1/(1 + lambda4))*Y;

figure(3);
subplot(1,4,1);
stem(x_hat1);
xlabel('position'); ylabel('x_hat');
title('1_2 norm denoising \lambda = 0.01');
subplot(1,4,2);
stem(x_hat2);
xlabel('position'); ylabel('x_hat');
title('1_2 norm denoising \lambda = 0.05');
subplot(1,4,3);
stem(x_hat3);
xlabel('position'); ylabel('x_hat');
title('1_2 norm denoising \lambda = 0.1');
subplot(1,4,4);
stem(x_hat4);
xlabel('position'); ylabel('x_hat');
title('1_2 norm denoising \lambda = 0.2');

%figure(3);
%stem(x_hat3);
%xlabel('position'); ylabel('x_hat');
%title(['1_2 norm denoising \lambda = ' num2str(lambda)])

umin=-10;
umax=10;
n=20;
u=umin+rand(1,n)*(umax-umin);


lambdau = 9.5;
u_hat = SoftThresh1(u, lambdau);


figure(5);
stem(u)
grid on; xlabel('position'); ylabel('u');
title("Original signal u");

figure(7);
stem(u_hat)
grid on; xlabel('position'); ylabel('u');
title("Reconstructed signal u");

figure(6);
plot(u_hat);
hold on;
plot(u, "g");
hold off;
grid on; xlabel('position'); ylabel('u');
title(['Soft thresholing test with u, \lambda = ' num2str(lambdau)]);

%plot(u, u_hat)

lambda = 0.15;
x_hat2 = SoftThresh1(Y, lambda);
plot(x_hat2, x)

figure(4);
stem(x_hat2);
grid on; xlabel('position'); ylabel('x');
title(['Soft thresholing, \lambda = ' num2str(lambda)]);
%axis([0 n -0.25 1.25]);