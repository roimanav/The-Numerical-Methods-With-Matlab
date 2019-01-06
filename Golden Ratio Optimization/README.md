_**GoldenOpt**_ or the Golden Ratio Optimization function determines the 
approximate input value of a given function when the functional value is
either maximum or minimum between the interval provided by the user.

**INPUTS:**

f        : The function which has to be optimized.

df       : The first derivative of the function.

xl       : The lower input limit of the function.

xu       : The upper input limit of the function.

opt      : The required optimization i.e. for calculating a local maxima
           opt=1 and for calculating a local minima opt=0
           
es       : The stopping criteria for the function. 
           (OPTIONAL INPUT. DEFAULT:0.0001)
           
maxiter  : The maximum number of iteration/times the function can be ran.
           (OPTIONAL INPUT. DEFAULT:200)
           
**OUTPUTS:**

xr       : The approximate input value of the function when the functional
           value is maximum or minimum.
           
fx       : The functional value of the maxima or minima.

iter     : The number of of iteration done for computing the extrema.

ea       : The approximate relative error percentage of the calculated 
           input of the extrema.
           
M        : A table containing the values of xr, fx, xl, xu and ea for 
           every iteration.
           
**VARIABLES USED:**

prevappx : Previous Approximation of the root.

presappx : Present Approxiamtion of the root.

xr       : The root input.

x1 & x2  : The guesses of root by golden ratio.

**EXPECTATIONS FROM THE USER:**

In order to use the GoldenOpt function the user must take care of
the following conditions:

  * The function must be in one variable
  * The provided lower limit should be less than the provided upper limit.
  * The provided interval should have EXACTLY ONE extrema. In other words,
    the first derivative function should change sign and pass the functional 
    value equal to zero while moving from the lower limit to upper limit.
  * The function should be converging.

**LIMITATIONS of GoldenOpt function**
* The function doesn't work if there is no extrema or even number of extremas 
  in the provided interval.
* The function only works for converging functions.
* If odd number of extremas (except one) are present in the interval then the
  function only estimates one of the extrema depending on the upper and
  lower limit.

**SUGGESTION FOR BETTER RESULT**

The user should plot the graph of the function and then choose the
smallest interval containing exactly one extrema. This can also be done
by identifying the critical point of the function. i.e. when the first
derivative of the function equals to zero.

**THEORY:**

ea  = abs((presappx-prevappx)*100/presappx)

phi = (sqrt(5)+1)/2        The golden ratio.

d   = (phi-1)*(xu-xl)

x1  = xl + d

x2  = xu - d
