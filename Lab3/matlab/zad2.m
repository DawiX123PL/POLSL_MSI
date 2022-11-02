clear all
close all
clc

load('Data_microarray.mat')
n = 10;

d = Data(:,1:2)';

plot(d(1,:),d(2,:), '.')



%net = selforgmap([1 n])
net = selforgmap([1 10],100,3, 'hextop');
net = train(net,d);
d1 = net.Iw{1}';


%%

%net = selforgmap([1 n])
net = selforgmap([1 3],100,3, 'hextop');
net = train(net,d1);
d2 = net.Iw{1}'; 

%%

hold on
plot( d1(1,:), d1(2,:), 'o')

hold on
plot( d2(1,:), d2(2,:), '*')

%%

distances = dist(d1', d2);
[~, cmdx2] = min(distances,[],2);

figure
for i = 1:3
    t = cmdx2 == i;
    plot(d1(1,:) .* t', d1(2,:) .* t', '.');
    hold on
end


distances = dist(d', d1);
[~, cmdx1] = min(distances,[],2);

figure
for i = 1:10
    t = cmdx1 == i;
    plot(d(1,:) .* t', d(2,:) .* t', '.');
    hold on
end


%%


figure
for i = 1:3
    t =  cmdx2(cmdx1) == i;
    plot(d(1,:) .* t', d(2,:) .* t', '.');
    xlim([-1.74 -1.695])
    hold on
end







