%% README
%this code is the implementation of the models presented in 'A memory of
%errors in sensorimotor learning' writen by 'David J. Herzfeld, Pavan A.
%Vaswani, Mollie Marko, Reza Shadmehr', 2014
%in this model we implemented the effect of error in learning by the
%equation sugested in the mentioned article
%%
clear all
%%
clc
%% initialization
N = 2 ; %number of basis functions
g_mean = 0 ;
g_std = 0.5 ;
T = 120 ;
p = 0.01 ;
e = CreateNoise(T , p) ;
w = zeros(N , T) ;
ta = zeros(T , 1) ;
beta = 0.1 ;
for t = 2:T-1
    g = normal(g_mean , g_std , N , e(t-1)) ;
    w(: , t+1) = w(: , t) + beta*sign(e(t-1)*e(t))*(g/(g'*g)) ;
    ta(t-1) = dot(w(: , t-1) , g) ; 
end
%
x = [] ;
j=2;
x(1) = 1;
e1 = (1+e)/2 ;
%e1 = e
for i = 1:length(e1(:,1))-1
    if(e1(i,1) ~= e1(i+1,1))
        
        x(j) = i; j = j+1;
        
    end
end
i = length(x(1,:));
x(i+1) = length(e1(:,1));
subplot(1 , 3 , 1) ;
for i = 2:length(x(1,:))
    
    hold on
    if(sum(e1(x(1,i-1):x(1,i),1)) <= 1)
        y1 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'red');
        y1.FaceAlpha = 0.2; %make face a little transparent
        y1.EdgeAlpha = 0; %make edge totally transparent
        
    else
        y2 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'green');
        y2.FaceAlpha = 0.2; %make face a little transparent
        y2.EdgeAlpha = 0; %make edge totally transparent
        
    end
end
y3 = plot(ta(1:end-2) , 'LineWidth' , 1.5 , 'Color' , 'k') ;
legend([y1 , y2 , y3] , {'error = 1' , 'error = -1' , 'sensitivity'}) ;
xlabel('trial number') ;
title('Probability = 0.01') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 0.3 ;
e = CreateNoise(T , p) ;
w = zeros(N , T) ;
ta = zeros(T , 1) ;
beta = 0.1 ;
for t = 2:T-1
    g = normal(g_mean , g_std , N , e(t-1)) ;
    w(: , t+1) = w(: , t) + beta*sign(e(t-1)*e(t))*(g/(g'*g)) ;
    ta(t-1) = dot(w(: , t-1) , g) ; 
end
%
x = [] ;
j=2;
x(1) = 1;
e1 = (1+e)/2 ;
%e1 = e
for i = 1:length(e1(:,1))-1
    if(e1(i,1) ~= e1(i+1,1))
        
        x(j) = i; j = j+1;
        
    end
end
i = length(x(1,:));
x(i+1) = length(e1(:,1));
subplot(1 , 3 , 2) ;
for i = 2:length(x(1,:))
    
    hold on
    if(sum(e1(x(1,i-1):x(1,i),1)) <= 1)
        y1 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'red');
        y1.FaceAlpha = 0.2; %make face a little transparent
        y1.EdgeAlpha = 0; %make edge totally transparent
        
    else
        y2 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'green');
        y2.FaceAlpha = 0.2; %make face a little transparent
        y2.EdgeAlpha = 0; %make edge totally transparent
        
    end
end
y3 = plot(ta(1:end-2) , 'LineWidth' , 1.5 , 'Color' , 'k') ;
legend([y1 , y2 , y3] , {'error = 1' , 'error = -1' , 'sensitivity'}) ;
xlabel('trial number') ;
title('Probability = 0.3') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 0.5 ;
e = CreateNoise(T , p) ;
w = zeros(N , T) ;
ta = zeros(T , 1) ;
beta = 0.1 ;
for t = 2:T-1
    g = normal(g_mean , g_std , N , e(t-1)) ;
    w(: , t+1) = w(: , t) + beta*sign(e(t-1)*e(t))*(g/(g'*g)) ;
    ta(t-1) = dot(w(: , t-1) , g) ; 
end
%
x = [] ;
j=2;
x(1) = 1;
e1 = (1+e)/2 ;
%e1 = e
for i = 1:length(e1(:,1))-1
    if(e1(i,1) ~= e1(i+1,1))
        
        x(j) = i; j = j+1;
        
    end
end
i = length(x(1,:));
x(i+1) = length(e1(:,1));
subplot(1 , 3 , 3) ;
for i = 2:length(x(1,:))
    
    hold on
    if(sum(e1(x(1,i-1):x(1,i),1)) <= 1)
        y1 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'red');
        y1.FaceAlpha = 0.2; %make face a little transparent
        y1.EdgeAlpha = 0; %make edge totally transparent
        
    else
        y2 = patch(x([i-1,i,i,i-1]), [-15 -15 15 15], 'green');
        y2.FaceAlpha = 0.2; %make face a little transparent
        y2.EdgeAlpha = 0; %make edge totally transparent
        
    end
end
y3 = plot(ta(1:end-2) , 'LineWidth' , 1.5 , 'Color' , 'k') ;
legend([y1 , y2 , y3] , {'error = 1' , 'error = -1' , 'sensitivity'}) ;
xlabel('trial number') ;
title('Probability = 0.5') ;
%% function declaration
function [g] = normal(g_mean , g_std , N , e) 
g = ones(N ,1) ;
a = exp(-(e-g_mean)^2/(2*g_std^2)) ;
g = g.*a ;
end
function [e] = CreateNoise(T , p)
e = ones(T ,1) ;
for i =1:T
    e(i) = 2*(rand>p)-1 ;
end
end