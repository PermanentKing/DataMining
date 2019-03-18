function [ result ] = monte_carlo2()
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
a=2;
b=4;
c=-1;
d=1;
N = [10, 20, 30, 40, 50, 60, 70, 80, 100, 200, 500];
ans = zeros(11,102);
sumff = 0;

for i=1:11
    sumff = 0;
    rng('shuffle');
    xff = a+(b-a).*rand(1,N(i));
    rng('shuffle');
    yff = c+(d-c).*rand(1,N(i));
    for k=1:N(i)
        sumff = sumff + monte_carlo_f2(xff(k),yff(k));
    end
    aversumyff=sumyff/N(i);
    sumxff=sumxff+(b-a)*aversumyff;
end



end

result=sumxff/n;


end

