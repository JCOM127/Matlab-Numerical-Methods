x = input('Enter the values for the vector X without transposing: '); %[5000 10000 15000 20000 25000]
y = input('Enter the values for the vector Y without transposing: '); %[2000 1500 1200 1000 900]

V = vander(x); % Crea la matriz de Vandermonde
a = V \ y'; % Resuelve el sistema de ecuaciones lineales

additional_x = input('Enter the adicional value of x: ');
additional_y = polyval(a, additional_x); % Calcula el valor y correspondiente al punto adicional

n = length(a); % Obtiene el número de coeficientes
xx = linspace(min(x), max(x)); % Genera un vector de puntos equidistantes en el rango de x
yy = a(1) * xx.^4 + a(2) * xx.^3 + a(3) * xx.^2 + a(4) * xx + a(5); % Calcula los valores de y correspondientes a los puntos en xx

disp("Matrix of Vandermonde:"); % Muestra la matriz de Vandermonde en la consola
disp(table(V));

fprintf("interpolating polynomial:\n");
polynomial_str = "";
for i = 1:n-1
    polynomial_str = polynomial_str + sprintf("(%g * x^%d)", a(i), n-i);
    if i < n-1
        polynomial_str = polynomial_str + " + ";
    end
end
polynomial_str = polynomial_str + sprintf(" + %g", a(n));
disp(polynomial_str);

figure;
title('Vandermonde Interpolation'); % Establece el título del gráfico
xlabel('Altitude (ft)'); % Etiqueta del eje x
ylabel('Fuel (L)'); % Etiqueta del eje y
hold on;
grid on;

scatter(x, y, 'ko'); % Agrega los puntos iniciales al gráfico
scatter(additional_x, additional_y, 'ro'); % Agrega el punto adicional al gráfico

plot(xx, yy, 'b'); % Traza la curva de interpolación en azul
