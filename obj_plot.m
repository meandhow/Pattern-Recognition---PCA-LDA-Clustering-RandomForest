function obj_plot(variable,samp,num_object,num,stime, name)
%PLOT_TIME Summary of this function goes here
%   Detailed explanation goes here


plot(stime,variable(1,samp),'r');
hold on 
plot(stime,variable(2,samp),'b');
hold on 
plot(stime,variable(3,samp),'g');
hold on 
plot(stime,variable(4,samp),'c');
hold on
plot(stime,variable(5,samp),'m');
hold on 
plot(stime,variable(6,samp),'k');
hold on 
titles = sprintf('Sampled %s', name);
title(titles);



end
