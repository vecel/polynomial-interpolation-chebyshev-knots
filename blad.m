function t = blad(x, y)
%BLAD Wyznacza błąd bezwzględny wartości x, y
%   WEJŚCIE: x, y - liczby, wektory lub macierze tych samych rozmiarów
%   WYJŚCIE: t - liczba, wektor lub macierz tego samego rozmiaru co
%   argumenty zawierająca wartości bezwzglednych błędów kolejnych elementów
%   x oraz y
t = abs(x - y);
end