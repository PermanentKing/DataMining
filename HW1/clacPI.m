function [ my_pi ] = clacPI()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
my_pi = [];
N = [20, 50, 100, 200, 300, 500, 1000, 5000];
t = [1,2,3,4,5,6,7,8];

for i=1:8
        rng('shuffle');%��ʼ�����������
        x = rand(1,N(i));%��ά������x���꣬x: [-1,1]
        rng('shuffle');%�ٴγ�ʼ����������������ϴβ�ͬ�������������������
        y = rand(1,N(i));%��ά������y����, y:[-1:1]
        s = sum(x.^2+y.^2 <= 1); %�������ڵ�λԲ�ڵĵ���
        my_pi(i) = s/N(i)*4; %����piֵ
end

plot(t,my_pi)
axis([1,8,2,4])
for i=t
    text(t(i),my_pi(i),num2str(my_pi(i)))
end