function [h, size] = gaussianKernel(obj, sflag, std, size)
% GAUSSIANKERNEL Create a 2D Gaussian filter
%
% Other m-files required: Matcha.m
% Subfunctions: none
% MAT-files required: none
%
% Author:        Gabriel Moreira
% email:         gmoreira (at) isr.tecnico.ulisboa.pt
% Website:       https://www.github.com/gabmoreira/maks
% Last revision: 14-July-2021

if (sflag) 
    n = size;
else
    prec = 4.0;
    n = 1 + 2 * ceil( std * sqrt(prec * 2.0 * log(10.0)) );
end

if ((mod(n,2) == 0) && (n > 1))
    n = n - 1;
end

[h1, h2] = meshgrid(-(n-1)/2:(n-1)/2, -(n-1)/2:(n-1)/2);
hg = exp( - (h1.^2+h2.^2) / (2*std^2) );
h = hg ./ sum(hg(:));
end
