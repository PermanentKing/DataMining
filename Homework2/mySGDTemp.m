function [ err,errtest ] = mySGDTemp( x1,x2,y,test1,test2,testy )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x1 = zscore(x1);
x2 = zscore(x2);
y = zscore(y);
test1 = zscore(test1);
test2 = zscore(test2);
testy = zscore(testy);

matx = [x1 x2 [1:50]'];
mattest = [test1 test2 [1:10]'];

maxsteps = 1500000;
learining_rate = 0.00015;

steps = 100000;
N = [100000,200000,1500000];


theta2 = 0.0;
theta1 = 0.0;     % һ��ϵ��
theta0 = 0.0;     % ��ϵ��

curstep = 0;
step = 0;

err = [];
errtest = [];
count = 1;

batch_size = 1;%����Ϊ1ʱ����������ݶ��½�������Ϊminibatch�½�

randNum = randperm(50,50);

 while(curstep<maxsteps)
     curstep = curstep+1;
     step = step+1;
     temp1 = 0;
     temp2 = 0;
     temp0 = 0;
%      for i=1:50
%          temp1 = temp1 + ((y(i) - (theta1*x1(i) + theta2*x2(i) + theta0)) * x1(i));
%          temp2 = temp2 + ((y(i) - (theta1*x1(i) + theta2*x2(i) + theta0)) * x2(i));
%          temp0 = temp0 + ((y(i) - (theta1*x1(i) + theta2*x2(i) + theta0)) * 1);
%      end

     randNum = randperm(50,1);
     temp1 = x1(randNum)*(matx(randNum,:)*[theta1;theta2;theta0] - y(randNum));
     temp2 = x2(randNum)*(matx(randNum,:)*[theta1;theta2;theta0] - y(randNum));
     temp0 = (matx(randNum,:)*[theta1;theta2;theta0]) - y(randNum);
     
     theta1 = theta1 - (learining_rate * temp1);
     theta2 = theta2 - (learining_rate * temp2);
     theta0 = theta0 - (learining_rate * temp0);
     
%      old_theta1 = theta1;
%      old_theta2 = theta2;
%      old_theta0 = theta0;  
     
     
%      temp1 = 0;
%      temp2 = 0;
%      temp0 = 0;
     
     % ���
     %e = ((old_theta1 - theta1)^2 + (old_theta2 - theta2)^2 + (old_theta0 - theta0)^2);
     %err(curstep) = e;
     if(step==1)
         %loss
        loss_t = sum(((y-matx*[theta1;theta2;theta0]).^2));
        loss_test = sum(((testy-mattest*[theta1;theta2;theta0]).^2));
        err(count) = loss_t;
        errtest(count) = loss_test;
        count = count+1;
     end
     if(step==100)
        step = 0;
     end
     
%      if  e < 0.000003       
%          f = theta1 * x1 + theta2 * x2 + theta0;
% %          plot(x,y,'r+',x,f)
%          break;
%      end
     
      
%      if(steps==100000)
%          err(count) = e;
%          steps = 0;
%          count = count+1;
%      end
     
%      if(curstep==10)
%          break
%      end
 end
 
 plot(1:15000, err, 1:15000, errtest, 'LineWidth',2, 'LineSmoothing', 'on');
 axis([-100 16000 -0.1 0.9])
 legend('Training','Test')
end

