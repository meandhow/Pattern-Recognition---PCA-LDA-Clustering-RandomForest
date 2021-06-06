function  plot_fulldata(variable,num_object,time, name)
%PLOT_TIME Summary of this function goes here
%   Detailed explanation goes here


for i = 1:1:6
    
    if ~mod(i-1, 6)
        figure;
    end
    subplot(3, 2, mod(i-1, 6)+1) ;
    plot(time,variable(i,:));
end 
 title = sprintf('Full data: %s', name);
 sgtitle(title);

 
end 