%Mutiara Tyas 662022011

%Soal nomor 1
function semua_iterasi()

    A = [10 -1 2 0;
        -1 11 -1 3;
         2 -1 10 -1;
         0 3 -1 8];
    b = [6; 25; 11; 15];
    X0 = zeros(4,1);
    N = 100;
    tol = 1e-6;

    disp('   Penyelesaian dengan Jacobi')
    disp('===============================')
    jacobi(A, b, X0, N, tol);

    disp(' Penyelesaian dengan Gauss-Seidel')
    disp('===============================')
    gauseid(A, b, X0, N, tol);
end
%METODE JACOBI
function X = jacobi(A, b, X0, N, tol)

    % Input:
    % A   = matriks koefisien dari sistem
    % b   = vektor konstan
    % X0  = tebakan awal
    % N   = maksimum iterasi
    % tol = toleransi keakuratan
    
    % Output:
    % X = solusi pendekatan dari sistem

    if nargin < 5, tol = 1e-6; end
    if nargin < 4, N = 1000; end
    if nargin < 3, X0 = zeros(size(b)); end

    n = size(A, 1);
    X = X0;
    P = zeros(n, n);
    Q = zeros(n, 1);

    % Membentuk matriks P dan vektor Q
    for i = 1:n
        for j = 1:n
            if j ~= i
               P(i, j) = A(i, j) / A(i, i);
            end
         end
         Q(i) = b(i) / A(i, i);
     end

    k = 1;
    norma = inf;

    % Iterasi Jacobi
    while k <= N && norma > tol
        X_new = Q - P * X;
        norma = max(abs(X_new - X));
        X = X_new;
        k = k + 1;
    end
    fprintf('Metode Jacobi Selesai dalam %d iterasi dengan toleransi %.1e\n', k-1, tol);
    disp('Solusi hampiran:');
    disp(X);
end

%METODE GAUSS-SEIDEL
function X = gauseid(A, b, X0, N, tol)

% Input:
%   A   = matriks koefisien
%   b   = vektor konstanta
%   X0  = tebakan awal (default: nol)
%   N   = maksimum iterasi (default: 1000)
%   tol = toleransi error (default: 1e-6)

% Output:
% X = solusi pendekatan
    if nargin < 5, tol = 1e-6; end
    if nargin < 4, N = 1000; end
    if nargin < 3, X0 = zeros(size(b)); end

    n = size(A,1);
    X = X0;
    k = 1;
    norma = 1;

    while k <= N && norma > tol
        for i = 1:n
            % Hitung sigma: penjumlahan untuk elemen-elemen lain
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i,j) * X(j);
                end
            end
            X(i) = (b(i) - sigma) / A(i,i);
        end
        norma = max(abs(X - X0));
        X0 = X;
        k = k + 1;
    end
    fprintf('Metode Gauss-Seidel Selesai dalam %d iterasi dengan toleransi %.1e\n', k-1, tol);
    disp('Solusi hampiran:');
    disp(X);
end

%comment code soal nomor 1 terlebih dahulu
%Soal nomor 2
function hitung_luas()

    % Fungsi yang ingin diintegrasikan
    f = @(x) 2*x.^3;

    % Batas interval
    a = 0;
    b = 1;

    % Lebar langkah
    h = 0.1;

    % Jumlah subinterval
    n = (b - a) / h;

    % Panggil aturan trapesium
    Tn = trapesium(f, [a b], n);
    
    % Panggil jumlahan riemann
    Rn = riemann(f, a, b, h);

    fprintf('Hasil integrasi dengan aturan trapesium: %.6f\n', Tn);
    fprintf('Hasil integrasi dengan jumlahan Riemann: %.6f\n', Rn);
end

% Fungsi aturan trapesium
function Tn = trapesium(f, x, n)
    h = (x(2) - x(1)) / n;
    xvek = x(1):h:x(2);
    yvek = f(xvek);
    Tn = h/2 * (yvek(1) + 2*sum(yvek(2:end-1)) + yvek(end));
end

% Fungsi Riemann (gunakan titik tengah/kanan/kiri sesuai kebutuhan)
function Rn = riemann(f, a, b, h)
    x_riem = a:h:(b - h); % titik kiri (untuk Riemann kiri)
    % x_riem = a + h/2 : h : b - h/2; % titik tengah
    % x_riem = a + h : h : b; % titik kanan
    y = f(x_riem);
    Rn = sum(y) * h;
end

