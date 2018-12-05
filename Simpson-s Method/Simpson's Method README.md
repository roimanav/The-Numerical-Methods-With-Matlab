The **_Simpson_** function calculates the integral of the data set provided
using simpsons 1/3rd rule and/or trapezoidal method.

**Inputs:-**

X : Domain vector for the data set.

Y : Codomain vector for the data set.

**Outputs:-**

I : Integral of the given data set.

**Variables Used :-**

p : no.of rows in X array. ( must be 1)

q : no.of rows in Y array. ( must be 1)

lx: no.of columns in X array. ( must be 2 at least)

ly: no.of columns in Y array. ( must be 2 at least)

D : The vector containing differences between consecutive terms of the X
    array. (all terms must be equal, i.e. X should be uniformly spaced.
    
k : Temperory variable used for assigning indices to the I vector.

i : Temperory variable used for callining indices to the X and Y array.

**Theory :-**

Simpson's 1/3rd rule : Uses three data points X0, X1 and X2 to find the
integral. 

       formula : I = (X2-X0)*(f(X0)+4*f(X1)+f(X2))/6     f()is the
       function.
       
Trapezoidal Method   : Uses two data points a and b to find the integral.

       formula : I = (b-a)*(f(a)+f(b))/2                 f()is the 
       function. 

**Errors and Warning.**

* The arrays provided are not of the same length or are of unit length.

  Problem  :- Unequal arrays or column vector/scalar input provided.
  
  Solution :- Make X and Y equal in length and X and Y should be row
  vectors containing more than 1 elements.

* The inputs provided are not vectors. 

  Problem  :- The inputs are column vectors or matrices.
  
  Solution :- Make X and Y row vectors, i.e of the dimension 1 x n where
  n is a natural no. greater than 1.

* The provided domain array is not uniformly spaced.

  Problem  :- The X array is not equally spaced.
  
  Solution :- Make the array uniformly spaced.

* Even no.of data points provided. Using the trapezoidal method for the first segment.

  Note    :- The simpson 1/3 rule only works for odd no. of data points.
             Since the difference in Y values in first segment is less 
             than that of last segment, trapezoidal rule is used on the
             first segment.

* Even no.of data points provided. Using the trapezoidal method for the last  segment.

  Note    :- The simpson 1/3 rule only works for odd no. of data points.
             Since the difference in Y values in last segment is less 
             than that of first segment, trapezoidal rule is used on the
             last segment.

