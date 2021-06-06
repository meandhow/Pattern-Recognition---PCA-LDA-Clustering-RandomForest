function  plot_pressure(object1,object2,object3,object4,object5,object6,trial,time)
%PLOT_TIME Summary of this function goes here
%   Detailed explanation goes here

subplot(3,2,1) ;
plot(time,object1{1,trial}.F0Electrodes(2,:));
title('Acrylic');
subplot(3,2,2);
plot(time,object2{1,trial}.F0Electrodes(2,:));
title('Black Foam');
subplot(3,2,3);
plot(time,object3{1,trial}.F0Electrodes(2,:));
title('Car Sponge');
subplot(3,2,4);
plot(time,object4{1,trial}.F0Electrodes(2,:));
title('Flour Sack');
subplot(3,2,5);
plot(time,object5{1,trial}.F0Electrodes(2,:));
title('Kitchen Sponge');
subplot(3,2,6);
plot(time,object6{1,trial}.F0Electrodes(2,:));
title('Steel Vase');

sgtitle('Electrode');
end 
