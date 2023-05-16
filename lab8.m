clear;
close all; 
clc;

a = pi;  
b = exp(1);
x = linspace(0, 2, 80);
y = (a*x).^(b*x);

for i = 1:80
    A = 2*rand + 2;
    B = 2*rand + 2;
    T(1, i) = A;
    T(2, i) = B;
    P(i,:)= (A.*x).^(B.*x);
end

P = P';
net = newff(minmax(P), [5 7 2], {'tansig', 'tansig', 'purelin'}, 'trainlm');
net.trainParam.epochs = 500;
net = train(net, P, T);

sim(net, y')