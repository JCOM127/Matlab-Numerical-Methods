%Método de Relajación: Calcula la solución de un sistema de ecuaciones Ax=b
%con base en una condición inicial (x0) mediante el método Gauss-Seidel
%utilizando un valor de relajación (w) entre cero (0) y dos (2).

function [val] = metodo_de_relajacion

    format long
    
    A=input('Ingrese la matriz de entrada (A):');
    b=input('Ingrese el vector de entrada (b):');
    tol=input('Ingrese la tolerancia deseada:');
    niter=input('Ingrese el numero maximo de iteraciones deseadas:');
    x0=input('Ingrese el vector de condición inicial (x0):');
    w=input('Ingrese el valor de relajación (w):');
    
    c=0;
    iter(c+1)=c;
    E(c+1)=tol+1;
    error=E(c+1);
    xn=x0';
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,+1);
    
    while error>tol && c<niter
        T=inv(D-w*L)*((1-w)*D+w*U);
        C=w*inv(D-w*L)*b;
        x1=T*x0+C;
        xn(c+2,:)=x1;
        E(c+2)=norm(x1-x0,'inf');
        %E(c+2)=norm(x1-x0,'inf')/norm(x1,inf);
        error=E(c+2);
        x0=x1;
        c=c+1;
        iter(c+1)=c;
    end
    
    if error<tol
        s=x0;
        n=c;
        s,fprintf('Es una aproximación de la solución del sistema con una tolerancia de %f',tol)
    
    else 
        s=x0;
        n=c;
        fprintf('Fracasó en %d iteraciones',niter) 
    end
   
    var_names={'i','x','Error'};
    val=table(iter',xn,E','VariableNames',var_names);
    
    %writetable(val,'Método de Relajación.xlsx','Sheet',1)
    
end