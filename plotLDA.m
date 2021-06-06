function plotLDA(projectionPV,projectionPT,projectionTV,P,V,T,projectionVector_PV,projectionVector_PT, projectionVector_TV,trials)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x = ones(1,20);

figure;
subplot(1,2,1);
scatter(x(1:trials),projectionPV(1:trials),'filled','b')
hold on
scatter(x(trials+1:trials*2),projectionPV(trials+1:trials*2),'filled','r')
hold on
yline(0,'--','color','#7E2F8E','LineWidth',2)
% legend('Black foam','Car Sponge','Discriminant Line')
set(gca,'xtick',[])
ylim([-2 2])
xlim([-1 3])
ylabel('LD1')
axis square


subplot(1,2,2);
scatter(P(1:10),V(1:10),'filled','b')
hold on
scatter(P(11:20),V(11:20),'filled','r')
hold on
plot(projectionVector_PV(1,:),projectionVector_PV(2,:),'g')
hold on
plot(perpendicularVector_PV(1,:),perpendicularVector_PV(2,:),'--','color','#7E2F8E')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Pressure')
ylabel('Vibration')
legend('Black foam','Car Sponge','Projection vector','Discriminant Line')
axis square
sgtitle('Pressure vs Vibration');

figure;
subplot(1,2,1);
scatter(x(1:trials),projectionPT(1:trials),'filled','b')
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
scatter(P(1:10),T(1:10),'filled','b')
hold on
scatter(P(11:20),T(11:20),'filled','r')
hold on
plot(projectionVector_PT(1,:),projectionVector_PT(2,:),'g')
hold on
plot(perpendicularVector_PT(1,:),perpendicularVector_PT(2,:),'--','color','#7E2F8E')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Pressure')
ylabel('Temperature')
axis square
sgtitle('Pressure vs Temperature');


figure;
subplot(1,2,1);
scatter(x(1:trials),projectionTV(1:trials),'filled','b')
hold on
scatter(x(trials+1:trials*2),projectionTV(trials+1:trials*2),'filled','r')
hold on
yline(0,'--','color','#7E2F8E','LineWidth',2)
title('Temperature vs Vibration')
ylabel('LD1')
set(gca,'xtick',[])
ylim([-2 2])
xlim([-1 3])
axis square

subplot(1,2,2);
scatter(T(1:10),V(1:10),'filled','b')
hold on
scatter(T(11:20),V(11:20),'filled','r')
hold on
plot(projectionVector_TV(1,:),projectionVector_TV(2,:),'g')
hold on
plot(perpendicularVector_TV(1,:),perpendicularVector_TV(2,:),'--','color','#7E2F8E')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
xlabel('Temperature')
ylabel('Vibration')
sgtitle('Two dimensional LDA')
axis square
sgtitle('Temperature vs Vibration');
end

