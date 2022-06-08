import MakeBits.*
import crc_generator.*
import crc_decoder.*

input_message = 'A CO TERAZ SIE STANIE?';
input_array = MakeBits(input_message);
[coded_message,crc] = crc_generator(input_array);
[x,y] = crc_decoder(coded_message);