function [values, answer] = crc_decoder(packet)
answer = [];

for i = 1:length(packet)

    bin = dec2bin(packet(i));
    num = 9;
    value = bitget(packet(i),17:24);
    value = fliplr(value);
    str = num2str(value);                  %Czary mary zebym mogl wybierac interesujace
    value = bin2dec(str);                  % mnie indeksy w liczbie binarnej
    bit_part = bitget(packet(i),num:24);
    bit_part = fliplr(bit_part);
    str = num2str(bit_part);
    crc = bin2dec(str);

    for bit = 1:8
        if bitand( crc, hex2dec('8000') )    
          crc = bitxor( bitshift(crc,1) + bitget(packet(i),num-1) , hex2dec('1021') ); 
        else
          crc = bitshift(crc,1) + bitget(packet(i),num-1);
        end
        crc = bitand( crc, hex2dec('ffff') );  
        num = num-1;
    end
    answer(i) = crc;
    values(i) = value;
end


