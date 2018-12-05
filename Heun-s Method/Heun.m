function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% Heun function is used to estimate the functional values of an unknown
% function by using the differential euation and the boundary function
% provided by the user. It also generates a plot of the function using the
% estimated values.
%
% INPUTS
% dydt  : The ordinary differential eyation which needs to be solved.
%         The user should input is as an anonymous function i.e
%         @(t,y)"expression". The functtion has to be interms of t and y!!!
% tspan : The vector containing just the lower and upper limit of the
%         independent variable t. tspan has to be a 2 element row vector!!!  
% y0    : It is the initial boundary condition for the function which is
%         needed. If f is the function then f(tmin)=y0.
% h     : It is the spacing between the domain elements.
% es    : It is the stopping criterion for the approximate error between
%         the slopes of consecutive corrector guesses.
%         OPTIONAL, Default to 0.001 percent.
% maxit : Maximum number of corrector itterations to be done. 
%         OPTIONAL, Default to 50 itterations.
%
% OUTPUTS
% t     : Domain elements of the required function.
% y     : Range elements of the required function.



if nargin == 4         % No optional input provided.
   es = 0.001;         % Default stopping criterion.
   maxit=50;           % Default maximum iterrations.
   
elseif nargin== 5      % Optional input of stopping criterion.
    maxit=50;          % Default maximum iterrations.
    
else 
end

[m,n]=size(tspan);
if m == 1 && n == 2    % REQUIRED dimensions of tspan vector.
    
    t    = tspan(1):h:tspan(2);  % forming equally spaced t (domain) vector.
    y    = y0;                   % forming y (range) vector. elements increase
                                 % with every itteration.
    BigT = length(t);            
    
    for i = 1:BigT-1
        
           y(i+1) = y(i)+dydt(t(i),y(i))*h; % predictor eqution.
           ea     = 1000000;                % initial error condition.
           iter    = 1;                     % initial iter value.
           
           while iter  <= maxit && ea >= abs(es)
                 Yold  = y(i+1);
                 y(i+1) = y(i)+ (dydt(t(i+1),y(i+1))+dydt(t(i),y(i)))/2*h;
                 % ^^ Corrector equation ^^
                 Ynew  = y(i+1);
                 
                 ea   = abs(((dydt(t(i+1),Ynew)-dydt(t(i+1),Yold))/dydt(t(i+1),Ynew))*100);
                 % ^^ Approximate error ^^
                 iter  = iter + 1;
           end
        end
  plot(t,y,'-o')
  grid  
  xlabel('t (domain)')
  ylabel('y (range)')
  legend('f(t)')
  title('Function by Heun''s Method.')
else
    error('Check size of tspan')
end

end

                 
                 