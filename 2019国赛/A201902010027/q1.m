%% ��ȡ����
clc
clear
A=xlsread('����3-����ģ����ѹ��.xlsx');
E=A(:,2); %����ģ����MPa��
P=A(:,1); %ѹ��(MPa)
%% �����������ѹ��(MPa)���ڵ���ģ����MPa���Ĺ�ϵ����
[result,gof1] = fitE_P(P, E);
span=[0.85 0.9];
p0=100;
% ��ֵΪp100��ʹ������[0.85 0.90]ʹ��ode15s��dp/dRho=E(p)/rho
[rho,p] = ode15s(@(rho,x) (result.p1*x^6 + result.p2*x^5 + result.p3*x^4 + ...
    result.p4*x^3 + result.p5*x^2 + result.p6*x + result.p7)/rho, span, p0);
% ����p��rho�Ĺ�ϵͼ��
figure
plot(p,rho);
xlabel('P/MPa');
ylabel('rho/(mg/mm3)');
grid on
%% �����ܶȺ�ѹ������ֵ����ϳ���亯����ϵ
[result,gof2] = fitRho_P(p, rho);
Rho=@(x) (result.p1*x^2 + result.p2*x +result.p3);
rho160=Rho(160);
%% T
C=0.85;%����ϵ��
A=pi*(1.4)^2/4;%A��С�׵����
syms t
% �ȶ�100MPa������ÿ�ο�����ʱ��
T100=double(solve((100/(10+t))*t*C*A*sqrt(2*(160-100)/rho160)==44,t))
% �ȶ�150MPa������ÿ�ο�����ʱ��
T150=double(solve((100/(10+t))*t*C*A*sqrt(2*(160-150)/rho160)==44,t))
%% 2s��5s��10s��150MPa�ȶ�
V=500*pi*10^2/4;        %�͹����
endT=2000;endP=150;     %��ֹ����endTΪ2000ms��5000ms��100000ms

% ��ͨ�����ַ��ҳ�������䣬�����һ�����㾫ȷ�ȵ�ֵ
% ����Ϊ2s��5s��10s��Ӧ��ѭ��
% for T=0.570:0.01:0.575  %5s�ĵ������ҳ�����ÿ�ο�����ʱ��
% for T=0.365:0.001:0.371  %5s�ĵ������ҳ�����ÿ�ο�����ʱ��
% for T=0.3225:0.0001:0.3230 %10s�ĵ������ҳ�����ÿ�ο�����ʱ��
    t=0;pp=100;p_Save=zeros(endT,1);timer=11; %��ʼ����
tic
    T=0.571
    while t<=endT&&pp<=endP
        if mod(t,100)<1
            out=18;
        elseif mod(t,100)<2
            out=20;
        elseif mod(t,100)<3
            out=6;
        else
            out=0;
        end
        syms temp
        % ����һ�ε���ÿ��һ�κ��Ҫ�ر�10ms
        if timer>=10 
            in=C*A*sqrt(2*(160-temp)/rho160)*rho160;    
            pp=vpasolve(in*T-out==V*(Rho(temp)-Rho(pp)),temp);
            p_Save(t+1)=pp;
            timer=0;
        end
        p_Save(t+1)=pp;
        timer=timer+1;
        t=t+1;
    end
    disp(t)
    disp(T)
    figure
    plot(1:t,p_Save(1:t));
    grid on
%     end 
toc
