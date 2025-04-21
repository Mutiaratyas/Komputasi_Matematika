% % Program nested if: Rekomendasi Minuman
% clc
% clear
% disp('Rekomendasi Minuman');
% 
% cuaca = input('Bagaimana cuacanya? (panas/dingin): ', 's');
% waktu = input('Sekarang jam berapa? (pagi/siang/malam): ', 's');
% 
% if strcmpi(cuaca, 'panas')
%     if strcmpi(waktu, 'pagi')
%         disp('Rekomendasi: Es teh lemon atau infused water.');
%     elseif strcmpi(waktu, 'siang')
%         disp('Rekomendasi: Es kelapa muda atau jus buah segar.');
%     elseif strcmpi(waktu, 'malam')
%         disp('Rekomendasi: Air putih dingin atau milkshake.');
%     else
%         disp('Input waktu tidak valid.');
%     end
% elseif strcmpi(cuaca, 'dingin')
%     if strcmpi(waktu, 'pagi')
%         disp('Rekomendasi: Teh hangat atau susu jahe.');
%     elseif strcmpi(waktu, 'siang')
%         disp('Rekomendasi: Kopi hangat atau coklat panas.');
%     elseif strcmpi(waktu, 'malam')
%         disp('Rekomendasi: Susu hangat sebelum tidur.');
%     else
%         disp('Input waktu tidak valid.');
%     end
% else
%     disp('Input cuaca tidak valid.');
% end


% Program while sederhana: Menjumlahkan bilangan
disp('Program Penjumlah Bilangan');
disp('Masukkan bilangan satu per satu. Ketik -1 untuk berhenti.');

jumlah = 0; % inisialisasi total jumlah
angka = 0;  % inisialisasi angka input user

while angka ~= -1
    angka = input('Masukkan bilangan: ');
    if angka ~= -1
        jumlah = jumlah + angka;
    end
end

fprintf('Total jumlah bilangan yang dimasukkan: %d\n', jumlah);