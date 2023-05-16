clear

x=0:0.2:30;
y=(sin(-0.2*x))./(2*x+3);

Q=length(y);

v = 30;
u = 30;

for i = 1:v
    p(i,1:u) = y(1,i:i+u-1);
end;

t = y(1,v+1:v+u);

net=newlind(p,t);
y1=sim(net,p);

% Исходная функция
h=plot(x,y,'r')
hold on

% Отрезок обучения
h1=plot(x(v+1:v+u),y1,'k',x(v+1:v+u),t,'k+')
set(h1,'LineWidth',2)
set(h,'LineWidth',3)
hold on

p1(1:v,1)=y(1,1:v)';

for i=1:Q
    y2(i)=sim(net,p1);
    p1=[p1(2:v,1); y2(i)];
end;

% График спрогнозированной функции
plot(x(v+1:Q),y2(1:Q-v),'y')
