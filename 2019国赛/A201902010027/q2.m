Data=xlsread('附件2-针阀运动曲线');
t1=Data(1:45,1);
d1=Data(1:45,2);
t2=Data(1:45,4);
d2=Data(1:45,5);
plot(t1,d1,0.45:0.01:2,2*ones(156,1),t2,d2)
% 生成拟合函数
[result,gof]=fitd_t(t1, d1, t2, d2);
syms t  
h=result{1}.a1*exp(-((t-result{1}.b1)/result{1}.c1)^2);
H=h+1.25/tan(9/360*2*pi);
% D为针阀运动到H高时，在圆锥当前高度上的圆周的半径
D=tan(9/360*2*pi)*H;
%%
% hh=@(t)(result{1}.a1*exp(-((t-result{1}.b1)/result{1}.c1)^2)+1.25/tan(9/360*2*pi))*tan(9/360*2*pi);
%% 圆锥喷孔相对于针阀与圆周的空隙无影响
temp=double(solve(pi*D^2-pi*2.5^2/4==pi*1.4^2/4,t))   %临界时间
TT=temp(3) % 临界值取正实数
%% 计算喷出嘴一个周期内喷出的质量
d=2.5; %针阀直径
C=0.85; %流量系数
% 喷出嘴一个周期内喷出的质量
M=double((2*int(C*(pi*D^2-pi*d^2/4)*sqrt(2*(100-0.1)/Rho(100)),t,0,0.45)...
    +int(C*(pi*1.56^2-pi*d^2/4)*sqrt(2*(100-0.1)/Rho(100)),t,0.45,2))*Rho(100))%1.56由附件2得[0.45,2]保持高度2不变
%% 计算凸轮转动一周压入油管的质量
Data1=xlsread('附件1-凸轮边缘曲线');
maxR=max(Data1(:,2));
minR=min(Data1(:,2));
% 柱塞腔残余容积为20mm3时的高度ht
ht=20/(pi*5^2/4);
% 凸轮转动一周H的变化量
deltaH=maxR-minR;
% 假设不被压入油管中时，最小体积对应的密度endRho
endRho=(ht+deltaH)*Rho(0.5)/ht;
% endRho与100MPa对应密度之间的差
deltaRho=endRho-Rho(100);
% 定体积由密度差求应当压入油管中的质量mm
mm=deltaRho*(pi*5^2/4);
%% 计算凸轮角速度
circleNub=M*10/mm;
% 凸轮角速度
omega=circleNub*2*pi