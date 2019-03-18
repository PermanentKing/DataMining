function [my_inte] = calcIntegral()
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
N = [5, 10, 20, 30, 40, 50, 60, 70, 80, 100];
x = 1:10;

for i=1:4 %4次模拟

point=n.^i;%模拟的随机点数

RandData=rand(2,point);

%产生在x~[0,1],y~[0,1]上的随机数

scatter(RandData(1,:),RandData(2,:))

Below=find(RandData(1,:).^2>RandData(2,:));

%寻找位于曲线下(即x>y)的散点,find()函数的基本功能是
%返回向量或者矩阵中不为0的元素的位置索引

Outcome(i)=length(Below)/length(RandData);

%最终结果的表示

end

BelowData=RandData(:,Below);

hold on

scatter(BelowData(1,:),BelowData(2,:))
%x轴为生成的随机数，y轴为随机数的平方

end

