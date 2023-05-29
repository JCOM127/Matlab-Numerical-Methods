%Newton (Raices Multiples): Ingresa la funcion f(x), el valor inicial (x0),
%la tolerancia del error (tol) y el numero de iteraciones deseadas (iter).

function [val] = newton_2
    
    format long
    
    syms x

    f=input('Ingrese la funcion f(x):');
    tol=input('Ingrese la tolerancia deseada:');
    iter=input('Ingrese el maximo numero de iteraciones deseadas:');
   
    fplot(f), grid on
    %saveas(gcf,'Newton_m2.fig');
    
    x0=input('Ingrese el valor inicial (x0):');
    
        df=diff(f);
        ddf=diff(df);
        c=0;
        fm(c+1)=eval(subs(f,x0));
        fe=fm(c+1);
        dfm(c+1)=eval(subs(df,x0));
        dfe=dfm(c+1);
        ddfm(c+1)=eval(subs(ddf,x0));
        ddfe=ddfm(c+1);
        den=(dfe^2)-(fe*ddfe);
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        xn(c+1)=x0;
                
        while error>tol && fe~=0 && den~=0 && c<iter
            xn(c+2)=x0-(fe*dfe/den);
            fm(c+2)=eval(subs(f,xn(c+2)));
            fe=fm(c+2);
            dfm(c+2)=eval(subs(df,xn(c+2)));
            dfe=dfm(c+2);
            ddfm(c+2)=eval(subs(ddf,xn(c+2)));
            ddfe=ddfm(c+2);
            den=(dfe^2)-(fe*ddfe);
            E(c+2)=abs(xn(c+2)-x0);
            %E(c+2)=abs((xn(c+2)-x0)/xn(c+2));
            error=E(c+2);
            x0=xn(c+2);
            c=c+1;
            n(c+1)=c;
        end
        
        if fe==0
           s=x0;
           i=c;
           fprintf('%f es raiz de la funcion f(x)',x0)

        elseif error<tol
           s=x0;
           i=c;
           fprintf('%f es la aproximacion de una raiz de la funcion f(x) con tolerancia de %f',x0,tol)

        elseif dfe==0
           s=x0;
           i=c;
           fprintf('%f es posiblemente una raiz multiple de la funcion f(x)',x0)
        
        else 
           s=x0;
           i=c;
           fprintf('Fracaso en %d iteraciones',iter) 
        end

    var_names={'n','xn','fm','Error'};
    val=table(n',xn',fm',E','VariableNames',var_names);
    
    %writetable(val,'Newton_m2.xlsx','Sheet',1)
    
end