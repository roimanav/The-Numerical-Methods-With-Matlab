_**Heun function**_ is used to estimate the functional values of an unknown function by using the differential euation and the boundary condition provided by the user. It also generates a plot of the function using the estimated values.

**INPUTS**

dydt  : The ordinary differential eyation which needs to be solved. The user should input is as an anonymous function i.e                           @(t,y)"expression". The functtion has to be interms of t and y!!!

tspan : The vector containing just the lower and upper limit of the independent variable t. tspan has to be a 2 element row vector!!!  

y0    : It is the initial boundary condition for the function which is needed. If f is the function then f(tmin)=y0.

h     : It is the spacing between the domain elements.

es    : It is the stopping criterion for the approximate error between the slopes of consecutive corrector guesses. OPTIONAL, Default to           0.001 percent.

maxit : Maximum number of corrector itterations to be done. OPTIONAL, Default to 50 itterations.

**OUTPUTS**

t     : Domain elements of the required function.

y     : Range elements of the required function.
