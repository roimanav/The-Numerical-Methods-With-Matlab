function [I] = Simpson(X,Y)
% The Simpson function calculates the integral of the data set provided
% using simpsons 1/3rd rule and/or trapezoidal method.
%
% Inputs:-
% X : Domain vector for the data set.
% Y : Codomain vector for the data set.
%
% Outputs:-
% I : Integral of the given data set.
%
% Variables Used :-
% p : no.of rows in X array. ( must be 1)
% q : no.of rows in Y array. ( must be 1)
% lx: no.of columns in X array. ( must be 2 at least)
% ly: no.of columns in Y array. ( must be 2 at least)
% D : The vector containing differences between consecutive terms of the X
%     array. (all terms must be equal, i.e. X should be uniformly spaced.
% k : Temperory variable used for assigning indices to the I vector.
% i : Temperory variable used for callining indices to the X and Y array.
%
% Theory :-
% Simpson's 1/3rd rule : Uses three data points X0, X1 and X2 to find the
% integral. 
%        formula : I = (X2-X0)*(f(X0)+4*f(X1)+f(X2))/6     f()is the
%        function.
% Trapezoidal Method   : Uses two data points a and b to find the integral.
%        formula : I = (b-a)*(f(a)+f(b))/2                 f()is the 
%        function. 
%
% Errors and Warning.
%
% o The arrays provided are not of the same length or are of unit length.
%   Problem  :- Unequal arrays or column vector/scalar input provided.
%   Solution :- Make X and Y equal in length and X and Y should be row
%   vectors containing more than 1 elements.
%
% o The inputs provided are not vectors. 
%   Problem  :- The inputs are column vectors or matrices.
%   Solution :- Make X and Y row vectors, i.e of the dimension 1 x n where
%   n is a natural no. greater than 1.
%
% o The provided domain array is not uniformly spaced.
%   Problem  :- The X array is not equally spaced.
%   Solution :- Make the array uniformly spaced.
%
% o Even no.of data points provided. Using the trapezoidal method for the first segment.
%   Note    :- The simpson 1/3 rule only works for odd no. of data points.
%              Since the difference in Y values in first segment is less 
%              than that of last segment, trapezoidal rule is used on the
%              first segment.
%
% o Even no.of data points provided. Using the trapezoidal method for the last  segment.
%   Note    :- The simpson 1/3 rule only works for odd no. of data points.
%              Since the difference in Y values in last segment is less 
%              than that of first segment, trapezoidal rule is used on the
%              last segment.


% getting row vectors of atleast 2 elements and equal lengths.
[p,lx] = size(X);
[q,ly] = size(Y);

if lx==ly && lx > 1
    
    if p == q && p == 1
        
        D = diff(X);
        
        for i = 1:lx-1
            
            if D(i) == D(1) && D(1)~= 0 % difference cannot be zero. should be qually spaced.
            else
                error('The provided domain array is not uniformly spaced')
            end
        end
        
        if mod(lx,2)~= 0          % even or odd.
            
            k = 0;
            
            for i = 1:2:lx-2
                k = k+1;
                
                I(k)= (X(i+2)-X(i))*(Y(i)+4*Y(i+1)+Y(i+2))/6;
                
            end
            
            
        elseif abs(Y(lx)-Y(lx-1))> abs(Y(2)-Y(1))   % checking the difference
                                                    % Y value of first and
            I(1)= (X(2)-X(1))*(Y(1)+Y(2))/2;        % last segment.
            k = 1;                                  % Applying Trapezoidal
            for i = 2:2:lx-2                        % for least difference
                k = k+1;                            % segment. minimizing error.
                
                I(k)= (X(i+2)-X(i))*(Y(i)+4*Y(i+1)+Y(i+2))/6;
                
            end
            
            warning(' Even no.of data points provided. Using the trapezoidal method for the first segment.')
            
        else
            k = 0;
            
            for i = 1:2:lx-2
                k = k+1;
                
                I(k)= (X(i+2)-X(i))*(Y(i)+4*Y(i+1)+Y(i+2))/6;
                
            end
            
            I(k+1)=(X(lx)-X(lx-1))*(Y(lx)+Y(lx-1))/2;
            warning(' Even no.of data points provided. Using the trapezoidal method for the last segment.')
        end
        
        I = sum(I);
   
    else
        error('The inputs provided are not vectors. Read help')
    end
        
    else
        error('The arrays provided are not of the same length or are of unit length. Read help')
    end

end

