%Método Iterativo: Calcula la solución de un sistema de ecuaciones Ax=b,
%con una condición inicial (x0), una tolerancia (tol) y el número máximo de
%iteraciones (niter), dependiendo el método (met) elegido, ya sea el método
%de Jacobi (met=0) o el método de Gauss-Seidel (met=1).

function [val] = metodo_iterativo

    format long
    
    A=input('Ingrese la matriz de entrada (A):');
    b=input('Ingrese el vector de entrada (b):');
    x0=input('Ingrese el vector de condición inicial (x0):');
    met=input('\n¿Qué método de iteración se va a utilizar?\n 0.Jacobi\n 1.Gauss-Seidel\n');
    tol=input('Ingrese la tolerancia deseada:');
    niter=input('Ingrese el mayor numero de iteraciones deseadas:');
    
    c=0;
    iter(c+1)=c;
    E(c+1)=tol+1;
    error=E(c+1);
    xn=x0';
    
    while error>tol && c<niter
        x1=jacobi_gauss_seidel(x0,A,b,met);
        xn(c+2,:)=x1;
        %Error absoluto
        E(c+2)=norm(x1-x0,'inf');
        %Error relativo
        %E(c+2)=norm(x1-x0,'inf')/norm(x1,inf);
        error=E(c+2);
        x0=x1;
        c=c+1;
        iter(c+1)=c;
    end
    
    if error<tol
        s=x0;
        n=c;
        s,fprintf('Es una aproximación de la solución del sistema con una tolerancia de %f',tol);
        
    else 
        s=x0;
        n=c;
        fprintf('Fracasó en %d iteraciones',niter) 
    end
    
    var_names={'i','x1, x2, x3, x4...','Error'};
    val=table(iter',xn,E','VariableNames',var_names);
    
    %writetable(val,'Método Iterativo.xlsx','Sheet',1)
    
end