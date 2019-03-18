function [ ans ] = monte_carlo()
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
a = 0;
b = 1;
N = [5, 10, 20, 30, 40, 50, 60, 70, 80, 100];
xAxis = 1:10;
ans = zeros(10,102);


for i=1:10
for k=1:100
t = rand(1,N(i));
x = a+(b-a)*t;
s = sum(monte_carlo_f(x));
ans(i,k) = s*(b-a)/N(i);
end

ans(i,101) = mean(ans(i,1:100));
ans(i,102) = sqrt(sum((ans(i,1:100)-ans(i,21)).^2)/100);

end

Mean = ans(:,101)
Variance = ans(:,102)


figure(1)
plot(xAxis,Mean,'-o')
axis([1,10,0,1])
legend('Mean')
for i=xAxis
    text(xAxis(i),Mean(i),num2str(Mean(i)),'VerticalAlignment','bottom','HorizontalAlignment','center')
end



figure(2)
plot(xAxis,Variance,'-*')
axis([1,10,0,1])
legend('Variance')
for i=xAxis
    text(xAxis(i),Mean(i),num2str(Mean(i)),'VerticalAlignment','bottom','HorizontalAlignment','center')
end

figure(3)
temp = [Mean, Variance];
b = bar(xAxis, temp);
ch = get(b,'children');
set(ch{1},'FaceColor','y')
set(ch{2},'FaceColor','b')

legend('Mean','Variance')
xlabel('������Ϊȡ������5��100')




for i=xAxis
text(xAxis(i),Mean(i),num2str(Mean(i)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end

for i=xAxis
text(xAxis(i),Variance(i),num2str(Variance(i)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end



figure(4)% �鿴��������������Ч��
plot(xAxis,ans(:,1),'-*')
axis([1,10,0,1])
legend('Integral')

for i=xAxis
text(xAxis(i),ans(i,1),num2str(ans(i,1)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end

end
