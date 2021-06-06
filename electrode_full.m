function plot_allfulldata(variable,n, num_object,time, name)
%UNTITLED2 Summary of this function goes here

for i=1:n
    hold on
    plot(time,variable(i,:));
end
%legend('acrylic','black foam', 'car sponge','flour sack', 'kitchen sponge', 'steel vase');
titles = sprintf(' Full data: %s', name);
title(titles);
hold off
end

