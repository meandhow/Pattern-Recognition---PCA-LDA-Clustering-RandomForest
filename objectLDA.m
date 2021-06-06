function [projectionPV,projectionPT,projectionTV,projectionVector_PV,projectionVector_PT, projectionVector_TV] = objectLDA(obj1PVT,obj2PVT,trials, name1, name2)


PV1 = [obj1PVT(1,:);obj1PVT(2,:)]';
PT1 = [obj1PVT(1,:);obj1PVT(3,:)]';
TV1 = [obj1PVT(3,:);obj1PVT(2,:)]';


PV2 = [obj2PVT(1,:);obj2PVT(2,:)]';
PT2 = [obj2PVT(1,:);obj2PVT(3,:)]';
TV2 = [obj2PVT(3,:);obj2PVT(2,:)]';

PVm = [PV1; PV2]';
PTm = [PT1; PT2]';
TVm = [TV1; TV2]';

mean1PV = mean(PV1)';
mean2PV = mean(PV2)';
mean1PT = mean(PT1)';
mean2PT = mean(PT2)';
mean1TV = mean(TV1)';
mean2TV = mean(TV2)';

COV1PV = cov(PV1);
COV2PV = cov(PV2);
COV1PT = cov(PT1);
COV2PT = cov(PT2);
COV1TV = cov(TV1);
COV2TV = cov(TV2);

Sw_PV = COV1PV + COV2PV;
Sw_PT = COV1PT + COV2PT;
Sw_TV = COV1TV + COV2TV;

Sb_PV = (mean1PV-mean2PV)*(mean1PV-mean2PV)';
Sb_PT = (mean1PT-mean2PT)*(mean1PT-mean2PT)';
Sb_TV = (mean1TV-mean2TV)*(mean1TV-mean2TV)';


[eigenvectors_PV, eigenvalues_PV] = eig(inv(Sw_PV) * Sb_PV);
[eigenvectors_PT, eigenvalues_PT] = eig(inv(Sw_PT) * Sb_PT);
[eigenvectors_TV, eigenvalues_TV] = eig(inv(Sw_TV) * Sb_TV);

projectionVector_PV = eigenvectors_PV(:,2);
projectionVector_PT = eigenvectors_PT(:,2);
projectionVector_TV = eigenvectors_TV(:,2);

projectionPV = projectionVector_PV'*PVm;
projectionPT = projectionVector_PT'*PTm;
projectionTV = projectionVector_TV'*TVm;

projectionVector_PV=[-projectionVector_PV projectionVector_PV]*2;
slope = projectionVector_PV(2,2)/projectionVector_PV(1,2);
perpendicularVector_PV = [-[1;-1/slope] [1;-1/slope]]*2;

projectionVector_PT=[-projectionVector_PT projectionVector_PT]*2;
slope = projectionVector_PT(2,2)/projectionVector_PT(1,2);
perpendicularVector_PT = [-[1;-1/slope] [1;-1/slope]]*2;

projectionVector_TV=[-projectionVector_TV projectionVector_TV]*2;
slope = projectionVector_TV(2,2)/projectionVector_TV(1,2);
perpendicularVector_TV = [-[1;-1/slope] [1;-1/slope]]*2;



x = ones(1,20);
name1 = sprintf(' %s', name1);
name2 = sprintf(' %s', name2);
name3 = sprintf(' mean %s', name1);
name4 = sprintf(' mean %s', name1);

figure;
subplot(1,2,1);
scatter(x(1:trials),projectionPV(1:trials),'filled','b')
hold on
scatter(x(trials+1:trials*2),projectionPV(trials+1:trials*2),'filled','r')
hold on
scatter(1,mean1PV(1),150,'b','filled','d')
hold on
scatter(1,mean2PV(1),150,'r','filled','d')
hold on 
yline(0,'--','color','#7E2F8E','LineWidth',2)
hold on
set(gca,'xtick',[])
ylim([-2 2])
xlim([-1 3])
ylabel('LD1')
axis square
ylabel('LD1')
title('Pressure vs Vibration')
axis square


subplot(1,2,2);
scatter(obj1PVT(1,:),obj1PVT(2,:),'filled','b')
hold on
scatter(obj2PVT(1,:),obj2PVT(2,:),'filled','r')
hold on 
scatter(mean1PV(1),mean1PV(2),100,'b','filled','d')
hold on 
scatter(mean2PV(1),mean2(2), 100,'r','filled','d')
hold on
plot(projectionVector_PV(1,:),projectionVector_PV(2,:),'g')
hold on
plot(perpendicularVector_PV(1,:),perpendicularVector_PV(2,:),'--','color','#7E2F8E')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Pressure')
ylabel('Vibration')
legend(name1,name2,name3,name4,'Discriminant line','Fontsize',14)
axis square
sgtitle('Pressure vs Vibration');

figure;
subplot(1,2,1);
scatter(x(1:trials),projectionPT(1:trials),'filled','b')
hold on
scatter(1,mean1PT(1),150,'b','filled','d')
hold on
scatter(1,mean2PT(1),150,'r','filled','d')
hold on 
scatter(x(trials+1:trials*2),projectionPT(trials+1:trials*2),'filled','r')
hold on
yline(0,'--','color','#7E2F8E','LineWidth',2)
title('Pressure vs Temperature')
set(gca,'xtick',[])
ylim([-2 2])
xlim([-1 3])
ylabel('LD1')
axis square


subplot(1,2,2);
scatter(obj1PVT(1,:),obj1PVT(3,:),'filled','b')
hold on
scatter(obj2PVT(1,:),obj2PVT(3,:),'filled','r')
hold on
scatter(mean1PT(1),mean1PT(2),100,'b','filled','d')
hold on 
scatter(mean2PT(1),mean2PT(2),100,'r','filled','d')
hold on
plot(projectionVector_PT(1,:),projectionVector_PT(2,:),'g')
hold on
plot(perpendicularVector_PT(1,:),perpendicularVector_PT(2,:),'--','color','#7E2F8E')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Pressure')
ylabel('Temperature')
axis square
legend(name1,name2,name3,name4,'Discriminant line','Fontsize',14)
sgtitle('Pressure vs Temperature');

figure;
subplot(1,2,1);
scatter(x(1:trials),projectionTV(1:trials),'filled','b')
hold on
scatter(x(trials+1:trials*2),projectionTV(trials+1:trials*2),'filled','r')
hold on
scatter(1,mean1PV(1),150,'b','filled','d')
hold on
scatter(1,mean2PV(1),150,'r','filled','d')
hold on
yline(0,'--','color','#7E2F8E','LineWidth',2)
title('Temperature vs Vibration')
legend(name1,name2,'Projection vector','Discriminant Line', 'Location', 'southwest' );
ylabel('LD1')
set(gca,'xtick',[])
ylim([-2 2])
xlim([-1 3])
axis square



subplot(1,2,2);
scatter(obj1PVT(3,:),obj1PVT(2,:),'filled','b')
hold on
scatter(obj2PVT(3,:),obj2PVT(2,:),'filled','r')
hold on 
scatter(mean1TV(1),mean1TV(2),100,'b','filled','d')
hold on 
scatter(mean2TV(1),mean2TV(2),100,'r','filled','d')
hold on
plot(projectionVector_TV(1,:),projectionVector_TV(2,:),'g')
hold on
plot(perpendicularVector_TV(1,:),perpendicularVector_TV(2,:),'--','color','#7E2F8E');
legend(name1,name2,name3,name4,'Discriminant line','Fontsize',14)
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Temperature')
ylabel('Vibration')
axis square
sgtitle('Pressure vs Temperature');


end

