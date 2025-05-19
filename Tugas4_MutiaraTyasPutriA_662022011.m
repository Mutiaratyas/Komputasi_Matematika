% %1. Plot Fungsi Kuadrat
% x = -10:0.1:10;
% y = x.^2 - 5*x + 6;
% plot(x, y, 'LineWidth', 2);
% title('Grafik Fungsi Kuadrat');
% xlabel('x'); ylabel('y');
% grid on;
% 
% %2. Plot Fungsi Trigonometri (Sinus & Cosinus)
% figure ; 
% x = 0:0.1:2*pi;
% y1 = sin(x);
% y2 = cos(x);
% plot(x, y1, 'r', x, y2, 'b--', 'LineWidth', 2);
% legend('sin(x)', 'cos(x)');
% title('Grafik Sinus dan Cosinus');
% xlabel('x'); ylabel('y');
% grid on;
% 
% %3. Histogram Data Acak Normal
% figure;
% data = randn(1,1000);
% hist(data, 30);
% title('Histogram Data Acak Normal');
% xlabel('Nilai'); ylabel('Frekuensi');
% grid on;
% 
% %4. Boxplot Data Random
% figure;
% data = [randn(100,1)+5; randn(100,1)+10];
% group = [repmat({'Grup 1'},100,1); repmat({'Grup 2'},100,1)];
% boxplot(data, group);
% title('Boxplot Dua Grup Data');
% grid on;
% 
% %5. Plot 3D Permukaan (Surface Plot)
% [x, y] = meshgrid(-5:0.25:5, -5:0.25:5);
% z = sin(sqrt(x.^2 + y.^2));
% surf(x, y, z);
% title('Grafik Permukaan 3D');
% xlabel('x'); ylabel('y'); zlabel('z');
% 
% %6. Contour Plot
% figure;
% [x, y] = meshgrid(-3:0.1:3, -3:0.1:3);
% z = peaks(x, y);
% contour(x, y, z, 20);
% colorbar;
% title('Contour Plot');
% xlabel('x'); ylabel('y');
% 
% %7. Scatter Plot (Sebaran Titik)
% figure;
% x = randn(100,1);
% y = 2*x + randn(100,1);
% scatter(x, y, 50, 'filled');
% title('Scatter Plot');
% xlabel('x'); ylabel('y');
% grid on;
% 
% %8. Bar Chart (Diagram Batang)
% figure;
% data = [5, 8, 2, 6, 9];
% bar(data);
% title('Diagram Batang');
% xlabel('Kategori'); ylabel('Nilai');
% xticklabels({'A','B','C','D','E'});
% 
% %9. Plot Banyak Fungsi dalam Subplot
% figure;
% x = linspace(0, 2*pi, 100);
% y1 = sin(x);
% y2 = cos(x);
% y3 = tan(x);
% subplot(3,1,1); plot(x, y1); title('sin(x)');
% subplot(3,1,2); plot(x, y2); title('cos(x)');
% subplot(3,1,3); plot(x, y3); title('tan(x)');
% 
% %10. Polar Plot
% figure;
% theta = linspace(0, 2*pi, 100);
% rho = abs(sin(3*theta));
% polar(theta, rho);
% title('Polar Plot: |sin(3?)|');

% %11. Heatmap (Peta Panas)
% data = randi(100, 5, 5);
% imagesc(data);             
% colormap('hot');            
% colorbar;                 
% title('Heatmap menggunakan imagesc()');
% 
% %12. Stem Plot (Grafik Batang Diskrit)
% x = 0:0.5:10;
% y = sin(x);
% stem(x, y, 'filled');
% title('Stem Plot');
% xlabel('x'); ylabel('sin(x)');
% grid on;
% 
% %13. Pie Chart (Diagram Lingkaran)
% data = [30, 25, 20, 15, 10];
% labels = {'A','B','C','D','E'};
% pie(data, labels);
% title('Pie Chart');
% 
% %14. Area Plot (Diagram Luas)
% x = 1:10;
% y = cumsum(rand(1,10));
% area(x, y);
% title('Area Plot');
% xlabel('x'); ylabel('Kumulatif Nilai');
% 
% %15. Stairs Plot (Tangga Diskrit)
% x = 0:10;
% y = mod(x, 3);
% stairs(x, y, 'LineWidth', 2);
% title('Stairs Plot');
% xlabel('x'); ylabel('mod(x,3)');
% 
% %16. Quiver Plot (Vektor Panah 2D)
% [x, y] = meshgrid(-2:0.5:2, -2:0.5:2);
% u = -y;
% v = x;
% quiver(x, y, u, v);
% title('Quiver Plot (Vektor Arah)');
% axis equal;
% 
% %17. Error Bar Plot
% x = 1:10;
% y = rand(1,10)*10;
% e = rand(1,10);
% errorbar(x, y, e, 'o');
% title('Error Bar Plot');
% xlabel('x'); ylabel('y');
% grid on;
% 
% %18. 3D Line Plot
% t = 0:0.1:10;
% x = sin(t);
% y = cos(t);
% z = t;
% plot3(x, y, z, 'LineWidth', 2);
% title('3D Line Plot');
% xlabel('x'); ylabel('y'); zlabel('z');
% grid on;
% 
% %19. Filled Contour Plot
% [x, y] = meshgrid(-3:0.1:3, -3:0.1:3);
% z = peaks(x, y);
% contourf(x, y, z, 20);
% colorbar;
% title('Filled Contour Plot');
% 
% %20. Log-Log Plot
% x = logspace(0.1, 2, 100);
% y = x.^2;
% loglog(x, y, 'LineWidth', 2);
% title('Log-Log Plot');
% xlabel('log(x)'); ylabel('log(y)');
% grid on;

%21. 