function [Tabla] = Newtonint(x,y)
    n=length(x);                % Obtiene la longitud del vector x
    Tabla=zeros(n,n+1);         % Crea una matriz de ceros de tamaño n x (n+1)
    Tabla(:,1)=x;               % Asigna el vector x a la primera columna de Tabla
    Tabla(:,2)=y;               % Asigna el vector y a la segunda columna de Tabla
    
    for j=3:n+1                 % Inicia un ciclo for desde j=3 hasta n+1
        for i=j-1:n             % Inicia un ciclo for desde i=j-1 hasta n
            Tabla(i,j)=(Tabla(i,j-1)-Tabla(i-1,j-1))/(Tabla(i,1)-Tabla(i-j+2,1));
            % Calcula el elemento Tabla(i,j) usando los elementos anteriores de la tabla.
            % El cálculo se realiza utilizando la fórmula de diferencias divididas de Newton.
        end
    end
end
