% Praktikum 3 Mutiara Tyas 662022011
% clc
% clear
% 
% n = input ('nilai:');
% if n>70
%     disp('anda lulus');
% end
% disp('coba lagi');

% n = input('nilai: ');
% if n>70 
%     disp('anda lulus');
% else 
%     disp('coba lagi');
% end

% if..elseif..elseif..end
% n = input('tinggi: ');
% if n >= 190
%     disp('sangat tinggi');
% elseif n >= 160 && n < 190
%     disp('cukup tinggi');
% elseif n < 160
%     disp('pendek');
% else 
%     disp ('mini');
% end 

% nested if
% tugas

% switch
% hitungan = input ('operasi: ');
% a = 2;
% b = 3;
% switch hitungan
%     case 1
%         y = a+b
%     case 2
%         y = a-b
%     case 3 
%         y = a*b
%     otherwise
%         disp('bukan pilihan');
% end 

%loop
% for 1
% for muti = 1:10
%     disp(muti);
% end

% contoh 2
% a = 0;
% for i = 1:5
%     a = a+i;
% end
% disp(a)

% continue
% a= 0;
% for i = 1:5
%     if i ==2
%         continue
%     else 
%         a = a+i;
%     end
% end
% disp(a)

% break
for i=1:10
    if i==5
        break
    else
        disp(i);
    end
end