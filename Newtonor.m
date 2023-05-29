function [pol] = Newtonor(x,coef)
    n=length(x);  % Obtiene la longitud del vector 'x' y lo asigna a la variable 'n'
    pol=1;  % Inicializa la variable 'pol' con el valor 1
    acum=pol;  % Inicializa la variable 'acum' con el valor de 'pol' (1)
    pol=coef(1)*acum;  % Calcula el primer término del polinomio multiplicando el coeficiente correspondiente por 'acum'
    for i=1:n-1  % Itera desde 1 hasta n-1
        pol=[0 pol];  % Agrega un cero al principio del vector 'pol'
        acum=conv(acum,[1 -x(i)]);  % Realiza la convolución de 'acum' con el polinomio [1 -x(i)] y asigna el resultado a 'acum'
        pol=pol+coef(i+1)*acum;  % Calcula el siguiente término del polinomio multiplicando el coeficiente correspondiente por 'acum' y sumándolo a 'pol'
    end
    
end
