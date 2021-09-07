function J = computeCost(X, y, theta)
    % Compute the cost function in a given step of our regression algorithm

    % Initialize variables
    m = length(y); % number of training examples
    J = 0;

    h = X*theta;
    sqrError = (h-y).^2;
    J = (1/(2*m))*sum(sqrError);
end