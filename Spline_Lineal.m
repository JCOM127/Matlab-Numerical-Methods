x = input('Enter the values for the vector X transpose: '); %[5000; 10000; 15000; 20000; 25000]
y = input('Enter the values for the vector y transpose: '); %[2000; 1500; 1200; 1000; 900]

% El usuario ingresa los valores de x e y como vectores traspuestos

[coeficientes] = Spline(x, y, 1);

% Se calculan los coeficientes del spline lineal llamando a la función "Spline" con los vectores x e y, y un parámetro adicional de 1

xpol1 = 5000:0.001:10000;
xpol2 = 10000:0.001:15000;
xpol3 = 15000:0.001:20000;
xpol4 = 20000:0.001:25000;

% Se definen los valores de x en los que se evaluarán los polinomios de interpolación

p1 = coeficientes(1, 1) * xpol1 + coeficientes(1, 2);
p2 = coeficientes(2, 1) * xpol2 + coeficientes(2, 2);
p3 = coeficientes(3, 1) * xpol3 + coeficientes(3, 2);
p4 = coeficientes(4, 1) * xpol4 + coeficientes(4, 2);

% Se calculan los valores de y correspondientes a los polinomios de interpolación evaluados en los valores de x definidos anteriormente

figure;
title('interpolating polynomial Linear Spline');
xlabel('Altitude(ft)');
ylabel('Fuel(L)');
hold on;
grid on;

% Se crea una nueva figura y se configuran las etiquetas de los ejes

plot(x, y, 'ko', xpol1, p1, 'b', xpol2, p2, 'b', xpol3, p3, 'b', xpol4, p4, 'b');

% Se traza el gráfico de dispersión de los puntos (x, y) como puntos negros ("ko"),
% y se trazan las líneas de los polinomios de interpolación usando los valores de x y p calculados previamente

fprintf("interpolating polynomials:\n");
for i = 1:size(coeficientes, 1)
    fprintf("Segmento %d: y = %.4f * x + %.4f\n", i, coeficientes(i, 1), coeficientes(i, 2));
end

% Se muestra por consola los polinomios de interpolación para cada segmento, en la forma y = mx + b, donde m es el coeficiente de la pendiente y b es el término independiente


x_extra = input('Enter the value for the additional point: ');

if x_extra >= x(1) && x_extra <= x(end)
    segment_index = find(x <= x_extra, 1, 'last');
    y_extra = coeficientes(segment_index, 1) * x_extra + coeficientes(segment_index, 2);
    fprintf("Interpolated value at x = %.4f: y = %.4f\n", x_extra, y_extra);
    plot(x_extra, y_extra, 'ro');
else
    fprintf("The additional point is outside the range of interpolation.\n");
end
