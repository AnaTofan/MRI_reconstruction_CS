function [x_hat] = SoftThresh2(y, lambda)
   x_hat = zeros(1, length(y));
   for i = 1:length(y)
    if abs(y(i)) >= lambda
       x_hat(i) = (y(i) / abs(y(i))) * (abs(y(i)) - lambda);
    end
   end
end