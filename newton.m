%Newton: Ingresa la funcion f(x), el valor inicial (x0), la tolerancia
%del error (tol) y el numero de iteraciones deseado (iter).

function [val] = newton
    
    format long 
    
    syms x

    f=input('Ingrese la funcion f(x):');
    tol=input('Ingrese la tolerancia deseada:');
    iter=input('Ingrese el maximo numero de iteraciones deseadas:');
    
    fplot(f), grid on
    %saveas(gcf,'Newton.fig');
    
    x0=input('Ingrese el valor inicial (x0):');
    
        df=diff(f);
        c=0;
        fm(c+1)=eval(subs(f,x0));
        fe=fm(c+1);
        dfm=eval(subs(df,x0));
        dfe=dfm;
        dfmn(c+1)=dfe;
        n(c+1)=c;
        E(c+1)=tol+1;
        error=E(c+1);
        xn=x0;
        xmn(c+1)=xn;
        
        while error>tol && dfe~=0 && c<iter
            xn=x0-(fe/dfe);
            xmn(c+2)=xn;
            fm(c+2)=eval(subs(f,xn));
            fe=fm(c+2);
            dfm=eval(subs(df,xn));
            dfmn(c+2)=dfm;
            dfe=dfm;
            %Dec. Correctos:
            E(c+2)=abs(xn-x0);
            %Cifras significativas:
            %E(c+2)=abs((xn-x0)/xn);
            error=E(c+2);
            x0=xn;
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
           fprintf('%f es la aproxiamcion de una raiz de la funcion f(x) con tolerancia de %f',x0,tol)

        elseif dfe==0
           s=x0;
           i=c;
           fprintf('%f es posiblemente una raiz multiple de la funcion f(x)',x0)
        
        else 
           s=x0;
           i=c;
           fprintf('Fracaso en %d iteraciones',iter) 
        end

    var_names={'n','xmn','fm','Error'};
    val=table(n',xmn',fm',E','VariableNames',var_names);
    
    %writetable(val,'Newton.xlsx','Sheet',1)
    
end