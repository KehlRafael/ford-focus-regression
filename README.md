# ford-focus-regression
Portuguese README available [here](README_ptbr.md).
A simple gradient descent algorithm to create a polynomial model that estimates a Ford Focus price in U.K. based only in its mileage. It is programmed and tested on Octave, but most likely works on Matlab too.

The gradient descent implemented here is general enough to solve the polynomial minimization problem.

## Dataset
The [dataset](data/focus.csv) present in the [data](data) folder is part of the [100,000 UK Used Car Data set](https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes/), by Kaggle user [Aditya](https://www.kaggle.com/adityadesai13). To train the algorithm I extracted 500 random entries from the complete [dataset](data/focus.csv) and created a [sample](data/focusSample.csv). I use the same sample in both the linear and quadratic algorithms training.

## Usage
To simply run the gradient descent algorithm, open Octave and set the working folder to the project's folder then type `main` to run the linear training or `mainQuadratic` to run the quadratic polynomial training. The model coefficients will be stored in the `theta` variable and plots will show you the training dataset and resulting model. Additionally, a GIF animation with 50 steps of the training will be saved to the [img](img) folder.

You can change any parameters directly on the [`main`](main.m) or [`mainQuadratic`](mainQuadratic.m) scripts or use the functions directly. To run only the gradient descent algorithm on your own dataset and your own polynomial you must run the following command:
```
[theta, costFunction_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters);
```
Where `num_iters` is the number of iterations you want the gradient descent to run, `alpha` is the algorithm's learning rate, `theta` is a vector of order `n` with the polynomial coefficients initial values (`n` is the number of coefficients in your polynomial), `y` is the training data results, or labels, and `X` is a `n x m` matriz with the training data inputs (`n` is the number of coefficients in your polynomial and `m` is the number of inputs in the training dataset). This function will return the polynomial coefficients (`theta`), the history of your cost function values (`costFunction_history`) and the history of your coefficient values (`theta_history`).

An example of a valid `X` for a complete quadratic polynomial is as shown below:
```
X = [ones(length(training_inputs), 1), training_inputs, training_inputs.^2];
```
For any higher order polynomial you just have to add columns for each coefficient. A `6`<sup>th</sup> order coefficient could be added by a new column with `training_inputs.^6` in the matrix.
