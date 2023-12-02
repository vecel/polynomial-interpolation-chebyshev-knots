% Mateusz Karandys
% Skrpyt główny prezentujący wyniki i przykłady projektu. Najwygodniej
% odkomentowywać rozważany przykład.

% Przykład 1
% Interpolacja (na węzłach Czebyszewa) szybko zbiega do funkcji e^x na
% [-5, 5], wystarcza ~15 węzłów.
% wizualizacjaZbieznosci(@exp, -5, 5, 1:20, 'e^x');

% porownajFunkcje(@exp, linspace(-5, 5, 1000), 2:20, -5, 5)

% Zaimplementowana funkcja lepiej przybliża funkcję daną, ale tylko na
% przedziale, na którym są węzły, poza tym przedziałem przybliżenie jest
% coraz gorsze (tam wielomian interpolujący bardzo szybko rośnie/maleje)
% porownajFunkcje(@exp, linspace(-5, 5, 1000), 40, -1, 1)

% Przykład 2
% Gorzej jest z funkcją |x|, błąd jest duży. Dla ~300 węzłów rzędu 0.01,
% dla ~500 dwa razy mniejszy
% wizualizacjaZbieznosci(@abs, -5, 5, 10:10:100, '|x|');
% pause(1);
% wizualizacjaZbieznosci(@abs, -5, 5, 301, '|x|');
% wizualizacjaZbieznosci(@abs, -5, 5, 501, '|x|');

% Zwiększanie liczby węzłów nie pomaga
% porownajFunkcje(@abs, linspace(-5, 5, 1000), [100 200 300], -5, 5)

% Przykład 3
% Im dłuższy przedział, tym funkcja interpolująca dłużej zbiega
% wizualizacjaZbieznosci(@f1, -1, 1, 1:2:20, '1/(x^2+1)');
% pause(2);
% wizualizacjaZbieznosci(@f1, -5, 5, 1:10:100, '1/(x^2+1)');

% porownajFunkcje(@f1, linspace(-1, 1, 1000), 2:20, -1, 1)

% Przykład 4
% Interpolacja nie zbiega do funkcji sin(1/x), bo ta jest nieokreślona w 0
% wizualizacjaZbieznosci(@f2, -1, 1, 1:5:100, 'sin(1/x)');

% porownajFunkcje(@f2, linspace(-1, 1, 1000), 10:10:100, -1, 1)

% Przykład 5
% Jeśli funkcja jest okresowa, to dla większego okresu interpolacja zbiega
% szybciej (o ile zbiega)
% Od ~30 wezlow ok
% wizualizacjaZbieznosci(@sin, -4*pi, 4*pi, 2:2:50, 'sin x');
% pasue(2)
% Od ~150 wezlow ok
% wizualizacjaZbieznosci(@f3, -4*pi, 4*pi, 10:10:200, 'sin 10x');

% porownajFunkcje(@sin, linspace(-4*pi, 4*pi, 1000), 10:10:150, -4*pi, 4*pi)
% porownajFunkcje(@f3, linspace(-4*pi, 4*pi, 1000), 10:10:150, -4*pi, 4*pi)

% Przykład 6
% Wygląda na to, że trudno przeprowadzić interpolację wielomianową, dla
% funkcji, które są nieróżniczkowalne w pewnych punktach rozważanego
% przedziału
% sqrt(x) ok dla 20 węzłów na [0.1, 5], błąd rzędu 1e-8
% wizualizacjaZbieznosci(@sqrt, 0.5, 5, 20, 'sqrt(x)');
% sqrt(x) nie ok dla 200 węzłów na [0, 5], błąd rzędu 0.001
% wizualizacjaZbieznosci(@sqrt, 0, 5, 200:205, 'sqrt(x)');

% Porównanie funkcji tylko na ciekawym przedziale [0, 0.2] gdzie funkcja
% sqrt jest nieróżniczkowalna w x=0
% porownajFunkcje(@sqrt, linspace(0, 0.2, 1000), [150 200 250], 0, 0.2)

% Poniżej znajduje się kilka użytych funkcji matematycznych
function y = f1(x)
    y = 1 ./ (x.^2+1);
end

function y = f2(x)
    y = sin(1./x);
end

function y = f3(x) 
    y = sin(10 .* x);
end
