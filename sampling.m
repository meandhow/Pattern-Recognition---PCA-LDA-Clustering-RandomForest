function sampling(variable,samp,num_object,num,stime, name)
%PLOT_TIME Summary of this function goes here
%   Detailed explanation goes here

for i= 1:1:num_object
    
    if ~mod(i-1, 6)
        figure;
    end
    subplot(3, 2, mod(i-1, 6)+1) ;
    plot(stime,variable(i,samp));
    
end
title = sprintf('Sampled %s', name);
sgtitle(title);



end



