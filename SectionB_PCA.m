 %% clear workspace
clc; clear all; close all;

%% load the data 
load('F0_PVT.mat');
load('F0_Electrodes.mat');

ac = 1:10;
bf = 11:20;
cs = 21:30;
fs = 31:40;
ks = 41:50;
sv = 51:60;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PCA FOR PVT%%%%%%%%%%%%%%%%%%%%%%%%
%% Stadarising the data

%initialising data


P =[];
V =[];
T =[];
for i = 1:6 
P= [P F0_PVT.P(i,:)];
V =[V F0_PVT.V(i,:)];
T =[T F0_PVT.T(i,:)];
end

PVT = [P;V;T]';
FO_PVTf = PVT;
save('FO_PVTf.mat','FO_PVTf');

normPVT = normalize(FO_PVTf);

%normalising data 
Pn = normPVT(:,1);
Vn = normPVT(:,2);
Tn = normPVT(:,3);



%% PCA 

[Eigenvectors, score, variances, TSQUARED, EXPLAINED] = pca(normPVT);
dimension =1:3; 
%% ploting
%plot standarised data with principle components 
 
figure;
scatter3(Pn(ac,:),Vn(ac,:),Tn(ac,:),'r','filled');
hold on 
scatter3(Pn(bf,:),Vn(bf,:),Tn(bf,:),'b','filled');
hold on 
scatter3(Pn(cs,:),Vn(cs,:),Tn(cs,:),'g','filled');
hold on 
scatter3(Pn(fs,:),Vn(fs,:),Tn(fs,:),'y','filled');
hold on 
scatter3(Pn(ks,:),Vn(ks,:),Tn(ks,:),'m','filled');
hold on 
scatter3(Pn(sv,:),Vn(sv,:),Tn(sv,:),'k','filled');
legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase');  
title('3D Representation of Sampled Data');
%legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase');
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
xlabel('Pressure')
ylabel('Vibration')
zlabel('Temperature')
hold on 
ei3d = Eigenvectors(:,dimension);
biplot(ei3d,'varlabels',{'PC1','PC2','PC3'});
title('Standarised Data With Principle Components');



%% plot reduces data 



figure;
grid on 
reduced_eig = Eigenvectors(:,1:2)';
reduced_score = score(:,1:2);
scatter(reduced_score(1:10,1),reduced_score(1:10,2),'r','filled');
hold on
scatter(reduced_score(10:20,1),reduced_score(10:20,2),'b','filled');
hold on
scatter(reduced_score(20:30,1),reduced_score(20:30,2),'g','filled');
hold on
scatter(reduced_score(30:40,1),reduced_score(30:40,2),'y','filled');
hold on
scatter(reduced_score(40:50,1),reduced_score(40:50,2),'m','filled');
hold on
scatter(reduced_score(50:60,1),reduced_score(50:60,2),'k','filled');
legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase', 'Fontsize',14);  
% hold on
% biplot(reduced_eig,'varlabels',{'PC2','PC3'});
xlim([-3 3])
ylim([-3 3])
axis square 
legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase', 'Fontsize',14);  
title('Reduced Data with Principle Components');
xlabel('Principal Component PC1')
ylabel('Principal Component PC2')
axis square 
%% 1D number lines
dimension =1; 

%y-axis for 1D plot 
y1 = ones(1,size(score,1));
y2 = 2*ones(1,size(score,1));
y3 = 3*ones(1,size(score,1));

%get each dimension seperatly 
pc1 = score(:,1)';
pc2 = score(:,2)';
pc3 = score(:,3)';

%plot 1d distribution of data for each PC
figure;
scatter(pc1,y1,'fill');
hold on 
scatter(pc2,y2,'fill');
hold on 
scatter(pc3,y3,'fill');
title('1D Distribution of Data for Each PC');
ylim([0 4]);
legend('PC1', 'PC2', 'PC3');
set(gca,'ytick',[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PCA FOR Electrodes%%%%%%%%%%%%%%%%%%%%%%%%
%% Normalise Data 
% FO_E = normalize(F0_Electrodes);

electrodes = [];

for i = 1:6
    electrodes = [electrodes squeeze(F0_Electrodes(i,:,:))];
end
electrodes=electrodes';
electrodes = normalize(electrodes);

save('electrodes.mat', 'electrodes');

%% PCA 
[Eeigenvectors, Escore, Evariances, ETSQUARED, EEXPLAINED] = pca(electrodes);
save('electrodes_PCA.mat', 'Escore');

%% Scree Plot 

xax = 1:1:length(Evariances);
sorted = sort(Evariances, 'descend');
figure;
scatter(xax, sorted,'filled');
hold on 
plot(xax, sorted,'b');
ylabel('Eigenvalues');
xlabel('Component Number');
title('Scree Plot');
%% 

figure; 
scatter3(Escore(ac,1),Escore(ac,2),Escore(ac,3),'r','filled');
hold on 
scatter3(Escore(bf,1),Escore(bf,2),Escore(bf,3),'b','filled');
hold on 
scatter3(Escore(cs,1),Escore(cs,2),Escore(cs,3),'g','filled');
hold on 
scatter3(Escore(fs,1),Escore(fs,2),Escore(fs,3),'c','filled');
hold on 
scatter3(Escore(ks,1),Escore(ks,2),Escore(ks,3),'m','filled');
hold on 
scatter3(Escore(sv,1),Escore(sv,2),Escore(sv,3),'k','filled');

xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')
% hold on
% Eeigenvectors=Eeigenvectors*3;
% biplot(Eeigenvectors(1:3,1:3),'varlabels',{'PC1','PC2','PC3'});
xlim([-6 6])
ylim([-6 6])
zlim([-6 6])
axis square
title('Electrode Data With Principle Components');

