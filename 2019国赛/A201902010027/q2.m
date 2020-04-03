Data=xlsread('����2-�뷧�˶�����');
t1=Data(1:45,1);
d1=Data(1:45,2);
t2=Data(1:45,4);
d2=Data(1:45,5);
plot(t1,d1,0.45:0.01:2,2*ones(156,1),t2,d2)
% ������Ϻ���
[result,gof]=fitd_t(t1, d1, t2, d2);
syms t  
h=result{1}.a1*exp(-((t-result{1}.b1)/result{1}.c1)^2);
H=h+1.25/tan(9/360*2*pi);
% DΪ�뷧�˶���H��ʱ����Բ׶��ǰ�߶��ϵ�Բ�ܵİ뾶
D=tan(9/360*2*pi)*H;
%%
% hh=@(t)(result{1}.a1*exp(-((t-result{1}.b1)/result{1}.c1)^2)+1.25/tan(9/360*2*pi))*tan(9/360*2*pi);
%% Բ׶���������뷧��Բ�ܵĿ�϶��Ӱ��
temp=double(solve(pi*D^2-pi*2.5^2/4==pi*1.4^2/4,t))   %�ٽ�ʱ��
TT=temp(3) % �ٽ�ֵȡ��ʵ��
%% ���������һ�����������������
d=2.5; %�뷧ֱ��
C=0.85; %����ϵ��
% �����һ�����������������
M=double((2*int(C*(pi*D^2-pi*d^2/4)*sqrt(2*(100-0.1)/Rho(100)),t,0,0.45)...
    +int(C*(pi*1.56^2-pi*d^2/4)*sqrt(2*(100-0.1)/Rho(100)),t,0.45,2))*Rho(100))%1.56�ɸ���2��[0.45,2]���ָ߶�2����
%% ����͹��ת��һ��ѹ���͹ܵ�����
Data1=xlsread('����1-͹�ֱ�Ե����');
maxR=max(Data1(:,2));
minR=min(Data1(:,2));
% ����ǻ�����ݻ�Ϊ20mm3ʱ�ĸ߶�ht
ht=20/(pi*5^2/4);
% ͹��ת��һ��H�ı仯��
deltaH=maxR-minR;
% ���費��ѹ���͹���ʱ����С�����Ӧ���ܶ�endRho
endRho=(ht+deltaH)*Rho(0.5)/ht;
% endRho��100MPa��Ӧ�ܶ�֮��Ĳ�
deltaRho=endRho-Rho(100);
% ��������ܶȲ���Ӧ��ѹ���͹��е�����mm
mm=deltaRho*(pi*5^2/4);
%% ����͹�ֽ��ٶ�
circleNub=M*10/mm;
% ͹�ֽ��ٶ�
omega=circleNub*2*pi