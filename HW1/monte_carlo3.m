function [ ans ] = monte_carlo3( )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
a=2;
b=4;
c=-1;
d=1;
N = [10, 20, 30, 40, 50, 60, 70, 80, 100, 200, 500];
ans = zeros(11,102);
zMax = 800000;
xAxis = 1:11;


for i=1:11 %11种取样次数

for k=1:100 %重复100次
rng('shuffle');
xff = a+(b-a).*rand(1,N(i));
rng('shuffle');
yff = c+(d-c).*rand(1,N(i));
rng('shuffle');
zff = zMax.*rand(1,N(i));

for j=1:N(i)
    s(j) = monte_carlo_f2(xff(j),yff(j)); 
end
ratio = sum( zff <= s) / N(i);
ans(i,k) = ratio*2*2*800000;

end
end

for i=1:11
    ans(i,101) = mean(ans(i,1:100));%计算均值
    ans(i,102) = sqrt(sum((ans(i,1:100)-ans(i,21)).^2)/100);%计算方差
end


Mean = ans(:,101)
Variance = ans(:,102)


figure(1)
plot(xAxis,Mean,'-o')
% axis([1,10,0,1])
legend('Mean')
for i=xAxis
    text(xAxis(i),Mean(i),num2str(Mean(i)),'VerticalAlignment','bottom','HorizontalAlignment','center')
end



figure(2)
plot(xAxis,Variance,'-*')
%axis([1,11])
legend('Variance')
for i=xAxis
    text(xAxis(i),Variance(i),num2str(Variance(i)),'VerticalAlignment','bottom','HorizontalAlignment','center')
end

figure(3)
temp = [Mean, Variance];
b = bar(xAxis, temp);

legend('Mean','Variance')
xlabel('从左到右为取样个数5到100')




for i=xAxis
text(xAxis(i),Mean(i),num2str(Mean(i)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end

for i=xAxis
text(xAxis(i),Variance(i),num2str(Variance(i)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end

figure(4)
plot(xAxis,ans(:,1),'-*')
legend('Integral')
for i=xAxis
    text(xAxis(i),ans(i,1),num2str(ans(i,1)),'VerticalAlignment','bottom','HorizontalAlignment','center')
end



end

