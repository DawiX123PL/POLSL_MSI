%clear all
close all
clc



d1 = randn(2,100);
d2 = randn(2,100) + [9;2];
d3 = randn(2,100) + [5;5];
d4 = randn(2,100) + [10;5];

d = {d1,d2,d3,d4};
n = size(d,2);

[d, D] = cell_to_mat(d);


plot(d(1,:), d(2,:), '.')
%%

%net = selforgmap([1 n])
net = selforgmap([1 n],100,3, 'hextop');

net = train(net,d)

%%

hold on
plot( net.Iw{1}(:,1), net.Iw{1}(:,2), 'o')

distances = dist(d', net.IW{1}');
[d_dist, cmdx] = min(distances,[],2);

%%
figure
for i = 1:n
    t = cmdx == i;
    plot(d(1,:) .* t', d(2,:) .* t', '.');
    hold on
end


%%

function [d, D] = cell_to_mat(d)
    d_temp = []
    D = []
    i = 1;
    for di = d
        d_temp = [d_temp, di{1}];
        D = [D, i * ones(1, size(di{1},2))];
        i = i + 1;
    end
    d = d_temp;
end