
%Definisikan fungsi
f = inline('x^2-3','x');
%interval [1,2]
X = [1 , 2]

%Panggil fungsi BagiDua
%[x,galat] = Bagidua(f,X);
[x,galat] = PosisiPalsu(f,X);
disp(x) 
disp(galat)