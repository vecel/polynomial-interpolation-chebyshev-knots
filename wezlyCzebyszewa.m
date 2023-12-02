function x = wezlyCzebyszewa(n, a, b)
%WEZLYCZEBYSZEWA Wyznacza miejsca zerowe (zwane węzłami Czebyszewa)
%wielomianu Czebyszewa stopnia n przeskalowane na przedział [a, b]
%   WEJŚCIE: n - liczba oznaczająca stopień wielomianu
%            a - początek przedziału
%            b - koniec przedziału
%   WYJŚCIE: x - wektor węzłów Czebyszewa

t = 1:2:2*n-1;
t = pi * t ./ (2*n);
x = cos(t);

x = x .* ((b-a)/2);
x = x + (a+b)/2;

end