%Método de Jacobi y Método de Gauss-Seidel: Calcula la aproximación siguiente
%a la solución de un sistema de ecuaciones Ax=b con base en una condición
%inicial (x0), dependiendo del método (met) elegido, ya sea el método de
%Jacobi (met=0) o el método de Gauss Seidel (met=1).

function x1 = jacobi_gauss_seidel(x0,A,b,met)
    
    n=length(A);
    x1=x0;
    
    for i=1:n
        sum=0;
        
        for j=1:n
            if j~=i && met==0
                sum=sum+A(i,j)*x0(j);
                
            elseif j~=i && met==1
                sum=sum+A(i,j)*x1(j);
            end          
        end
        
        x1(i)=(b(i)-sum)/A(i,i);
    end
    
end