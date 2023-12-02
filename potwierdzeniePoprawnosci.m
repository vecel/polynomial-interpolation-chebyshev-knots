% Skrypt służy sprawdzeniu poprawności działania zaimplementowanych funkcji

% wielomianInterpolacyjny
fig = figure;
fig.Position = [400 200 900 550];

x = linspace(-5, 5, 1000);
style = 'r';
style2 = '--g';

% 1.1
% Spodziewanym wynikiem jest wielomian x^2
wezly = [-1 0 1];
wartosci = [1 0 1];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 1);
plot(x, y, style, x, x.^2, style2, 'LineWidth', 2);
title('y = x^2', 'FontSize', 14);
grid on
grid minor

% 1.2
% Spodziewanym wynikiem jest wielomian x^3 - 1
wezly = [-2 0 1 3];
wartosci = [-9 -1 0 26];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 2);
plot(x, y, style, x, x.^3-1, style2, 'LineWidth', 2);
title('y = x^3 - 1', 'FontSize', 14);
grid on
grid minor

% 1.3
% Spodziewanym wynikiem jest wielomian (x-1)(x-2)(x-3) = x^3 -
% 6x^2 + 11x - 6
wezly = [1 2 3 0];
wartosci = [0 0 0 -6];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 3);
plot(x, y, style, x, (x-1).*(x-2).*(x-3), style2, 'LineWidth', 2);
title('y = (x-1)(x-2)(x-3)', 'FontSize', 14);
grid on
grid minor

% 1.4
% Spodziewanym wynikiem jest wielomian x^4 + x^3 + x^2 + x + 1
wezly = [-2 -1 0 1 2];
wartosci = [11 1 1 5 31];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 5);
plot(x, y, style, x, x.^4+x.^3+x.^2+x+1, style2, 'LineWidth', 2);
title('y = x^4 + x^3 + x^2 + x + 1', 'FontSize', 14);
grid on
grid minor

% 1.5
% Spodziewanym wynikiem jest rozwinięcie e^x w szereg potęgowy do składnika
% z trzecią potęgą, czyli 1/6 * x^3 + 1/2 * x^2 + x + 1
wezly = [0 1 -1 2];
wartosci = [1 16/6 1/3 6+1/3];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 6);
plot(x, y, style, x, x.^3./6 + x.^2./2 + x + 1, style2, 'LineWidth', 2);
title('y = 1/6 * x^3 + 1/2 * x^2 + x + 1', 'FontSize', 14);
grid on
grid minor

% 1.6
% Spodziewanym wynikiem jest wielomian x^2(x+3)(x-3)
wezly = [0 -3 3 1 -1];
wartosci = [0 0 0 -8 -8];

y = wielomianInterpolacyjny(wezly, wartosci, x);
subplot(2, 4, 7);
plot(x, y, style, x, x.^2 .* (x+3) .* (x-3), style2, 'LineWidth', 2);
title('y = x^2(x+3)(x-3)', 'FontSize', 14);
grid on
grid minor

leg = legend('Wynik funkcji wielomianInterpolacyjny', 'Dokładny wielomian');
leg.Position(1) = 0.73;
leg.Position(2) = 0.5;

sgtitle('Sprawdzenie poprawności funkcji wielomianInterpolacyjny');

% wezlyCzebyszewa
% W poniższych przykładach korzystam z funkcji testWartosci do porównywania
% wyników
% 2.1
% Wynik wyznaczony analitycznie
testWartosci(wezlyCzebyszewa(1), 0);

% 2.2
% Wyniki wyznaczone analitycznie
testWartosci(wezlyCzebyszewa(2), [sqrt(2)/2 -sqrt(2)/2]);

% 2.3
% Wyniki wyznaczone za pomocą Wolframalpha
testWartosci(wezlyCzebyszewa(6), [(1+sqrt(3))/2*sqrt(2) 1/sqrt(2) (sqrt(3)-1)/2*sqrt(2) -(sqrt(3)-1)/2*sqrt(2) -1/sqrt(2) -(1+sqrt(3))/2*sqrt(2)])
