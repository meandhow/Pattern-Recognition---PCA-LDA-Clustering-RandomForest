function plot_allfulldata(variable,n, num_object,time, name)
%UNTITLED2 Summary of this function goes here

plot(time,variable(1,:),'r');
hold on
plot(time,variable(2,:),'b');
hold on
plot(time,variable(3,:),'g');
hold on
plot(time,variable(4,:),'c');
hold on
plot(time,variable(5,:),'m');
hold on
plot(time,variable(6,:),'k');
hold on
%legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase');
titles = sprintf(' Full data: %s', name);
title(titles);
hold off
end

