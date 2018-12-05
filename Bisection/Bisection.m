function [root,fx,ea,iter,M] = Bisection(func,xl,xu,es,maxiter)
% Bisection function determines the approximate value of the root of a 
% a given function the  between the interval provided by the user.
% 
% INPUTS:  
% func     : The function whose root has to be determined.
% xl       : The lower input limit of the function.
% xu       : The upper input limit of the function.
% es       : The stopping criteria of the function. 
%            (OPTIONAL INPUT. DEFAULT:0.0001)
% maxiter  : The maximum number of iteration/times the function can be ran.
%            (OPTIONAL INPUT. DEFAULT:200)
%            
% OUTPUTS:
% root     : The approximate input value of the function when the functional
%            value is closest to zero.
% fx       : The functional value at the root.
% ea       : The approximate relative error percentage of the calculated root.
% iter     : The number of of itteration done to obtain the root value.
% 
% VARIABLES USED:
% prevappx : Previous Approximation of the root..
% presappx : Present Approxiamtion of the root.
% xr       : The root input.
%
% EXPECTATIONS FROM THE USER:
% In order to use the Bisection function the user must take care of
% the following conditions:
%   o The function must be in one variable.
%   o The provided lower limit should be less than the provided upper limit.
%   o The provided interval should have EXACTLY ONE root. In other words,
%     the function should change sign and pass the functional value equal
%     to zero while moving from the lower limit to upper limit.
%   o The function should be converging.
%
% LIMITATIONS of Bisection
% o The function doesn't work if there is no root or even number of roots 
%   in the provided interval.
% o The function only works for converging functions.
% o If odd number of roots(except one) are present in the interval then the
%   function only estimates one of the root depending on the upper and
%   lower limit.
%
% SUGGESTION FOR BETTER RESULT
% The user should plot the graph of the function and then choose the
% smallest interval containing exactly one root.
%
% THEORY:
% ea= abs((presappx-prevappx)*100/presappx)
% xr= (xl+xu)/2; Bisection Formula


%% CODE FOR THE OPTIONAL INPUTS

if     nargin==3       % THREE INPUTS
       es=0.0001;      % DEFAULT VALUE    
       maxiter=200;    % DEFAULT VALUE
elseif nargin==4       % FOUR INPUTS
       maxiter=200;    % DEFAULT VALUE
elseif nargin==5       % FIVE INPUTS. ALL INPUTS TO BE PROVIDED. NO DEFAULT.
end

%% DEFINING INITIAL VALUES TO THE VARIABLES FOR THE WHILE LOOP.

iter=0;
xr=100000000000;       % AN ARBITARARY LARGE NUMBER.
ea=xr;                 % AN ARBITARARY LARGE NUMBER.

%% IF CONDITIONS AND WHILE LOOP. THE REAL STUFF!!

if func(xl)*func(xu)< 0 % = if it has a root in the interval
    
    while  iter <= maxiter && ea >= es % criterion for breaking the loop.
        prevappx=xr;
        iter=iter+1;
        M(iter,1)=iter;
        M(iter,2)=xl;
        M(iter,3)=xu;
        xr=(xl+xu)/2; % Bisection formula.
        M(iter,4)=xr;
        presappx=xr;
        ea= abs((presappx-prevappx)*100/presappx);% approximate relative percent error.
        root=xr;
        fx=func(root); % calculating the functional value.
        M(iter,5)=fx;
        M(iter,6)=ea;
        if func(xl)*func(xr)<0           % redefining the bounds.
            xu=xr;
        elseif func(xu)*func(xr)<0
            xl=xr;
        else
        end
    end
elseif func(xl)*func(xu)==0   % if the bounds are the roots
    if func(xl)==0            % lower limit is the root.
        root=xl;
        ea=0;
        fx=func(xl);
    elseif func(xl)==func(xu) % both are roots
        root=[xl xu];
        ea=0;
        fx=func(root);
    else
        root=xu;              % upper limit is the root
        ea=0;
        fx=func(xu);
    end
else
    error('ERROR !!! The interval does not contain any root or contains more than one root in the interval provided. Change the interval. Read help text for more info')
end
        
    M= array2table(M,'VariableNames',{'i','xl','xu','xr','fx','ea'});
end

