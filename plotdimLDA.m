function plotdimLDA(obj1PVT,obj2PVT,mean_PVT,LDA_PVT, LDAlines, LDmeans, y, name1, name2)

%ploring the 3D data 
figure;
scatter3(obj1PVT(1,:),obj1PVT(2,:),obj1PVT(3,:),'b','filled')
hold on 
scatter3(obj2PVT(1,:),obj2PVT(2,:),obj2PVT(3,:),'r','filled')
hold on
scatter3(mean_PVT(1,2),mean_PVT(2,2),mean_PVT(3,2),200,'r','filled','d')
hold on
scatter3(mean_PVT(1,1),mean_PVT(2,1),mean_PVT(3,1),200,'b','filled','d')
hold on
LD1_line = plot3(LDAlines(1,1:2),LDAlines(2,1:2),LDAlines(3,1:2),'g');
hold on
LD2_line = plot3(LDAlines(1,3:4),LDAlines(2,3:4),LDAlines(3,3:4),'color','#EDB120');
xlim([-2 2])
ylim([-2 2])
zlim([-2 2])
xlabel('Pressure')
ylabel('Vibration')
zlabel('Temperature')
axis equal
titlee = sprintf(' Three dimensional LDA for %s and %s', name1,name2);
legend([LD1_line LD2_line],'LD1 projection vector','LD2 projection vector');
sgtitle(titlee);

%ploting the 2D data 
figure;
scatter(LDA_PVT(1,1:10),LDA_PVT(2,1:10),'b','filled')
hold on
scatter(LDA_PVT(1,11:20),LDA_PVT(2,11:20),'r','filled')
hold on
scatter(LDmeans(1,2),LDmeans(2,2),200,'b','filled','d')
hold on
scatter(LDmeans(1,1) ,LDmeans(2,1),200,'r','filled','d')
hold on
xline(0,'--','color','#7E2F8E','LineWidth',2)
xlabel('LD1')
ylabel('LD2')
ylim([-2.5 2.5])
xlim([-2.5 2.5])
n1 = sprintf(' %s', name1);
n2 = sprintf(' %s', name2);
n3 = sprintf('mean %s', name1);
n4 = sprintf('mean %s', name2);
legend(n1, n2, n3,n4,'Discriminant line','Fontsize',14);
title('2D LD');

%ploting the 1D data 
figure;
scatter(LDA_PVT(1,1:10),y(1:10),'b','filled')
hold on 
scatter(LDA_PVT(1,11:20),y(11:20),'r','filled')
hold on
scatter(LDmeans(1,2),1,200,'b','filled','d')
hold on
scatter(LDmeans(1,1),1,200,'r','filled','d')
hold on
xline(0,'--','color','#7E2F8E','LineWidth',2)
xlabel('LD1')
xlim([-2.5 2.5])
set(gca,'ytick',[])
legend(n1, n2, n3,n4,'Discriminant line','Fontsize',14);
title('1D LD');
end

