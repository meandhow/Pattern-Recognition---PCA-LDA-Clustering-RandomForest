%%%%%%%%%%%%%%%%%%%%%%%%% Section D1: Clustering %%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all; 

%% load data 

load('F0_PVT.mat');
load('FO_PVTf.mat');
load('electrodes_PCA.mat');
electrodes = Escore;
electrodes=electrodes(:,1:3);
ac = 1:10;
bf = 11:20;
cs = 21:30;
fs = 31:40;
ks = 41:50;
sv = 51:60;

 %% visualisation 
meanac = mean(FO_PVTf(ac,:));
meanbf = mean(FO_PVTf(bf,:));
meancs = mean(FO_PVTf(cs,:));
meanfs = mean(FO_PVTf(fs,:));
meanks = mean(FO_PVTf(ks,:));
meansv = mean(FO_PVTf(sv,:));
 
figure;
plot3(FO_PVTf(ac,1),FO_PVTf(ac,2),FO_PVTf(ac,3),'r.','MarkerSize',12)
hold on
plot3(FO_PVTf(bf,1),FO_PVTf(bf,2),FO_PVTf(bf,3),'b.','MarkerSize',12);
hold on
plot3(FO_PVTf(cs,1),FO_PVTf(cs,2),FO_PVTf(cs,3),'g.','MarkerSize',12);
hold on
plot3(FO_PVTf(fs,1),FO_PVTf(fs,2),FO_PVTf(fs,3),'c.','MarkerSize',12);
hold on
plot3(FO_PVTf(ks,1),FO_PVTf(ks,2),FO_PVTf(ks,3),'m.','MarkerSize',12);
hold on
plot3(FO_PVTf(sv,1),FO_PVTf(sv,2),FO_PVTf(sv,3),'k.','MarkerSize',12);
hold on
plot3(meanac(1),meanac(2),meanac(3),'rx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanbf(1),meanbf(2),meanbf(3),'bx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meancs(1),meancs(2),meancs(3),'gx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanfs(1),meanfs(2),meanfs(3),'cx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanks(1),meanks(2),meanks(3),'mx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meansv(1),meansv(2),meansv(3),'kx', 'MarkerSize',15,'LineWidth',3);
hold on


% plot3(meanac,meanbf,meancs ,'kx', 'MarkerSize',15,'LineWidth',3);
% hold on 
% plot3(meanfs,meanks,meansv ,'kx', 'MarkerSize',15,'LineWidth',3);
grid on
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');

legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
    'steel vase','Centroids', 'Location','NW')
title ('Original Data with Means');
% legend('Cluster: 1','Cluster: 2', 'Cluster: 3','Cluster: 4', 'Cluster: 5',...
%     'Cluster: 6','Centroids', 'Location','NW')
%% k-means algorithm (eucledean)

% visualise data 
%  color = lines(3);
% group ={'Pressure', 'Vibration', 'Temperature'};
% gscatter(FO_PVTf(:,1),FO_PVTf(:,2), FO_PVTf(:,3));

%apply kmeans clustering with eucledean distance metric
[idx,C,sumd,D] = kmeans(FO_PVTf,6);

