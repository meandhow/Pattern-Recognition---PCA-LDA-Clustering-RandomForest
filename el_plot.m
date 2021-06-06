function el_plot(variable,samp,num_object,num,stime, name)
%PLOT_TIME Summary of this function goes here
%   Detailed explanation goes here


for i= 1:19 
  plot(stime,variable(i,samp));
  hold on 
  
end 
% plot(stime,variable(2,samp));
% plot(stime,variable(3,samp));
% plot(stime,variable(4,samp));
% plot(stime,variable(5,samp));
% plot(stime,variable(6,samp));
titles = sprintf('Sampled %s', name);
title(titles);



end