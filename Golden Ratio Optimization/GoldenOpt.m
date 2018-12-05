function [xr,fx,iter,ea,M] = GoldenOpt(f,df,xl,xu,opt,es,maxiter)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
% opt=1 max
% opt=0 min
%% CODE FOR THE OPTIONAL INPUTS
if     nargin==5       % THREE INPUTS
       es=0.0001;      % DEFAULT VALUE    
       maxiter=200;    % DEFAULT VALUE
elseif nargin==6       % FOUR INPUTS
       maxiter=200;    % DEFAULT VALUE
end

%% DEFINING INITIAL VALUES TO THE VARIABLES FOR THE WHILE LOOP.

iter=0;
xr=100000000000;       % AN ARBITARARY LARGE NUMBER.
ea=xr;                 % AN ARBITARARY LARGE NUMBER.
max=1;
min=0;

%% IF CONDITIONS AND WHILE LOOP. THE REAL STUFF!!

if df(xl)*df(xu) < 0
    
    if opt == max
        while iter < maxiter || ea > es
            prevappx = xr;
            iter = iter+1;
            M(iter,1) = iter;
            M(iter,4) = xl;
            M(iter,5) = xu;
            
            phi = ( 1 + sqrt(5))/2 ;
            d = (phi-1)*(xu-xl);
            
            x1 = xl+d;
            x2 = xu-d;
            
            if f(x1) > f(x2)
               
                xr = x1;
                M(iter,2) = xr;
                fx = f(xr);
                M(iter,3) = fx;
                
                presappx = xr;
                ea = abs((prevappx-presappx)/presappx*100);
                M(iter,6)= ea;
                
                if       x2 < x1
                         xl = x2;
                
                elseif   x2 > x1
                         xu = x2;
                else
                    error('Check your value. Your x2 = x1. Read the help section')
                end
                
            elseif f(x2) > f(x1)
               
                xr = x2;
                M(iter,2) = xr;
                fx = f(xr);
                M(iter,3) = fx;
                
                presappx = xr;
                ea = abs((prevappx-presappx)/presappx*100);
                M(iter,6)= ea;
                
                if       x1 > x2
                         xu = x1;
                
                elseif   x1 < x2
                         xl = x1;
                else
                    error('Check your value. Your x2 = x1. Read the help section')
                end
                
            else
                error('Your functional value at x1 and x2 is equal. Read the help section')
            end
            
        end
        
    elseif opt == min
        while iter < maxiter || ea > es
            prevappx = xr;
            iter = iter+1;
            M(iter,1) = iter;
            M(iter,4) = xl;
            M(iter,5) = xu;
            
            phi = ( 1 + sqrt(5))/2 ;
            d = (phi-1)*(xu-xl);
            
            x1 = xl+d;
            x2 = xu-d;
            
            if f(x1) < f(x2)
               
                xr = x1;
                M(iter,2) = xr;
                fx = f(xr);
                M(iter,3) = fx;
                
                presappx = xr;
                ea = abs((prevappx-presappx)/presappx*100);
                M(iter,6)= ea;
                
                if       x2 < x1
                         xl = x2;
                
                elseif   x2 > x1
                         xu = x2;
                else
                    error('Check your value. Your x2 = x1. Read the help section')
                end
                
            elseif f(x2) < f(x1)
               
                xr = x2;
                M(iter,2) = xr;
                fx = f(xr);
                M(iter,3) = fx;
                
                presappx = xr;
                ea = abs((prevappx-presappx)/presappx*100);
                M(iter,6)= ea;
                
                if       x1 > x2
                         xu = x1;
                
                elseif   x1 < x2
                         xl = x1;
                else
                    error('Check your value. Your x2 = x1. Read the help section')
                end
                
            else
              error('Your functional value at x1 and x2 is equal. Read the help section')
            end
            
        end
        
    else
        error('opt value can only be either 0 (for min) or 1(for max). Redefine opt value. Read the help section')
    end
    
else
    error(' There might be either no or more than 1 roots in the provided interval. Redefine your Bound. Read the help section')
end
                      
end

