function [C,Z]=ID_col(A,kk)
% A naive way to compute column ID by via the CPQR-factorization.
% kk = number of vectors wanted
% C is selection of the columns of A
% For sufficiently large kk, we hope that
%   A approx C*Z


% First: Essentially same as Algorithm 1 (but with pivoting) with kk steps:
[Q,R,P]=qr(A); 
Qs=Q(:,1:kk); 
Rs=R(1:kk,:);

% Now: Compute the ID col
R11=Rs(??)
R12=Rs(??)

C=A*P(:,??);
I=eye(kk,kk);
Z= [I, inv(R11)*R12]*P';



