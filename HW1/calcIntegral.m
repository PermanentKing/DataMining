function [my_inte] = calcIntegral()
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
N = [5, 10, 20, 30, 40, 50, 60, 70, 80, 100];
x = 1:10;

for i=1:4 %4��ģ��

point=n.^i;%ģ����������

RandData=rand(2,point);

%������x~[0,1],y~[0,1]�ϵ������

scatter(RandData(1,:),RandData(2,:))

Below=find(RandData(1,:).^2>RandData(2,:));

%Ѱ��λ��������(��x>y)��ɢ��,find()�����Ļ���������
%�����������߾����в�Ϊ0��Ԫ�ص�λ������

Outcome(i)=length(Below)/length(RandData);

%���ս���ı�ʾ

end

BelowData=RandData(:,Below);

hold on

scatter(BelowData(1,:),BelowData(2,:))
%x��Ϊ���ɵ��������y��Ϊ�������ƽ��

end

