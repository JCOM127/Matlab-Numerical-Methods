x = input('Enter the values for the vector X transpose: '); %[5000; 10000; 15000; 20000; 25000]
y = input('Enter the values for the vector Y transpose: '); %[2000; 1500; 1200; 1000; 900]

% Línea 3 y 4: Se solicita al usuario ingresar los valores de x e y.
% Los valores ingresados se asignan a las variables x e y respectivamente.

[Tabla] = Newtonint(x, y);

% Línea 6: Se llama a la función Newtonint pasando los vectores x e y como argumentos.
% La función Newtonint calculará la tabla de diferencias divididas y la asignará a la variable Tabla.

[pol] = Newtonor(x, diag(Tabla, +1));

% Línea 8: Se llama a la función Newtonor pasando el vector x y la diagonal superior de la tabla de diferencias divididas como argumentos.
% La función Newtonor calculará los coeficientes del polinomio interpolante y los asignará a la variable pol.

% Mostrar la matriz en forma de tabla
disp('Matrix of divided differences:');
disp(Tabla);

% Líneas 12 y 13: Se muestra la matriz de diferencias divididas en forma de tabla en la consola.

xx = linspace(min(x), max(x));

% Línea 15: Se crea un vector xx que contiene valores equiespaciados entre el valor mínimo y el valor máximo de x.

p = pol(1) * xx.^4 + pol(2) * xx.^3 + pol(3) * xx.^2 + pol(4) * xx + pol(5);

% Línea 17: Se evalúa el polinomio interpolante en los valores de xx utilizando los coeficientes pol(1), pol(2), pol(3), pol(4) y pol(5).
% El resultado se asigna a la variable p.

disp('Polynomial p:')
disp(['p = ', num2str(pol(1)), ' * x^4 + ', num2str(pol(2)), ' * x^3 + ', num2str(pol(3)), ' * x^2 + ', num2str(pol(4)), ' * x + ', num2str(pol(5))]);

% Líneas 20 y 21: Se muestra el polinomio p en la consola en el siguiente formato: p = <coeficiente1> * x^4 + <coeficiente2> * x^3 + <coeficiente3> * x^2 + <coeficiente4> * x + <coeficiente5>

% Prompt the user for the additional x value
additional_x = input('Enter the additional x value within the range 5000-25000: ');

% Calculate the additional y value by evaluating the polynomial at the additional x value
additional_y = polyval(pol, additional_x);

% Calculate the interpolation error
interpolation_error = additional_y - interp1(x, y, additional_x, 'linear');

figure
title('Newton interpolating polynomial')
xlabel('Altitude(ft)')
hold on
grid on
plot(x, y, 'ko', xx, p, 'b')
plot(additional_x, additional_y,'o', 'MarkerFaceColor', 'g', 'MarkerSize', 8) % Plot the additional point as a green "x"
hold off

% Líneas 24-29: Se crea una figura para el gráfico del polinomio interpolante.
% Se establece el título, las etiquetas de los ejes y se activa la cuadrícula.
% Luego se grafican los puntos (x, y) como puntos negros ('ko') y el polinomio p como una línea azul ('b').

disp('Additional Point:')
disp(['x = ', num2str(additional_x), ', y = ', num2str(additional_y)]);
