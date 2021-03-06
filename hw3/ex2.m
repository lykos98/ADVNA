A = load('mat13041.rig');
A = spconvert(A);

n = size(A,1);

x_exact = zeros(n,1);

for i = 1:n
    x_exact(i) = 1/sqrt(i);
end

b = A*x_exact;

tol = 1e-10;
maxit = 550;

x0 = zeros(n,1);
disp("my")
[x1 ,iter1,resvec1,flag1] = mygmres(A,b,tol,maxit,x0);


semilogy(resvec1,'.-')
title("mygmres 'mat13041.rig' ")
ylabel("||r_k||")
xlabel("iterations")
disp("norm of difference of the solution from the exact one")
disp(norm(x1 - x_exact))
