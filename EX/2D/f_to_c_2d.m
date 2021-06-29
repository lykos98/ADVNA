function r_2h = f_to_c_2d(r_h,nx)
   
   r_2h = zeros(nx^2,1);
  
   nx_h = 2 * nx;
      
   for i = 1:(nx-1)
       ii = 2*i;
        for j = 1:nx
            jj = 2*j;
            
            val = 0;
            
            %disp(ii*nx_h + jj)
                        
            val = val + 4*r_h( ii*nx_h + jj);
            
            val = val + r_h( (ii - 1)*nx_h + (jj - 1));
            val = val + r_h( (ii + 1)*nx_h + (jj - 1));
            val = val + r_h( (ii - 1)*nx_h + (jj + 1));
            val = val + r_h( (ii + 1)*nx_h + (jj + 1));
            
            val = val + 2*r_h( (ii)*nx_h + (jj - 1)) ;
            val = val + 2*r_h( (ii)*nx_h + (jj + 1)) ;
            val = val + 2*r_h( (ii - 1)*nx_h + (jj)) ;
            val = val + 2*r_h( (ii + 1)*nx_h + (jj)) ;
            
            r_2h(i*nx + j) = val;
            
        end
   end
   
   r_2h = r_2h/16;
end

