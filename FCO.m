clear
n = 15; %Dlugosc slowa
k = 11; %Dlugosc bitow informacji

%Jedyna manualna czesc programu
%Wypisane sa tutaj wszystkie pozycje nie bedace potega 2, binarnie
A = [1 1 1 1;1 1 1 0;1 1 0 1;1 1 0 0;1 0 1 1;1 0 1 0;
    1 0 0 1;0 1 1 1;0 1 1 0;0 1 0 1;0 0 1 1]; 

G = [ eye(k) A];   %Macierz generatora G
H = [ A' eye(n-k)]; %Macierz parzystości H

%msg = [] manualnie
msg = randi([0 1],1,11)

%---KODOWANIE WIADOMOSCI---%
code = mod(msg*G,2) %Wysłany kod

code(7) = ~code(7); %Powodowanie bledu na pozycji i


%---DEKODOWANIE WIADOMOSCI---%

recived_code = code %odebrany kod
syndrome = mod(recived_code * H',2) %Obliczenie syndromu

%Petla wyszukujaca na ktorej pozycji pojawil sie blad
found = false;
for i = 1:n
    if ~found
        vector = zeros(1,n);
        vector(i) = 1;
        check = mod(vector * H',2);
        if check == syndrome
            found = true;
            index = i;
        end
    end
end

%Poprawienie wiadmosci
fixed_code = recived_code;
fixed_code(index) = mod(recived_code(index)+1,2);
end_msg = fixed_code(1:k)









