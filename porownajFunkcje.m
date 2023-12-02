function T = porownajFunkcje(f, x, n, a, b)
%POROWNAJFUNKCJA Tworzy zestawienie porównujące wyniki przybliżania funkcji
% f wbudowaną funkcją interp1 z funkcją wielomianInterpolacyjny. Kolejne
% pary kolumn zawierają błędy liczone odpowiednio normą 1, normą 2, normą
% nieskończoność
%   WEJŚCIE: f - funkcja interpolowana
%            x - wektor argumentów, dla których porównywane są funkcje
%            n - wektor kolejnych liczb węzłów
%            a - początek przedziału w którym wyznaczane są węzły
%            b - koniec przedziału w którym wyznaczane są węzły
%   WYJŚCIE: T - tablica z porównaniem

kolumny = {'Liczba węzłów', 'błąd 1 zaimplementowana', 'błąd 1 wbudowana', 'błąd 2 zaimplementowana', 'błąd 2 wbudowana', 'błąd nieskończoność zaimplementowana', 'błąd nieskończoność wbudowana'}; % do zmiany
y = f(x);

Z = zeros(length(n), 7);
for i=1:length(n)
    wezly_x = wezlyCzebyszewa(n(i), a, b);
    wezly_y = f(wezly_x);
    
    wbud = interp1(wezly_x, wezly_y, x, 'spline');
    impl = wielomianInterpolacyjny(wezly_x, wezly_y, x);
    
    impl_1 = norma1(impl - y);
    wbud_1 = norma1(wbud - y);
    
    impl_2 = norma2(impl - y);
    wbud_2 = norma2(wbud - y);
    
    impl_nsk = normaNieskonczonosc(impl - y);
    wbud_nsk = normaNieskonczonosc(wbud - y);

    Z(i, :) = [n(i) impl_1 wbud_1 impl_2 wbud_2 impl_nsk wbud_nsk];
end

T = array2table(Z);
T.Properties.VariableNames = kolumny;

end