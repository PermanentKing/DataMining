function [ f ] = monte_carlo_f2( x,y )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
f = ( (y.^2).*(exp(-y.^2))+(x.^4).*(exp(-x.^2)) )./ ( x.*(exp(-x.^2)) );

end

