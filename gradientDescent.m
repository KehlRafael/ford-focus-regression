function [theta, J_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters)
    % Performs gradient descent to learn theta that best suits y
    % theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
    % taking num_iters gradient steps with learning rate alpha

    % Initialize variables
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);
    theta_history = zeros(length(theta), 2);

    for iter = 1:num_iters
        % Update theta with gradient descent
        theta = theta - alpha*(1/m)*sum((X*theta-y).*X)';

        % Save cost and theta history
        J_history(iter) = computeCost(X, y, theta);
        theta_history(:,iter) = theta;
    end
end