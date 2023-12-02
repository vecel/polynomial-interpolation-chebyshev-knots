function [] = testWartosci(x, y)
%TESTWARTOSCI Sprawdza czy wartości x, y są dostatecznie blisko siebie.
%Wypisuje wiadomość na konsoli, gdy test zostanie zaliczony, w przeciwnym
%przypadku wyrzuca błąd
%   WEJŚCIE: x, y - liczby (lub wektory) do porównania

if abs(x-y) > eps
    error(strcat('Niezgodne wartości x oraz y: x=', string(x), ', y=', string(y)));
end
disp(strcat('Test zaliczony dla wartosci, x=', string(x), ', y=', string(y))')

end

