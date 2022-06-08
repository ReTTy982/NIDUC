function [coded_message,answer_temp]= crc_generator(packet)

coded_message = [];
crc = 0;
for i = 1:length(packet)
    crc = bitxor( crc, bitshift(packet(i),8) ); %dostaje pierwsze 8 bitow do XORowania
    for bit = 1:8
        if bitand( crc, hex2dec('8000') )     % Sprawdzenie czy jestesmy na najstarszej pozycji
          crc = bitxor( bitshift(crc,1), hex2dec('1021') ); %17 bitow wiec trzeba jedno zero dodac na koniec
        else
          crc = bitshift(crc,1);
        end
        crc = bitand( crc, hex2dec('ffff') );  % obcinam msb bo wczesniej tylko przez 4 bajty xorowalem
    end
    answer_temp(i) = crc;
end

for i=1:length(answer_temp)
    coded_message(i) = bitshift(packet(i),16);
    coded_message(i) = coded_message(i) + answer_temp(i);
end








