function [ my_pi ] = clacPI()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
my_pi = [];
N = [20, 50, 100, 200, 300, 500, 1000, 5000];
t = [1,2,3,4,5,6,7,8];

for i=1:8
        rng('shuffle');%初始化随机发生器
        x = rand(1,N(i));%二维样本的x坐标，x: [-1,1]
        rng('shuffle');%再次初始化随机发生器，与上次不同，将产生独立的随机数
        y = rand(1,N(i));%二维样本的y坐标, y:[-1:1]
        s = sum(x.^2+y.^2 <= 1); %计算落在单位圆内的点数
        my_pi(i) = s/N(i)*4; %计算pi值
end

plot(t,my_pi)
axis([1,8,2,4])
for i=t
    text(t(i),my_pi(i),num2str(my_pi(i)))
end