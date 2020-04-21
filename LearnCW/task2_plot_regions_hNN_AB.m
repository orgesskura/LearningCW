%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_AB.m


%yellow color will be used for Class 0 and blue color will be used for
%class 1

cmap = [1,  1,  0;  %yellow color
        0,  0,  1]; % blue color
K=2;
Xplot = linspace(-3, 8, 500)';
Yplot = linspace(-2, 5, 500)';  
[Xv Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)];
answer = task2_hNN_AB(gridX);
figure;
[C,h] = contourf(Xplot(:), Yplot(:), reshape(answer, length(Xplot), length(Yplot)));
set(h,"LineColor","none");
colormap(cmap);
%print('t2_regions_hNN_AB','-dpdf');