function [ ans ] = monte_carlo4()
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明

a=2;
b=4;
c=-1;
d=1;
N = [10, 20, 30, 40, 50, 60, 70, 80, 100, 200, 500];
ans = zeros(11,102);
zMax = 800000;


rng('shuffle');
xff = a+(b-a).*rand(1,500);
rng('shuffle');
yff = c+(d-c).*rand(1,500);
rng('shuffle');
zff = zMax.*rand(1,500);


plot3(xff, yff, zff, '.');
axis tight
hold on;

drawx = 2:0.01:4;
drawy = -1:0.01:1;
[X, Y] = meshgrid(drawx, drawy);
Z = monte_carlo_f2(X, Y)
mesh(X, Y, Z,'Linewidth',5);

end

