function [x_hat] = SoftThresh1(y, lambda)
    col = size(y, 2);
    x_hat = zeros(1, col);
    for i = 1:col
    if y(i) <= -lambda
        x_hat(i) = y(i) + lambda;
    else
        if y(i) >= lambda
            x_hat(i) = y(i) - lambda;
        else if abs(y(i)) < lambda
        x_hat(i) = 0;
        
     end;   
    end;
    end;
end