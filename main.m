# Simple linear regression to predict Ford Focus prices in UK
# Original complete dataset available at 
# https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes/
# Credits on the dataset to Kaggle user adityadesai13

data = csvread('data/focusSample.csv'); # Read data sample, 500 entries.

prices = data(:,1); # Car prices is the first column
mileage = data(:,2); # Car mileage is the second column

clf; # Start figure
scatter(mileage, prices); # Scatter plot 
title("Ford Focus Mileage x Price in UK");
xlabel("Mileage");
ylabel("Price");

printf("Scatter plot being displayed. Press any key to continue...\n")
pause;
close;

scatter(prices, mileage);