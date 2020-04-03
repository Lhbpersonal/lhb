%% 读取数据
clc
clear
A=xlsread('附件3-弹性模量与压力.xlsx');
E=A(:,2); %弹性模量（MPa）
P=A(:,1); %压力(MPa)
%% 利用数据拟合压力(MPa)关于弹性模量（MPa）的关系函数
[result,gof1] = fitE_P(P, E);
span=[0.85 0.9];
p0=100;
% 初值为p100，使用区间[0.85 0.90]使用ode15s解dp/dRho=E(p)/rho
[rho,p] = ode15s(@(rho,x) (result.p1*x^6 + result.p2*x^5 + result.p3*x^4 + ...
    result.p4*x^3 + result.p5*x^2 + result.p6*x + result.p7)/rho, span, p0);
% 画出p和rho的关系图；
figure
plot(p,rho);
xlabel('P/MPa');
ylabel('rho/(mg/mm3)');
grid on
%% 根据密度和压力的数值解拟合出其间函数关系
[result,gof2] = fitRho_P(p, rho);
Rho=@(x) (result.p1*x^2 + result.p2*x +result.p3);
rho160=Rho(160);
%% T
C=0.85;%流量系数
A=pi*(1.4)^2/4;%A处小孔的面积
syms t
% 稳定100MPa，单向阀每次开启的时长
T100=double(solve((100/(10+t))*t*C*A*sqrt(2*(160-100)/rho160)==44,t))
% 稳定150MPa，单向阀每次开启的时长
T150=double(solve((100/(10+t))*t*C*A*sqrt(2*(160-150)/rho160)==44,t))
%% 2s、5s和10s到150MPa稳定
V=500*pi*10^2/4;        %油管体积
endT=2000;endP=150;     %终止条件endT为2000ms、5000ms、100000ms

% 先通过二分法找出大概区间，再求出一定满足精确度的值
% 以下为2s、5s和10s对应的循环
% for T=0.570:0.01:0.575  %5s的调整，找出单向阀每次开启的时长
% for T=0.365:0.001:0.371  %5s的调整，找出单向阀每次开启的时长
% for T=0.3225:0.0001:0.3230 %10s的调整，找出单向阀每次开启的时长
    t=0;pp=100;p_Save=zeros(endT,1);timer=11; %初始条件
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
        % 工作一次单向阀每打开一次后就要关闭10ms
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
