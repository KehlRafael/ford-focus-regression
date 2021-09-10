% Linear regression to predict Ford Focus prices in UK
% Original complete dataset available at 
% https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes/
% Credits on the dataset to Kaggle user adityadesai13

% Read data sample, 500 entries
data = csvread('data/focusSample.csv');

% Define some variables for our plots
plottitle = "Ford Focus Mileage x Price in UK";
x_label = "Mileage";
y_label = "Price";
imggif = "img/linearModel.gif";

# Sort the data by mileage
data = sortrows(data,2);
prices = data(:,1); % Car prices is the first column
mileage = data(:,2); % Car mileage is the second column

% Plot dataset so we can visualize it
figure('visible','on');
clf;
scatter(mileage, prices);
title(plottitle);
xlabel(x_label);
ylabel(y_label);

printf("Scatter plot being displayed. Press any key to continue...\n\n")
pause;
close;

# Normalize the data to avoid problems
# We save all maximum to un-normalize later
maxPrices = max(prices);
maxMileage = max(mileage);
prices = prices/maxPrices;
mileage = mileage/maxMileage;

% Run Gradient Descent to obtain Linear Regression model

% First prepare all parameters needed
alpha = 0.1; % Step we take in the downhill direction
X = [ones(length(mileage), 1), mileage]; % We will use X to estimate y
y = prices; % We aim to estimate the price
theta = zeros(2, 1); % Inital theta for us to iterate on
num_iters = 15000; % Number of iterations

% Initialize variables that will hold historical data
costFunction_history = zeros(num_iters,1);
theta_history = zeros(size(theta,1), num_iters);

[theta, costFunction_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plotting the model above the training data
figure('visible','on');
clf;
scatter(mileage*maxMileage,prices*maxPrices, 'DisplayName','Training data')
hold on
plot(X(:,2)*maxMileage,X*theta*maxPrices,'-',"linewidth", 1.5,'DisplayName','Model')
hold off
legend;
title(plottitle);
xlabel(x_label);
ylabel(y_label);

printf("Model being shown above training data. Press any key to continue...\n\n")
pause;
close;

printf("Creating GIF with the model's evolution. It will be saved to 'img/quadraticModel.gif'\n")
printLinearRegression([mileage, prices], theta_history, X, plottitle, x_label, y_label, imggif)
printf("Your GIF is saved! Feel free to reach out to me anytime, you can find me at https://github.com/KehlRafael\n")