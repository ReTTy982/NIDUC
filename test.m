import crc_generator.*
import crc_decoder.*

input_array = [];
coded_message = [];
input_message = 'Co to jest wyczysc kanwe?';
%input_array = [32,24,15,16,17,49,85,46,23,456,48]

for i=1:length(input_message)
   input_array(i) = input_message(i);
end




crc =  crc_generator( input_array) ;


for i=1:length(crc)
    coded_message(i) = bitshift(input_array(i),16);
    coded_message(i) = coded_message(i) + crc(i);
end

for i=1:length(crc)
    if(randi(5,1)==1)
        unlucky_message = coded_message(i);
        unlucky_message = dec2bin(unlucky_message);
        random_index = randi(length(unlucky_message),1);
        if(unlucky_message(random_index)==0)
            unlucky_message(random_index) =1;
            '0111 0100 0011 1110 0001 0011'
        else
            unlucky_message(random_index) = 0;
        end
        coded_message(i) = bin2dec(unlucky_message);
    end
end




[decoded_message, rem] = crc_decoder(coded_message);


disp("KOD CRD PODAWANY JEST SZESNASTKOWO");
for i=1:length(crc)
    disp("VALUE: " + input_array(i));
    disp("ASCII: " + char(input_array(i)));
    disp("CRC " + dec2hex(crc(i)) );
    disp("Pełny kod: " + dec2bin(input_array(i)) );
    disp("Reszta: " + rem(i));
    disp("Odkodowana wartość: " + decoded_message(i));
    disp("Odkodowany znak ASCII: " + char(decoded_message(i)) + newline)
end


message = '';
for i=1:length(decoded_message)
    message(i) = char(decoded_message(i));
end
disp("Wiadomosc: " + message);






