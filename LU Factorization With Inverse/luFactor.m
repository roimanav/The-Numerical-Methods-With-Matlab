function[L,U,P,Ainv]=luFactor(A)
% luFactor function factors the coefficient matrix A for a system of 
% equations into L and U matrices which can futher be used to solve for the
% unknowns by Gauss' back subsitution. This function also keeps on pivoting
% the A matrix to minimize errors due to subtractive cancellation and 
% approximation error.
%
% INPUTS:-
% A : The coefficient matrix for a given system of equation
%
% OUTPUTS:-
% L      : The lower triangular matrix formed by multiplicative ratios used 
%          in Gauss's elimination.
% U      : The upper triangular matrix which the final result of Gauss's 
%          forward elimination.
% P      : The pivot matrix which keeps the track of the switching in rows
%          and is a pivoted version of the identity matrix such that 
%          P*(Orignal A) = Pivoted A .
% Ainv   : The inverse matrix of A.
%
% VARIABLES USED
% m : No. of rows of A.
% n : No. of columns of A.
% r : The row in which the maximum absolute value of a column vector occurs.
% i : Row index of matix A,U,P and L.
% j : Column index of matix A,U,P and L.
% tempA : Temporary A matrix.
% tempL : Temporary L matrix.
% tempP : Temporary P matrix.
%
% LIMITATION
% Even though luFactor function minimizes the probability of error due to 
% subtractive cancellation, error can still occur due to subtractive 
% cancellation and various other types of errors like approximation error,
% etc.
%
% THEORY
% o Gauss Elimination method aims to solve a system of equations by forward 
%   eliminating the provided coefficient matrix to form an upper triangle
%   matrix. 
% o The coefficient matrix and a P, pivot matrix is pivoted if pivoting is
%   requried by the A matrix. A matrix need pivoting if the absolute value
%   of any row below the A(i:) in a particular column is greater than the
%   value stored in position A(i,i), where i is the subscript of variable 
%   which we are trying to eliminate. For ex. if we are trying to eliminate
%   X2, then the value of the A(2,2) element must be greater than the
%   values in A(3:m,2). Here m is the no. of rows in A. If this condition 
%   is not satisfied then row containg the maximum value is swapped with
%   the A(2,:) row. The swapping of the same rows is also done for P matrix 
%   so that [P]*[A] =[L]*[U].
%
% ***** Include theory of inverse matrix formation ******
%
% GUIDE FOR ERROR AND WARNING MESSAGES
% o  ERROR    :- Too many variables. Check your [A].
%    Issue    :- If the numbers rows is less than the number of columns in
%                the coefficient matrix [A], then the system of equation is
%                not solvable as we have less equations more variables.
%    Solution :- You will need same number of equation as the number of 
%                variables, so you either add rows in your coefficient
%                matrix such that the number of colums is equal to the 
%                number of rows or delete some column to make the matrix a 
%                square matrix. Do note that by deleting the columns you 
%                are decreasing the number of variables.
%
% o  WARNING  :- Over constrained system of equation. Evaluating results 
%                only for 'n' equations.
%    Issue    :- If the numbers rows is more than the number of columns in
%                the coefficient matrix [A], then the system of equation is
%                called over constrained system as we have more equations
%                which the solution has to satisfy which can some time lead
%                to no solutions at all.
%    Solution :- The luFactor function itself takes care of this issue by 
%                deleting the extra rows from the [A] matrix such that the
%                number of colums is equal to the number of rows. The user
%                must note that the result evaluated for an overconstrained
%                system will only satisfy the first to the nth eqautions
%                where n is the number of variables. The results may or may
%                not satisfy the rest of the equations.

%% Getting [A] into right shape.

[m,n]=size(A);

if m<n
    error('Too many variables. Check your [A].')
    
elseif m > n
    warning('Over constrained system of equation. Evaluating results only for first %g equations.',n)
    m=n;
    A=A(1:n,:);
    
else
end

%% Pivoting and forward eliminating.
L=eye(m);
P=eye(m);

for j=1:n-1
    
    [~,r]=max(abs(A(j:m,j)));
    r=r+j-1;
    
    tempA=A;                                                  % Pivoting A.
    A(j,:)=A(r,:);
    A(r,:)=tempA(j,:);
    
    tempP=P;                                                  % Pivoting P.
    P(j,:)=P(r,:);
    P(r,:)=tempP(j,:);
    
    if j~=1                        % as if j=1,j-1=0. Improper coordinates.
        
        tempL=L;                                              % Pivoting L.
        L(j,1:j-1)=L(r,1:j-1);
        L(r,1:j-1)=tempL(j,1:j-1);
    end
    
    for i= j+1:m
        
        if  A(j,j)~=0                             % Avoiding Division by 0.
            L(i,j)=A(i,j)/A(j,j);                    % Forward Eliminating.
            A(i,:)=A(i,:)-L(i,j)*A(j,:);
        end
        % if A(j,j)==0 then the loop skips that column and moves on to the 
        % next column.
    end
end
U=A;

X=zeros(n);
for j=1:n
    
   d = X(:,j);
   x=d;
    
        
    for i=1:n
        if i==1
        d(1)=P(1,j);
        else
        d(i)=P(i,j)-(L(i,1:i-1)*d(1:i-1));
        end
    end
    
    for i=1:n
        k = n+1-i;
        if k == n
        x(n)=d(n)/U(n,n);
        else
        x(k)=(d(k)-(U(k,k+1:n)*x(k+1:n)))/U(k,k);
        end
    end
    Ainv(:,j)=x;
    
end


end
