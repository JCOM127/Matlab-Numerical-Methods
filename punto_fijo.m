%Punto Fijo: Se ingresan las funciones f(x) y g(x) derivada de f(x),
% el valor inicial deseado (x0),la tolerancia del error (tol) y el numero 
% de iteraciones deseado (iter).

function [val] = punto_fijo
    
    format long
    
    syms x
    
    f=input('Ingrese la funcion f(x):');
    tol=input('Ingrese la tolerancia deseada:'); 
    iter=input('Ingrese el numero maximo de iteraciones deseado:'); 
    g=input('Ingrese la funcion g(x):');

    fplot([f g]), grid on
    %saveas(gcf,'Punto Fijo.fig');
    
    x0=input('Ingrese el valor inicial (x0):');
        
        c=0;
        fm(c+1)=eval(subs(f,x0));
        fe=fm(c+1);
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        xn=x0;
        xmn(c+1)=xn;
        
        while error>tol && fe~=0 && c<iter
            xn=eval(subs(g,x0));
            xmn(c+2)=xn;
            fm(c+2)=eval(subs(f,xn));
            fe=fm(c+2);
            %Dec. Correctos:
            %E(c+2)=abs(xn-x0);
            %Cifras significativas:
            E(c+2)=abs((xn-x0)/xn);
            error=E(c+2);
            x0=xn;
            c=c+1;
            n(c+1)=c;
        end
        
        if fe==0
           i=c;
           fprintf('%f es raiz de la funcion f(x)',x0) 
        
        elseif error<tol
           i=c;
           fprintf('%f es la aproximacion de una raiz de la funcion f(x) con tolerancia de %f',x0,tol)
        
        else 
           i=c;
           fprintf('Fracaso en %d iteraciones',iter) 
        end

    var_names={'n','xmn','fm','Error'};
    val=table(n',xmn',fm',E','VariableNames',var_names);
    
    %writetable(val,'Punto Fijo.xlsx','Sheet',1)
    
end