%visualise 
figure;
plot3(FO_PVTf(idx==1,1),FO_PVTf(idx==1,2),FO_PVTf(idx==1,3),'r.','MarkerSize',12)
hold on
plot3(FO_PVTf(idx==2,1),FO_PVTf(idx==2,2),FO_PVTf(idx==2,3),'b.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx==3,1),FO_PVTf(idx==3,2),FO_PVTf(idx==3,3),'g.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx==4,1),FO_PVTf(idx==4,2),FO_PVTf(idx==4,3),'c.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx==5,1),FO_PVTf(idx==5,2),FO_PVTf(idx==5,3),'m.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx==6,1),FO_PVTf(idx==6,2),FO_PVTf(idx==6,3),'k.','MarkerSize',12);
hold on
plot3(C(1:3,1),C(1:3,2), C(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
plot3(C(3:6,1),C(3:6,2), C(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(C(1:3,1),C(1:3,2), C(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
hold  on
plot3(C(3:6,1), C(3:6,2), C(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
% legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
%     'steel vase','Centroids', 'Location','NW')
title ('Cluster Assignments and Centroids (Eucledean)');
legend('Cluster: 1','Cluster: 2', 'Cluster: 3','Cluster: 4', 'Cluster: 5',...
    'Cluster: 6','Centroids', 'Location','NW')
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');
hold off

%% effeciency of mean 



%% k-means algorithm (citybook)

%apply kmeans clustering with citybook distance metric
[idx2,C2,sumd2,D2] = kmeans(FO_PVTf,6,'Distance','cityblock');

%visualise 

figure;
plot3(FO_PVTf(idx2==1,1),FO_PVTf(idx2==1,2),FO_PVTf(idx2==1,3),'r.','MarkerSize',12)
hold on
plot3(FO_PVTf(idx2==2,1),FO_PVTf(idx2==2,2),FO_PVTf(idx2==2,3),'b.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx2==3,1),FO_PVTf(idx2==3,2),FO_PVTf(idx2==3,3),'g.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx2==4,1),FO_PVTf(idx2==4,2),FO_PVTf(idx2==4,3),'c.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx2==5,1),FO_PVTf(idx2==5,2),FO_PVTf(idx2==5,3),'m.','MarkerSize',12);
hold on
plot3(FO_PVTf(idx2==6,1),FO_PVTf(idx2==6,2),FO_PVTf(idx2==6,3),'k.','MarkerSize',12);
hold on
plot3(C2(1:3,1),C2(1:3,2), C2(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
plot3(C2(3:6,1), C2(3:6,2), C2(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
% legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
%     'steel vase','Centroids', 'Location','NW')
legend('Cluster: 1','Cluster: 2', 'Cluster: 3','Cluster: 4', 'Cluster: 5',...
    'Cluster: 6','Centroids', 'Location','NW')
title ('Cluster Assignments and Centroids (Cityblock)');
xlabel('Pressure');
ylabel('Vibration');
zlabel('Temperature');



%%%%%%%%%%%%%%%% Clustering the electrodes%%%%%%%%%%%%%%





 %% visualisation 
meanac = mean(electrodes(ac,:));
meanbf = mean(electrodes(bf,:));
meancs = mean(electrodes(cs,:));
meanfs = mean(electrodes(fs,:));
meanks = mean(electrodes(ks,:));
meansv = mean(electrodes(sv,:));
 
figure;
plot3(electrodes(ac,1),electrodes(ac,2),electrodes(ac,3),'r.','MarkerSize',12)
hold on
plot3(electrodes(bf,1),electrodes(bf,2),electrodes(bf,3),'b.','MarkerSize',12);
hold on
plot3(electrodes(cs,1),electrodes(cs,2),electrodes(cs,3),'g.','MarkerSize',12);
hold on
plot3(electrodes(fs,1),electrodes(fs,2),electrodes(fs,3),'c.','MarkerSize',12);
hold on
plot3(electrodes(ks,1),electrodes(ks,2),electrodes(ks,3),'m.','MarkerSize',12);
hold on
plot3(electrodes(sv,1),electrodes(sv,2),electrodes(sv,3),'k.','MarkerSize',12);
hold on
plot3(meanac(1),meanac(2),meanac(3),'rx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanbf(1),meanbf(2),meanbf(3),'bx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meancs(1),meancs(2),meancs(3),'gx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanfs(1),meanfs(2),meanfs(3),'cx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meanks(1),meanks(2),meanks(3),'mx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(meansv(1),meansv(2),meansv(3),'kx', 'MarkerSize',15,'LineWidth',3);
hold on


% plot3(meanac,meanbf,meancs ,'kx', 'MarkerSize',15,'LineWidth',3);
% hold on 
% plot3(meanfs,meanks,meansv ,'kx', 'MarkerSize',15,'LineWidth',3);
grid on
xlabel('Principal Component 1');
ylabel('Principal Component 2');
zlabel('Principal Component 3');

legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
    'steel vase','Centroids', 'Location','NW')
title ('Original Electrodes Data with Means');
axis square

%% k-means algorithm (eucledean)

% visualise data 
%  color = lines(3);
% group ={'Pressure', 'Vibration', 'Temperature'};
% gscatter(electrodes(:,1),electrodes(:,2), electrodes(:,3));

%apply kmeans clustering with eucledean distance metric
[idx,C,sumd,D] = kmeans(electrodes,6);

%visualise 
figure;
plot3(electrodes(idx==1,1),electrodes(idx==1,2),electrodes(idx==1,3),'r.','MarkerSize',12)
hold on
plot3(electrodes(idx==2,1),electrodes(idx==2,2),electrodes(idx==2,3),'b.','MarkerSize',12);
hold on
plot3(electrodes(idx==3,1),electrodes(idx==3,2),electrodes(idx==3,3),'g.','MarkerSize',12);
hold on
plot3(electrodes(idx==4,1),electrodes(idx==4,2),electrodes(idx==4,3),'c.','MarkerSize',12);
hold on
plot3(electrodes(idx==5,1),electrodes(idx==5,2),electrodes(idx==5,3),'m.','MarkerSize',12);
hold on
plot3(electrodes(idx==6,1),electrodes(idx==6,2),electrodes(idx==6,3),'k.','MarkerSize',12);
hold on
plot3(C(1:3,1),C(1:3,2), C(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
plot3(C(3:6,1),C(3:6,2), C(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
hold on
plot3(C(1:3,1),C(1:3,2), C(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
hold  on
plot3(C(3:6,1), C(3:6,2), C(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
% legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
%     'steel vase','Centroids', 'Location','NW')
title ('Electrodes: Cluster Assignments and Centroids (Eucledean)');
legend('Cluster: 1','Cluster: 2', 'Cluster: 3','Cluster: 4', 'Cluster: 5',...
    'Cluster: 6','Centroids', 'Location','NW')
xlabel('Principal Component 1');
ylabel('Principal Component 2');
zlabel('Principal Component 3');
hold off
axis square

%% effeciency of mean 



%% k-means algorithm (citybook)

%apply kmeans clustering with citybook distance metric
[idx2,C2,sumd2,D2] = kmeans(electrodes,6,'Distance','cityblock');

%visualise 

figure;
plot3(electrodes(idx2==1,1),electrodes(idx2==1,2),electrodes(idx2==1,3),'r.','MarkerSize',12)
hold on
plot3(electrodes(idx2==2,1),electrodes(idx2==2,2),electrodes(idx2==2,3),'b.','MarkerSize',12);
hold on
plot3(electrodes(idx2==3,1),electrodes(idx2==3,2),electrodes(idx2==3,3),'g.','MarkerSize',12);
hold on
plot3(electrodes(idx2==4,1),electrodes(idx2==4,2),electrodes(idx2==4,3),'c.','MarkerSize',12);
hold on
plot3(electrodes(idx2==5,1),electrodes(idx2==5,2),electrodes(idx2==5,3),'m.','MarkerSize',12);
hold on
plot3(electrodes(idx2==6,1),electrodes(idx2==6,2),electrodes(idx2==6,3),'k.','MarkerSize',12);
hold on
plot3(C2(1:3,1),C2(1:3,2), C2(1:3,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
plot3(C2(3:6,1), C2(3:6,2), C2(3:6,3),'kx', 'MarkerSize',15,'LineWidth',3);
grid on 
% legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge',...
%     'steel vase','Centroids', 'Location','NW')
legend('Cluster: 1','Cluster: 2', 'Cluster: 3','Cluster: 4', 'Cluster: 5',...
    'Cluster: 6','Centroids', 'Location','NW')
title ('Electrodes: Cluster Assignments and Centroids (Cityblock)');
xlabel('Principal Component 1');
ylabel('Principal Component 2');
zlabel('Principal Component 3');
axis square


%%%%%%%%%%%%%%%%%%%%%%%%% Section D2: Bagging %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% spliting the data
electrodes = electrodes';
[m,n] = size(electrodes);  % get the size
ix = randperm(n); % randomly permute the indices 
Training = electrodes(:,ix(1:round(n*0.60)))';  
Testing = electrodes(:,ix(round(n*0.60)+1:end));
figure
plot(electrodes(1,:))
ac = 1:10;
bf = 11:20;
cs = 21:30;
fs = 31:40;
ks = 41:50;
sv = 51:60;
% labelTraining=zeros(19,36);
for i = 1:length(1:round(n*0.60))
    if any(ac==ix(i))
        labelTraining{i}='acrylic';
    elseif any(bf==ix(i))
        labelTraining{i}='black foam';
    elseif any(cs==ix(i))
        labelTraining{i}='car sponge';
    elseif any(fs==ix(i))
        labelTraining{i}='flour sack';
    elseif any(ks==ix(i))
        labelTraining{i}='kitchen sponge';
    elseif any(sv==ix(i))
        labelTraining{i}='steel vase';
    end
end

for i = 1:length(round(n*0.60)+1:n)
    b=i+36;
    if any(ac==ix(b))
        labelTesting{i}='acrylic';
    elseif any(bf==ix(b))
        labelTesting{i}='black foam';
    elseif any(cs==ix(b))
        labelTesting{i}='car sponge';
    elseif any(fs==ix(b))
        labelTesting{i}='flour sack';
    elseif any(ks==ix(b))
        labelTesting{i}='kitchen sponge';
    elseif any(sv==ix(b))
        labelTesting{i}='steel vase';
    end
end
% labelTesting
% Testing = electrodes(:,round(n*0.40)+1:round(n*0.80));
% 
% [m,n] = size(electrodes) ;
% idx = randperm(m) ;  % shuffle the rows 
% Training = electrodes(1:round(m*0.60),:) ;  
% Testing = electrodes(round(m*0.40)+1:round(m*0.80),:) ;
% Training = electrodes(idx(1:round(0.6*m)),:) ; 
% Testing = electrodes(idx(round(0.6*m)+1:end),:) ;

%% bagging 

labels={'acrylic';'black foam'; 'car sponge';'flour sack';'kitchen sponge';...
    'steel vase'};
% labels = {'x1';'x2';'x3';'x4';'x5'; 'x6';'x7';'x8';'x9';'x10'; 'x11';'x12';... 
%     'x13';'x14';'x15';'x16';'x17';'x18';'x19'};
% 
% labels={'acrylic','black foam', 'car sponge','flour sack','kitchen sponge',...
%     'steel vase'};

bagging= TreeBagger(50, Training, labelTraining);
labelTesting = labelTesting';
result = predict(bagging,Testing');

%% visualise trees

%First Tree
view(bagging.Trees{2},'Mode','graph')
%Second Tree
view(bagging.Trees{4},'Mode','graph')

confusionchart(labelTesting,result)