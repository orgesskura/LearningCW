%
% Versin 0.9  (HS 06/03/2020)
%
% template script for task2_plot_regions_hNN_A.m

%yellow color will be used for Class 0 and blue color will be used for
%class 1
cmap = [1,  1,  0;  %yellow color
        0,  0,  1]; % blue color

Xplot = linspace(2, 4, 500)';
Yplot = linspace(0.5, 2.5, 500)';  
[Xv Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)];
answer = task2_hNN_A(gridX);
figure;
[C,h] = contourf(Xplot(:), Yplot(:), reshape(answer, length(Xplot), length(Yplot)));
set(h,"LineColor","none");
colormap(cmap);
