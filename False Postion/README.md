_**falsePosition**_ function determines the approximate value of the root of a given function the  between the interval provided by the user.

**INPUTS:**

func     : The function whose root has to be determined.

xl       : The lower input limit of the function.

xu       : The upper input limit of the function.

es       : The stopping criteria of the function. (OPTIONAL INPUT. DEFAULT:0.0001)

maxiter  : The maximum number of iteration/times the function can be ran. (OPTIONAL INPUT. DEFAULT:200)
           
**OUTPUTS:**

root     : The approximate input value of the function when the functional value is closest to zero.

fx       : The functional value at the root.

ea       : The approximate relative error percentage of the calculated root.

iter     : The number of of itteration done to obtain the root value.

**VARIABLES USED:**

prevappx : Previous Approximation of the root.

presappx : Present Approxiamtion of the root.

xr       : The root input.

**EXPECTATIONS FROM THE USER:**

In order to use the false position function the user must take care of the following conditions:
  * The function must be in one variable.
  * The provided lower limit should be less than the provided upper limit.
  * The provided interval should have EXACTLY ONE root. In other words, the function should change sign and pass the functional value equal to zero while moving from the lower limit to upper limit.
  * The function should be converging.

**LIMITATIONS of falsePosition**

* The function doesn't work if there is no root or even number of roots in the provided interval.
* The function only works for converging functions.
* If odd number of roots(except one) are present in the interval then the function only estimates one of the root depending on the upper and lower limit.

**SUGGESTION FOR BETTER RESULT**

The user should plot the graph of the function and then choose the smallest interval containing exactly one root.

**THEORY:**

ea= abs((presappx-prevappx)*100/presappx)

xr=xu-func(xu)*(xl-xu)/(func(xl)-func(xu)) False Position Formula
