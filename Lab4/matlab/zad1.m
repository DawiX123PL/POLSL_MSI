clear all
close all
clc

load('Data_PTC_vs_FTC.mat');

% polaczenie danych z identyfikatorem

X = Data.X;
D = Data.D;
Names = Data.gene_names;

% 444 901
% 791 816

p1 = [444 901]
p2 = [791 816]

X_1 = X(p1,:);
X_2 = X(p2,:);

X_12 = X([p1, p2], :);

Names_1 = Names(p1)
Names_2 = Names(p2)

Names_12 = Names([p1, p2])


XD = [X;D];

XD1 = [X_1;D];
XD2 = [X_2;D];

XD12 = [X_12;D];

%%

classificationLearner


