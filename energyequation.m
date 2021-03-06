% ENERGY EQUATION IN NON-DIMENSIONAL 3 BODY PROBLEM
% CHNAGE IN ENERGY with mu

clear;close all;
syms x y z vx vy vz mu;
fps = 20;
figure(1)

r1 = sqrt((x+mu)^2+y^2+z^2);
r2 = sqrt((x-(1-mu))^2+y^2+z^2);
U = 1/2*(x^2+y^2)+(1-mu)/r1+mu/r2;
gradU = gradient(U);
Ux = gradU(1);Uy = gradU(2);Uz = gradU(3);
KE = 1/2*((vx-y)^2+(vy+x)^2+vz^2);
E = U+KE;
% Estationary = subs(E,[vx,vy,vz],[0,0,0]);
% 
% 
% dEdt = Ux*y-Uy*x+Uz/2;
% dEdt = subs(dEdt,z,0);
% dEdt = dEdt-z;
% Estationary = subs(Estationary,z,0);
% Estationary = Estationary-z;
% mu_step = 0.01;
% muN = 0:mu_step:1;
% filename = 'EanddEdtforPCR3BP.gif';
% 
% 
% for i = 1:length(muN)
%     
% 
%     dEdtN = subs(dEdt,mu,muN(i));
%     EstationaryN = subs(Estationary,mu,muN(i));
% 
% %colororder(jet(101))
% hold off;
% scatter([-muN(i),1-muN(i)],[0,0],'r','filled','DisplayName','Masses');hold on;
% xlabel('x(ND)');
% ylabel('y(ND)');
% txt = sprintf('dE/dt for mu = %.2f and z = 0',muN(i));
% title(txt);
% fimplicit3(dEdtN,[-2,2,-2,2,-50,50],'MeshDensity',100,'EdgeColor','none');hold on
% colormap(jet);
% line([1/2-muN(i) 1/2-muN(i)], [-2 2],'color','k','LineStyle','--');
% line([-2 2],[0 0],'color','k','LineStyle','--');
% 
% colorbar('Ticks',[-50 0 50],'TickLabels',{'-50', '0','50'});
% 
% 
%     frame = getframe(gcf);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     if i == 1
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
%     else
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',1/fps);
%     end
% end


%% VARIATION IN Z

% dEdt = Ux*y-Uy*x+Uz/2;
% dEdt = subs(dEdt,mu,0.01215);
% 
% z_step = 0.01;
% muEM = 0.01215;
% zN = -0.5:z_step:0.5;
% filename = 'dEdtforCR3BPmuEM.gif';
% 
% for i = 1:length(zN)
%     
% 
%     dEdtN = subs(dEdt,z,zN(i));
%     dEdtN = dEdtN-z;
% hold off;
% scatter3([-muEM,1-muEM],[0,0],[0,0],'r','filled','DisplayName','Masses');hold on;
% xlabel('x(ND)');
% ylabel('y(ND)');
% txt = sprintf('dE/dt for mu = 0.01215 and z = %.2f',zN(i));
% title(txt);
% fimplicit3(dEdtN,[-2,2,-2,2,-50,50],'MeshDensity',100,'EdgeColor','none');hold on
% colormap(jet);
% line([1/2-muEM 1/2-muEM], [-2 2],'color','k','LineStyle','--');
% line([-2 2],[0 0],'color','k','LineStyle','--');
% caxis([-10 10])
% colorbar;
% 
% 
%     frame = getframe(gcf);
%     im = frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     if i == 1
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
%     else
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',1/fps);
%     end
% end

%% FIND dEdT isosurface
dEdt = Ux*y-Uy*x+Uz/2;
dEdt = subs(dEdt,mu,0.01215);

z_step = 0.1;
muEM = 0.01215;
EN = -10:z_step:10;
filename = 'dEdtforCR3BPmuEM.gif';

for i = 1:length(EN)
    

    %dEdtN = subs(dEdt,z,zN(i));
    %dEdtN = dEdtN-z;
hold off;
scatter3([-muEM,1-muEM],[0,0],[0,0],'r','filled','DisplayName','Masses');hold on;
xlabel('x(ND)');
ylabel('y(ND)');
txt = sprintf('dE/dt for mu = 0.01215 and dEdt = %.2f',EN(i));
title(txt);
fimplicit3(dEdt-EN(i),[-2,2,-2,2,-50,50],'MeshDensity',100,'EdgeColor','none','FaceColor','green');hold on
line([1/2-muEM 1/2-muEM], [-2 2],'color','k','LineStyle','--');
line([-2 2],[0 0],'color','k','LineStyle','--');


    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',1/fps);
    end
end

