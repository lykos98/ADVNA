function [x,iter,resvec,flag] = mygmres(A,b,tol,maxit,x0)
%UNTITLED Summary of this function goes here
    r = b - A*x0;
    k = 0;
    n = length(x0);
    rho = norm(r);
    beta = rho;
    v = r/beta;
    tol_b = tol*beta;
    V_mat = [];
    H_mat = [];
    resvec = [rho];
    flag = 0;
    
    while rho > tol_b && k< maxit
        V_mat = [V_mat v];
        k = k + 1;
        v = A * v; %v _k+1

        H_mat = [H_mat, zeros(k,1)];
        for j = 1:k
            h_jk = v.'*V_mat(:,j); %v_k+1 ^ T * v_j
       
            H_mat(j,k) =  h_jk;
            v = v - h_jk*V_mat(:,j);
            
        end
        H_mat = [H_mat; zeros(1,k)];
        h_k = norm(v);
      
        
        if h_k < 1e-12
            flag = -1;
            [Q,R] = qr(H_mat);
            break
        else
            v = v/h_k;
            %size(H_mat);
            H_mat(k+1,k) = h_k;
            [Q,R] = qr(H_mat);
            rho = abs(beta*Q(1,k+1));
            resvec = [resvec rho];
         
        end
 
        
    end
    %solve argmin
    g = Q(1,1:k);
    g = beta * g.';
 
    %size(H_mat)
    %size(V_mat)

    y = (R(1:k,:))\g;

    x = x0 + V_mat*y;
    iter = k;
    
    
    
end

