clear; close all; clc;
%%
x = linspace(0, 2 * pi, 1000);
y = sin(x);
testy = rand(200, 1) * 2 - 1;
testx = rand(200, 1) * 2 * pi;
test = [testx testy]';
p = [x y];
test_vect = zeros(1, length(testx));

for i=1:length(testy)
    if sin(testx(i)) > testy(i)
        test_vect(i) = 1;
    else 
        test_vect(i) = 2;
    end
end

test_vect_log = ind2vec(test_vect);

hold on;
plot(x, y)
for i = 1:length(test_vect)
    switch test_vect(i)
        case 2, plot(testx(i), testy(i), 'd')
        case 1, plot(testx(i), testy(i), '^')
    end
end
%%
% net = newlvq(minmax(test), 10);
net = newff(minmax(test), [6 2], {'tansig', 'purelin'}, 'trainlm');
net.trainParam.epochs = 200;
res = train(net, test, test_vect_log);
class_def = vec2ind(sim(res, [3; 0.5]));
%%
class_def = (sim(res, [6; -0.7]))
