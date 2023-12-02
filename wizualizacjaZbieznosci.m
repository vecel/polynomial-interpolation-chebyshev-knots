function [] = wizualizacjaZbieznosci(f, a, b, n, fTekst)
%WIZUALIZACJAZBIEZNOSCI Tworzy animację porównującą na przedziale [a, b]
%wykres funkcji f z wielomianami interpolującymi wyznaczonymi na zadanych
%liczbach węzłów Czebyszewa
%   WEJŚCIE: f - funkcja interpolowana
%            a, b - odpowiednio początek i koniec przedziału
%            n - wektor liczb węzłów do wyznaczania funkcji
%            interpolujących
%            fTekst - wzór funkcji do ładnego wyświetlenia na wykresie

if nargin == 4
    fTekst = 'f';
end

x = linspace(a, b, 1001);
y = f(x);

tytul = sprintf('Interpolacja wielomianowa funkcji %s na przedziale [%s, %s]', fTekst, string(a), string(b));

plot(x, y, 'Color', 'r');
title(tytul, 'FontSize', 14);
xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
axis([a-1 b+1 min(y)-1 max(y)+1]);
grid on

for i=1:length(n)
    wezly_x = wezlyCzebyszewa(n(i), a, b);
    wezly_y = f(wezly_x);
    w = wielomianInterpolacyjny(wezly_x, wezly_y, x);
    maxBlad = max(blad(f(x), w));
    if i > 1
        delete(wielomian_i);
        delete(wezly_i);
    end
    hold on
    wielomian_i = plot(x, w, 'Color', 'g');
    wezly_i = plot(wezly_x, wezly_y, '.', 'MarkerSize', 18, 'Color', 'k');
    subtitle(strcat('Liczba węzłów: ', string(n(i)), '     Maksymalny błąd: ', string(maxBlad)), 'FontSize', 12);
    legend('Wykres funkcji f', 'Wielomian interpolacyjny', 'Węzły');
    hold off
    pause(0.6);
end

end