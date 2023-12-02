function p = wielomianInterpolacyjny(wezly_x, wezly_y, x)
%WIELOMIANINTERPOLACYJNY Wyznacza wartości wielomianu interpolacyjnego (dla
%argumentów x) dla węzłów o zadanych współrzędnych 
%   WEJŚCIE: wezly_x - wektor odciętych węzłów
%            wezly_y - wektor rzędnych węzłów
%            x - wektor argumentów dla których liczona będzie wartość
%            wielomianu
%   WYJŚCIE: p - wektor wartości wielomianu interpolacyjnego w punktach x

if size(wezly_x) ~= size(wezly_y) 
    error('wezly_x oraz wezly_y muszą mieć takie same wymiary')
end

if size(wezly_x, 1) ~= 1
    wezly_x = wezly_x';
    wezly_y = wezly_y';
end

if size(x, 1) ~= 1
    x = x';
end

wn = length(wezly_x);
xn = length(x);
X = x' - wezly_x;
L = zeros(xn, wn);

for i=1:wn
    wi = repmat(wezly_x(i), 1, wn);
    Y = repmat(wi - wezly_x, xn, 1);
    idx = find(Y);
    Li = reshape(X(idx) ./ Y(idx), xn, wn-1);
    Lix = prod(Li, 2);
    L(:,i) = Lix;
end

p = (L * wezly_y')';

end

