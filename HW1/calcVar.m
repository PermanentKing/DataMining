function [ my_pi ] = calcVar()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
my_pi = zeros(8,22);
N = [20, 50, 100, 200, 300, 500, 1000, 5000];
t = [1,2,3,4,5,6,7,8];


% for i=1:20
% count = 0;
% for N=Num
%     count = count + 1;
%     rng('shuffle');%��ʼ�����������
%     x = rand(N,1);%��ά������x���꣬x: [-1,1]
%     rng('shuffle');%�ٴγ�ʼ����������������ϴβ�ͬ�������������������
%     y = rand(N,1);%��ά������y����, y:[-1:1]
%     s = sum(x.^2+y.^2 <= 1); %�������ڵ�λԲ�ڵĵ���
%     my_pi(count,i) = s/N*4; %����piֵ
% end
% 
% end

for i=1:8
    for j=1:20
        rng('shuffle');%��ʼ�����������
        x = rand(1,N(i));%��ά������x���꣬x: [-1,1]
        rng('shuffle');%�ٴγ�ʼ����������������ϴβ�ͬ�������������������
        y = rand(1,N(i));%��ά������y����, y:[-1:1]
        s = sum(x.^2+y.^2 <= 1); %�������ڵ�λԲ�ڵĵ���
        my_pi(i,j) = s/N(i)*4; %����piֵ
    end

end

for i=1:8
    my_pi(i,21) = mean(my_pi(i,1:20));
    my_pi(i,22) = sqrt(sum((my_pi(i,1:20)-my_pi(i,21)).^2)/20);
end

Mean = my_pi(:,21);
Variance = my_pi(:,22);

figure(1)
plot(t,Mean,'-o')
axis([1,8,3,4])
legend('Mean')
for i=t
    text(t(i),Mean(i),num2str(Mean(i)))
end

figure(2)
plot(t,Variance,'-*')
axis([1,8,0,1])
legend('Variance')
for i=t
    text(t(i),Variance(i),num2str(Variance(i)))
end

end

