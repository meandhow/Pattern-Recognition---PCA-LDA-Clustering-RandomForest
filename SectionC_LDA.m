%%%%%%%%%%%%%%%%%%%%%%%%% Section C: LDA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;
%% load data 

load('F0_PVT.mat');
%% object index

ac = 1;
bf = 2;
cs = 3;
fs = 4;
ks = 5;
sv = 6;

trials =10;

%%%%%%%%%%%%%%%%%%%%%%%%% Section C.1: LDA for CS and BF objects  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data Processing for CS and BF objects 


P1 = normalize(F0_PVT.P(bf,:));
V1 = normalize(F0_PVT.V(bf,:));
T1 = normalize(F0_PVT.T(bf,:));

obj1PVT = [P1;V1;T1];

P2 = normalize(F0_PVT.P(cs,:));
V2 = normalize(F0_PVT.V(cs,:));
T2 = normalize(F0_PVT.T(cs,:));

obj2PVT = [P2;V2;T2];


%% LDA for the CS anf Bf objects 
name1 = 'Car Sponge';
name2 = 'Black Foam';

[projectionPV,projectionPT,projectionTV, projectionVector_PV,projectionVector_PT, projectionVector_TV]...
    = objectLDA(obj1PVT,obj2PVT,trials, name1, name2);

%%  LDA for decreasing dimensions 

[mean_PVT,LDA_PVT, LDAlines, LDmeans] = dimLDA(obj1PVT, obj2PVT);


%ploting LDA for decreasing dimensions

y = ones(1,20);
plotdimLDA(obj1PVT,obj2PVT,mean_PVT,LDA_PVT, LDAlines, LDmeans,y, name1,name2);

%%%%%%%%%%%%%%%%%%%%%%%%% Section C.2: LDA for AC and SV objects  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Data Processing for Acrylic and Car Sponge

nF0_PVT.P = normalize(F0_PVT.P);
nF0_PVT.V = normalize(F0_PVT.V);
nF0_PVT.T = normalize(F0_PVT.T);

P1 = nF0_PVT.P(ac,:);
V1 = nF0_PVT.V(ac,:);
T1 = nF0_PVT.T(ac,:);

obj1PVT = [P1;V1;T1];

P2 = nF0_PVT.P(cs,:);
V2 = nF0_PVT.V(cs,:);
T2 = nF0_PVT.T(cs,:);

obj2PVT = [P2;V2;T2];

%% LDA for the AC anf CS objects 
name1 = 'Acrylic';
name2 = 'Car Sponge';
[projectionPV,projectionPT,projectionTV, projectionVector_PV,projectionVector_PT, projectionVector_TV]...
    = objectLDA(obj1PVT,obj2PVT,trials,name1, name2);

%%  LDA for decreasing dimensions 

[mean_PVT,LDA_PVT, LDAlines, LDmeans] = dimLDA(obj1PVT, obj2PVT);

%ploting LDA for decreasing dimensions

y = ones(1,20);
plotdimLDA(obj1PVT,obj2PVT,mean_PVT,LDA_PVT, LDAlines, LDmeans,y,name1, name2);


