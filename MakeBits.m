function output_message= MakeBits(packet)

if isa(packet,"char")
    packet = double(packet);
end

% string_message = 'abcasdasd'; % Tutaj dac wiadomosc string
% input_message = double(string_message);

% input_message = [0xABCDEF1234,0x1234657,0x123123123];
input_message = packet;
output_message = [];


for numbers=1:length(input_message)

a=1;
b=8;
x= [];
y = input_message(numbers);

reminder = rem(nextpow2(y),8);



range = idivide(int32(nextpow2(y)),8,"round");



for i=1:range
    x= [x;bitget(y,a:b)];
    a= a+8;
    b= b+8;
end
x = flip(x,1);
wynik = [];
for i=1:size(x)
    number=0;
    for j=1:8
         number = number + (2^(j-1)*x(i,j));
    end
    wynik = [wynik,number];
end
numbers
output_message = [output_message,wynik];
end
