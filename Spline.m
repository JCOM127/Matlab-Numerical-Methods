%Spline: Calcula los coeficienetes de los polinomios de interpolación de
% grado d (1, 2, 3) para el conjunto de n datos (x,y), 
% mediante el método spline.
function [Tabla] = Spline(x,y,d)
    
    n=length(x); % Número de datos
    
    % Inicialización de matrices
    A=zeros((d+1)*(n-1)); % Matriz A de coeficientes
    b=zeros((d+1)*(n-1),1); % Vector b de términos independientes
    
    % Cálculo de potencias de x
    cua=x.^2; % x^2
    cub=x.^3; % x^3
    
    %% lineal
    if d==1
        c=1;
        h=1;
        for i=1:n-1
            % Llenar la matriz A con los coeficientes para cada intervalo
            A(i,c)=x(i);
            A(i,c+1)=1;
            % Llenar el vector b con los valores de y para cada intervalo
            b(i)=y(i);
            c=c+2;
            h=h+1;
        end
        
        c=1;
        for i=2:n
            % Llenar la matriz A con los coeficientes para cada intervalo (continuación)
            A(h,c)=x(i);
            A(h,c+1)=1;
            % Llenar el vector b con los valores de y para cada intervalo (continuación)
            b(h)=y(i);
            c=c+2;
            h=h+1;
        end
    %% Cuadratic
    elseif d==2
        c=1;
        h=1;
        for i=1:n-1
            % Llenar la matriz A con los coeficientes para cada intervalo
            A(i,c)=cua(i);
            A(i,c+1)=x(i);
            A(i,c+2)=1;
            % Llenar el vector b con los valores de y para cada intervalo
            b(i)=y(i);
            c=c+3;
            h=h+1;
        end
        
        c=1;
        for i=2:n
            % Llenar la matriz A con los coeficientes para cada intervalo (continuación)
            A(h,c)=cua(i);
            A(h,c+1)=x(i);
            A(h,c+2)=1;
            % Llenar el vector b con los valores de y para cada intervalo (continuación)
            b(h)=y(i);
            c=c+3;
            h=h+1;
        end
        
        c=1;
        for i=2:n-1
            % Agregar restricciones adicionales para asegurar la continuidad de la segunda derivada
            A(h,c)=2*x(i);
            A(h,c+1)=1;
            A(h,c+3)=-2*x(i);
            A(h,c+4)=-1;
            b(h)=0;
            c=c+4;
            h=h+1;
        end
        
        % Agregar condiciones de frontera
        A(h,1)=2;
        b(h)=0;
        
  %% Cubic
    elseif d==3
        c=1;
        h=1;
        for i=1:n-1
            % Llenar la matriz A con los coeficientes para cada intervalo
            A(i,c)=cub(i);
            A(i,c+1)=cua(i);
            A(i,c+2)=x(i);
            A(i,c+3)=1;
            % Llenar el vector b con los valores de y para cada intervalo
            b(i)=y(i);
            c=c+4;
            h=h+1;
        end
        
        c=1;
        for i=2:n
            % Llenar la matriz A con los coeficientes para cada intervalo (continuación)
            A(h,c)=cub(i);
            A(h,c+1)=cua(i);
            A(h,c+2)=x(i);
            A(h,c+3)=1;
            % Llenar el vector b con los valores de y para cada intervalo (continuación)
            b(h)=y(i);
            c=c+4;
            h=h+1;
        end
        
        c=1;
        for i=2:n-1
            % Agregar restricciones adicionales para asegurar la continuidad de la segunda y tercera derivada
            A(h,c)=3*cua(i);
            A(h,c+1)=2*x(i);
            A(h,c+2)=1;
            A(h,c+4)=-3*cua(i);
            A(h,c+5)=-2*x(i);
            A(h,c+6)=-1;
            b(h)=0;
            c=c+4;
            h=h+1;
        end
        
        c=1;
        for i=2:n-1
            % Agregar restricciones adicionales para asegurar la continuidad de la tercera derivada
            A(h,c)=6*x(i);
            A(h,c+1)=2;
            A(h,c+4)=-6*x(i);
            A(h,c+5)=-2;
            b(h)=0;
            c=c+4;
            h=h+1;
        end
        
        % Agregar condiciones de frontera
        A(h,1)=6*x(1);
        A(h,2)=2;
        b(h)=0;
        h=h+1;
        A(h,c)=6*x(end);
        A(h,c+1)=2;
        b(h)=0;
    end

    % Resolver el sistema de ecuaciones lineales
    val=inv(A)*b;
    
    % Reorganizar los coeficientes en una tabla
    Tabla=reshape(val,d+1,n-1);
    Tabla=Tabla';
end
