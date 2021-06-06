function [mean_PVT,LDA_PVT, LDAlines, LDmeans] = dimLDA(obj1PVT,obj2PVT)
%UNTITLED4 Summary of this function goes here

PVT1 = [obj1PVT(1,:);obj1PVT(2,:);obj1PVT(3,:)]';
PVT2 = [obj2PVT(1,:);obj2PVT(2,:);obj2PVT(3,:)]';


PVT = [PVT1;PVT2]';

meanPVT1 = mean(PVT1)';
meanPVT2 = mean(PVT2)';
covPVT1 = cov(PVT1);
covPVT2 = cov(PVT2);
Sw_PVT = covPVT1 + covPVT2;
Sb_PVT = (meanPVT1-meanPVT2)*(meanPVT2-meanPVT2)';

mean_PVT = [meanPVT1, meanPVT2];



[eigenvectors_PVT, eigenvalues_PVT] = eig(inv(Sw_PVT) * Sb_PVT);

projectionVector_PVT1 = eigenvectors_PVT(:,1);
projectionVector_PVT2 = eigenvectors_PVT(:,2);
projectionVector_PVT3 = eigenvectors_PVT(:,3);

LDA_PVT1 = projectionVector_PVT1'*PVT;
LDA_PVT2 = projectionVector_PVT2'*PVT;
LDA_PVT3 = projectionVector_PVT3'*PVT;

LDA_PVT = [LDA_PVT1;LDA_PVT2;LDA_PVT3];

% LDA lines 
LDA_PVT1_line = [-projectionVector_PVT1 projectionVector_PVT1]*2;
LDA_PVT2_line = [-projectionVector_PVT2 projectionVector_PVT2]*2;

LDAlines = [ LDA_PVT1_line, LDA_PVT2_line];

% LDA means 
meanBF_LD1 = projectionVector_PVT1'*meanPVT1;
meanBF_LD2 = projectionVector_PVT2'*meanPVT1;

meanCS_LD1 = projectionVector_PVT1'*meanPVT2;
meanCS_LD2 = projectionVector_PVT2'*meanPVT2;

LDmeanCS = [meanCS_LD1; meanCS_LD2];
LDmeanBF = [meanBF_LD1; meanBF_LD2];

LDmeans = [LDmeanCS , LDmeanBF];

end

