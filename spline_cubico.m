x = input('Enter the values for the vector X transpose: '); %[5000; 10000; 15000; 20000; 25000]
y = input('Enter the values for the vector Y transpose: '); %[2000; 1500; 1200; 1000; 900]

% Llamada a la función Spline para obtener los coeficientes de interpolación
[coeficientes] = Spline(x, y, 3)

% Definición de los puntos x para evaluar los polinomios de interpolación
xpol1 = 5000:0.001:10000;
xpol2 = 10000:0.001:15000;
xpol3 = 15000:0.001:20000;
xpol4 = 20000:0.001:25000;

% Cálculo de los valores de los polinomios de interpolación
p1 = coeficientes(1,1)*xpol1.^3 + coeficientes(1,2)*xpol1.^2 + coeficientes(1,3)*xpol1 + coeficientes(1,4);
p2 = coeficientes(2,1)*xpol2.^3 + coeficientes(2,2)*xpol2.^2 + coeficientes(2,3)*xpol2 + coeficientes(2,4);
p3 = coeficientes(3,1)*xpol3.^3 + coeficientes(3,2)*xpol3.^2 + coeficientes(3,3)*xpol3 + coeficientes(3,4);
p4 = coeficientes(4,1)*xpol4.^3 + coeficientes(4,2)*xpol4.^2 + coeficientes(4,3)*xpol4 + coeficientes(4,4);

% Creación de la figura para el gráfico
figure
title('interpolating polynomial Cubic Spline');
xlabel('Altitude(ft)');
ylabel('Fuel(L)');
hold on;
grid on;

% Graficar los puntos originales y los polinomios de interpolación
plot(x, y, 'ko', xpol1, p1, 'b', xpol2, p2, 'b', xpol3, p3, 'b', xpol4, p4, 'b')

% Impresión de los polinomios de interpolación en la consola
disp('interpolating polynomials:')
disp(['P1: ', num2str(coeficientes(1,1)), '*x^3 + ', num2str(coeficientes(1,2)), '*x^2 + ', num2str(coeficientes(1,3)), '*x + ', num2str(coeficientes(1,4))])
disp(['P2: ', num2str(coeficientes(2,1)), '*x^3 + ', num2str(coeficientes(2,2)), '*x^2 + ', num2str(coeficientes(2,3)), '*x + ', num2str(coeficientes(2,4))])
disp(['P3: ', num2str(coeficientes(3,1)), '*x^3 + ', num2str(coeficientes(3,2)), '*x^2 + ', num2str(coeficientes(3,3)), '*x + ', num2str(coeficientes(3,4))])
disp(['P4: ', num2str(coeficientes(4,1)), '*x^3 + ', num2str(coeficientes(4,2)), '*x^2 + ', num2str(coeficientes(4,3)), '*x + ', num2str(coeficientes(4,4))])

x_extra = input('Enter the value for the additional point: ');

if x_extra >= 5000 && x_extra <= 25000
    if x_extra >= x(1) && x_extra <= x(end)
        segment_index = find(x <= x_extra, 1, 'last');
        y_extra = coeficientes(segment_index,1)*x_extra^3 + coeficientes(segment_index,2)*x_extra^2 + coeficientes(segment_index,3)*x_extra + coeficientes(segment_index,4);
        fprintf("Interpolated value at x = %.4f: y = %.4f\n", x_extra, y_extra);
        plot(x_extra, y_extra, 'ro');
        
    else
        fprintf("The additional point is outside the range of interpolation.\n");
    end

end
