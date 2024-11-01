clc
clear

% a=rand(1000)+i*rand(1000);
load('a.mat');
b=a'*a;
c=inv(b);
f = @() inv(b)
timeit(f)
g = @() chol(b)
timeit(g)

% MATLAB
e = @() (Cholinv(b))
timeit(e)
d = Cholinv(b);
sum(sum(abs(c-d)^2, 2))

% C
e = @() CD(b)
timeit(e)
d = CD(b);
sum(sum(abs(c-d)^2, 2))

% C+LAPACK
e = @() CD_LAPACK(b)
timeit(e)
d = CD_LAPACK(b);
sum(sum(abs(c-d)^2, 2))