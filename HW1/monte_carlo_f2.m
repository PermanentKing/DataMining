function [ f ] = monte_carlo_f2( x,y )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
f = ( (y.^2).*(exp(-y.^2))+(x.^4).*(exp(-x.^2)) )./ ( x.*(exp(-x.^2)) );

end

