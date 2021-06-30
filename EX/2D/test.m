N=512;
A=delsq(numgrid('S',N+1));

n = size(A,1);

x0 = zeros(n,1);

x_exc = ones(n,1);
b = A*x_exc;

maxit = 10000;
tol = 1e-10;
tic();
[x, iter,resvec] = MG_2D(A,b,x0,maxit,tol,N - 1);
t2 = toc()
tic();
%[x2, iter2,resvec2] = SOR(A,b,x0,maxit,tol,1);
%xx = A\b;
t3 = toc()
iter
iter2

norm(x - x_exc)

semilogy(resvec)

x_p = linspace(0,1,15).';
%x_pc = linspace(0,1,7).';
%x_pf = linspace(0,1,31).';

rate = -log10(norm(x_exc - x)/norm(x_exc - x0))/iter


%gg = [1 1 1 1 1 1 1 1 2 2 2 2 2 1 1 2 3 3 3 2 1 1 2 3 4 3 2 1 1 2 3 3 3 2 1 1 2 2 2 2 2 1 1 1 1 1 1 1 1 ];

%gg2 = f_to_c_2d(gg,3)

%gg3 = c_to_f_2d(gg2,3)




