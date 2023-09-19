%% README
%this code is the implementation of the models presented in 'Interacting
%Adaptive Processes with Different Timescales Underlie Short-Term Motor
%Learning' article writen by 'Maurice A. Smith, Ali Ghazizadeh, Reza
%Shadmehr' , 2006
%it will vastly investigated three discussed mdels named:
% 1)Single State Model
% 2)Two State; Gain-Specific Model
% 3)Two State; Gain-Independent; Multi-RateModel
%%
clear all
%%
clc
%% initialization
A = 0.99 ;
B = 0.013 ;
As = 0.996 ;
Af = 0.92 ;
Bs = 0.004 ;
Bf = 0.03 ;
%% second article / first figure 
r = 40 ;
l = 2000 ;
e = ones(l , 1) ;
e(1:r) = 0 ;
start = 1000 ;
subplot(5 , 3 , 2)
[n , e] = FindBoundarySingle(A , B , e , start) ;
plot(e , 'LineWidth' , 2 , 'Color' , 'k') ;
hold on ;
ylim([-1.2 , 1.2]) ;
%
v = [r -1.2; start-1 -1.2; start-1 1.2; r 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
v = [start -1.2; n-1 -1.2; n-1 1.2; start 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n -1.2; l -1.2; l 1.2; n 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
plot(e , 'LineWidth' , 2 , 'Color' , 'k') ;
%
legend('Disturbance' , 'adaptation trials' , 'deadaptation trials' , 'readaptation trials');
title('Paradigm for Relearning Experiment') ;
% single state
[n1 , e1] = FindBoundarySingle(A , B , e , start) ;
x_single = SingleState(A , B , e1) ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(5 , 3 , 4) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n1-1 y1; n1-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 y1; l y1; l y2; n1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
h1 = plot(x_single, 'LineWidth' , 2 , 'Color' , 'red') ;
ylim([y1 y2]) ;
%
legend( [h1] , {'Net Adaptation'});
title('Single-State Model') ;
ylabel('Adaptation') ;
% Gain specific
[n2 , e2] = FindBoundaryGain(A , B , e , start) ;
[x_gain , x_gain1 , x_gain2] = GainSpecific(A , B , e2) ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(5 , 3 , 5) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n2-1 y1; n2-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n2 y1; l y1; l y2; n2 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
ylim([y1 y2]) ;
%
h1 = plot(x_gain, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_gain1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_gain2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend([h1 , h2 , h3] , {'Net Adaptation' , 'Up State' , 'Down State'});
title('Gain-Specific Model') ;
ylabel('Adaptation') ;
% Multi rate
[n3 , e3] = FindBoundaryMulti(Af , As , Bf , Bs , e , start) ;
[x_multi , x_multi1 , x_multi2] = MultiRate(Af , As , Bf , Bs , e3) ;
%
y1 = -1.5 ;
y2 = 1.5 ;
subplot(5 , 3 , 6) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n3-1 y1; n3-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n3 y1; l y1; l y2; n3 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
ylim([y1 y2]) ;
%
h1 = plot(x_multi, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_multi1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_multi2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend([h1 , h2 , h3] ,{'Net Adaptation' , 'Fast State' , 'Slow State'});
title('Multi-Rate Model') ;
ylabel('Adaptation') ;
% figure1 initial vs relearning
subplot(5 , 3 , 7) ;
plot(x_single(r+1:start) , 'LineWidth' , 1.5 , 'Color' , 'red') ;
hold on
plot(x_single(n1:end) , '--' , 'LineWidth' , 2 , 'Color' , 'red') ;
xlim([1 min((start-(r+1)) , (l-n1))]) ;
ylim([0 , 1.5]) ;
title('Single-State Model') ;
legend('Intial Learning' , 'Relearning') ;
subplot(5 , 3 , 8) ;
plot(x_gain(r+1:start) , 'LineWidth' , 2 , 'Color' , 'red') ;
hold on
plot(x_gain(n2:end) , '--' , 'LineWidth' , 2 , 'Color' , 'red') ;
xlim([1 min((start-(r+1)) , (l-n2))]) ;
ylim([0 , 1.5]) ;
title('Gain-Specific Model') ;
legend('Intial Learning' , 'Relearning') ;
subplot(5 , 3 , 9) ;
plot(x_multi(r+1:start) , 'LineWidth' , 2 , 'Color' , 'red') ;
hold on
plot(x_multi(n3:end) , '--' , 'LineWidth' , 2 , 'Color' , 'red') ;
xlim([1 min((start-(r+1)) , (l-n3))]) ;
ylim([0 , 1.5]) ;
title('Multi-Rate Model') ;
legend('Intial Learning' , 'Relearning') ;
% figure1 saving percentage
p_single = [] ;
p_gain = [] ;
p_multi = [] ;
s = 30 ;
r = 40 ;
for i = 1:300
    e_n = e1 ;
    e_n(n1:n1+i) = 0 ;
    x = SingleState1(A , B , e_n , n1-1) ;
    p_single = [p_single , 100*abs((x(s+r)-x(n1+i+s)))/x(n1+i+s)] ;
    e_n = e2 ;
    e_n(n2:n2+i) = 0 ;
    [x , x1 , x2] = GainSpecific1(A , B , e_n , n2-1) ;
    p_gain = [p_gain , 100*abs((x(s+r)-x(n2+i+s)))/x(n2+i+s)] ;
    e_n = e3 ;
    e_n(n3:n3+i) = 0 ;
    [x , x1 , x2] = MultiRate1(Af , As , Bf , Bs , e_n , n3-1) ;
    p_multi = [p_multi , 100*abs((x(s+r)-x(n3+i+s)))/x(n3+i+s)] ;
    %p_multi = [p_multi , 100*abs((x(s+r)/x(start)-x(n3+i+s)/x(start)))] ;
end
subplot(5 , 3 , 13)  ;
plot(p_single , 'LineWidth' , 2 ) ;
ylim([-5 100]) ; 
title('Single-State Model') ;
xlabel('%Saving') ;
subplot(5 , 3 , 14) ;
plot(p_gain , 'LineWidth' , 2 ) ;
title('Gain-Specific Model') ;
xlabel('%Saving') ;
ylim([-5 100]) ; 
subplot(5 , 3 , 15) ;
plot(p_multi , 'LineWidth' , 2 ) ;
title('Multi-Rate Model') ;
xlabel('%Saving') ;
ylim([-5 100]) ; 
% figure1 error wash out 
e_n = e1 ;
k = 300 ; 
e_n(n1:n1+k) = 0 ;
subplot(5 , 3 , 11) ;
%
v = [r -1.2; start-1 -1.2; start-1 1.2; r 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start -1.2; n1-1 -1.2; n1-1 1.2; start 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 -1.2; n1+k-1 -1.2; n1+k-1 1.2; n1 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[1 1 1]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
v = [n1+k -1.2; l -1.2; l 1.2; n1+k 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
plot(e_n , 'LineWidth' , 2 , 'Color' , 'k') ;
ylim([-1.2 , 1.2]) ;
%
legend('adaptation trials' , 'deadaptation trials' , 'eash out trials' , 'readaptation trials' , 'Disturbance');
title('Relearning Experiment with Washout') ;
%% figure2 error clamp
e_n = e1 ;
k = 300 ; 
e_n(n1:l) = 0 ;
subplot(4 , 3 , 2) ;
%
v = [r -1.2; start-1 -1.2; start-1 1.2; r 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start -1.2; n1-1 -1.2; n1-1 1.2; start 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 -1.2; l -1.2; l 1.2; n1 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
plot(e_n , 'LineWidth' , 2 , 'Color' , 'k') ;
ylim([-1.2 , 1.2]) ;
%
legend('adaptation trials' , 'deadaptation trials' , 'error clamp trials' , 'Disturbance');
title('Paradigm for Error-clamp Experiment') ;
% figure2 single-state error clamp
%
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 4) ;
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n1-1 y1; n1-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 y1; l y1; l y2; n1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
ylim([y1 , y2]) ;
%
x_single = SingleState1(A , B , e_n , n1) ;
h1 = plot(x_single, 'LineWidth' , 2 , 'Color' , 'red') ;
title('Single-State Model') ;
ylabel('Adaptation') ;
legend([h1] , {'Net Adaptation'})
% figure2 gain-specific error clamp
%
e_n = e2 ;
e_n(n2:l) = 0 ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 5) ;
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n2-1 y1; n2-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n2 y1; l y1; l y2; n2 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
ylim([y1 , y2]) ;
%
[x_gain , x_gain1 , x_gain2] = GainSpecific1(A , B , e_n , n2-1) ;
h1 = plot(x_gain, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_gain1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_gain2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend( [h1 , h2 , h3] , {'Net Adaptation' , 'Up State' , 'Down State'});
title('Gain-Specific Model') ;
ylabel('Adaptation') ;
% figure2 multi-rate error clamp
%
e_n = e3 ;
e_n(n3:l) = 0 ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 6) ;
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n3-1 y1; n3-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n3 y1; l y1; l y2; n3 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
ylim([y1 , y2]) ;
%
[x_multi , x_multi1 , x_multi2] = MultiRate1(Af , As , Bf , Bs , e_n , n3-1) ;
h1 = plot(x_multi, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_multi1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_multi2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend([h1 , h2 , h3] , {'Net Adaptation' , 'Fast State' , 'Slow State'});
title('Multi-Rate Model') ;
ylabel('Adaptation') ;
% figure2 error clamp
e_n = e1 ;
k = 300 ; 
e_n(n1:n1+k) = 0 ;
subplot(4 , 3 , 8) ;
%
v = [r -1.2; start-1 -1.2; start-1 1.2; r 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start -1.2; n1-1 -1.2; n1-1 1.2; start 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 -1.2; n1+k -1.2; n1+k 1.2; n1 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1+k+1 -1.2; l -1.2; l 1.2; n1+k+1 1.2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
plot(e_n , 'LineWidth' , 2 , 'Color' , 'k') ;
ylim([-1.2 , 1.2]) ;
%
legend('adaptation trials' , 'deadaptation trials' , 'error clamp trials' , 'readaptation trials' , 'Disturbance');
title('Error-clamp/Relearning Experiment') ;
% figure2 error clamp single-state
e_n = e1 ;
k = 300 ; 
e_n(n1:n1+k) = 0 ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 10) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n1-1 y1; n1-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1 y1; n1+k y1; n1+k y2; n1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n1+k+1 y1; l y1; l y2; n1+k+1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;

ylim([y1 , y2]) ;
%
x_single = SingleState1(A , B , e_n , n1) ;
h1 = plot(x_single, 'LineWidth' , 2 , 'Color' , 'red') ;
title('Single-State Model') ;
ylabel('Adaptation') ;
legend([h1] , {'Net Adaptation'}) ;
% figure2 error clamp gain-specific
e_n = e2 ;
k = 200 ; 
e_n(n2:n2+k) = 0 ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 11) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n2-1 y1; n2-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n2 y1; n2+k y1; n2+k y2; n2 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n2+k+1 y1; l y1; l y2; n2+k+1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
ylim([y1 , y2]) ;
%
[x_gain , x_gain1 , x_gain2] = GainSpecific1(A , B , e_n , n2-1) ;
h1 = plot(x_gain, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_gain1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_gain2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend([h1 , h2 , h3] , {'Net Adaptation' , 'Up State' , 'Down State'});
title('Gain-Specific Model') ;
ylabel('Adaptation') ;
% figure2 error clamp multi-rate
e_n = e3 ;
k = 200 ; 
e_n(n3:n3+k) = 0 ;
y1 = -1.5 ;
y2 = 1.5 ;
subplot(4 , 3 , 12) ;
%
v = [r y1; start-1 y1; start-1 y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
%
v = [start y1; n3-1 y1; n3-1 y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n3 y1; n3+k y1; n3+k y2; n3 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','green') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
v = [n3+k+1 y1; l y1; l y2; n3+k+1 y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.8 0.8 0.8]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
hold on ;
ylim([y1 , y2]) ;
%
[x_multi , x_multi1 , x_multi2] = MultiRate1(Af , As , Bf , Bs , e_n , n3-1) ;
h1 = plot(x_multi, 'LineWidth' , 2 , 'Color' , 'red') ;
hold on ;
h2 = plot(x_multi1 , '--' , 'LineWidth' , 2 , 'Color' , 'green') ;
h3 = plot(x_multi2 , '--' , 'LineWidth' , 2 , 'Color' , 'blue') ;
%
legend([h1 , h2 , h3] , {'Net Adaptation' , 'Fast State' , 'Slow State'});
title('Multi-Rate Model') ;
ylabel('Adaptation') ;
%% figure 4
l = 300 ;
e_new = ones(l , 1) ;
r = 40 ;
t = [30 , 60 , 120] ;
s = 60 ;
start = 150 ;
e_new(1:r) = 0 ;
e_ex = e_new ;
e_ex(start:end) = -1 ;
subplot(3 , 2 , 1) ;
y1 = -1.2 ;
y2 = 1.2 ;
hold on ;
ylim([y1 , y2]) ;
%
v = [r y1; start y1; start y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
v = [start y1; l y1; l y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','red') ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
plot(e_ex , 'LineWidth' , 2 , 'Color' , 'k') ;
%
title('Paradigm') ;
% initialization figure 4
As = 0.996 ;
Af = 0.75 ;
Bs = 0.01 ;
Bf = 1 ;
% figure4 part1
re = 30 ;
e_extra = ones(re , 1) ;
e_new1 = e_new(1:r+t(1)+1+s);
e_new1(r+t(1)+1:end) = -1 ;
e_new1 = [e_new1 ; e_extra] ;
e_new2 = e_new(1:r+t(2)+1+s) ;
e_new2(r+t(2)+1:end) = -1 ;
e_new2 = [e_new2 ; e_extra] ;
e_new3 = e_new(1:r+t(3)+1+s) ;
e_new3(r+t(3)+1:end) = -1 ;
e_new3 = [e_new3 ; e_extra] ;
[x_new , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new(1:r+t(3))) ;
[x_new1 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new1) ;
[x_new2 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new2) ;
[x_new3 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new3) ;
subplot(3 , 2 , 2) ;
hold on ;
plot(x_new1(1:r+t(1)+1+s)/(1.5*x_new(end)) , '--' , 'LineWidth' , 1.5 , 'Color' , 'red') ;
plot(x_new2(1:r+t(2)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'green') ;
plot(x_new3(1:r+t(3)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'c') ;
plot(x_new/(1.5*x_new(end))  , 'LineWidth' , 1.5 , 'Color' , 'blue') ;
xlim([0 225]) ;
ylim([-0.8 , 0.8]) ;
legend('30 trials' , '60 trials' , '120 trials' , 'original adaptation') ;
%
% figure ;
% plot((x_new(r+1:re+r)-x_new(r+1))/(1.1*x_new(end))) ;
% hold on ;
% plot((x_new1(r+t(1)+2+s:end)-x_new1(r+t(1)+2+s))/(x_new1(end)-x_new1(r+t(1)+2+s))/1.3) ;
% plot((x_new2(1+r+t(2)+1+s:end)-x_new2(1+r+t(2)+1+s))/(x_new2(end)-x_new2(1+r+t(2)+1+s))/1.4) ;
% plot((x_new3(1+r+t(3)+1+s:end)-x_new3(1+r+t(3)+1+s))/(x_new3(end)-x_new3(1+r+t(3)+1+s))/1.6) ;
%
% plot((x_new1(r+t(1)+2+s:end)-x_new1(r+t(1)+2+s))) ;
% hold on ;
% plot((x_new2(1+r+t(2)+1+s:end)-x_new2(1+r+t(2)+1+s))) ;
% plot((x_new3(1+r+t(3)+1+s:end)-x_new3(1+r+t(3)+1+s))) ;
% %plot(x_new) ;
% figure 4 part 2
l = 300 ;
e_new = ones(l , 1) ;
r = 40 ;
t = [30 , 60 , 120] ;
s = 60 ;
start = 150 ;
e_new(1:r) = 0 ;
e_ex = e_new ;
e_ex(start:end) = 0 ;
y1 = -1.2 ;
y2 = 1.2 ;
subplot(3 , 2 , 3) ;
hold on ;
ylim([y1 , y2]) ;
%
v = [r y1; start y1; start y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
v = [start y1; l y1; l y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[1 1 1]) ;
h.FaceAlpha = 0.2;
h.EdgeAlpha = 0 ;
%
plot(e_ex , 'LineWidth' , 2 , 'Color' , 'k') ;
%
title('Paradigm') ;
% figure 4 part 2
re = 50 ;
e_extra = ones(re , 1) ;
e_new1 = e_new(1:r+t(1)+1+s);
e_new1(r+t(1)+1:end) = 0 ;
e_new1 = [e_new1 ; e_extra] ;
e_new2 = e_new(1:r+t(2)+1+s) ;
e_new2(r+t(2)+1:end) = 0 ;
e_new2 = [e_new2 ; e_extra] ;
e_new3 = e_new(1:r+t(3)+1+s) ;
e_new3(r+t(3)+1:end) = 0 ;
e_new3 = [e_new3 ; e_extra] ;
[x_new , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new(1:r+t(3))) ;
[x_new1 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new1) ;
[x_new2 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new2) ;
[x_new3 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new3) ;
subplot(3 , 2 , 4) ;
hold on ;
plot(x_new1(1:r+t(1)+1+s)/(1.5*x_new(end)) , '--' , 'LineWidth' , 1.5 , 'Color' , 'red') ;
plot(x_new2(1:r+t(2)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'green') ;
plot(x_new3(1:r+t(3)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'c') ;
plot(x_new/(1.5*x_new(end))  , 'LineWidth' , 1.5 , 'Color' , 'blue') ;
xlim([0 225]) ;
ylim([-0.8 , 0.8]) ;
legend('30 trials' , '60 trials' , '120 trials' , 'original adaptation') ;
%
% figure ;
% plot((x_new(r+1:re+r)-x_new(r+1))/(1.5*x_new(end))) ;
% hold on ;
% plot((x_new1(r+t(1)+2+s:end)-x_new1(r+t(1)+2+s))/(x_new1(end)-x_new1(r+t(1)+2+s))/1.5) ;
% plot((x_new2(1+r+t(2)+1+s:end)-x_new2(1+r+t(2)+1+s))/(x_new2(end)-x_new2(1+r+t(2)+1+s))/1.5) ;
% plot((x_new3(1+r+t(3)+1+s:end)-x_new3(1+r+t(3)+1+s))/(x_new3(end)-x_new3(1+r+t(3)+1+s))/1.5) ;
% figure 4 part 3
l = 300 ;
e_new = ones(l , 1) ;
r = 40 ;
t = [30 , 60 , 120] ;
s = 60 ;
start = 150 ;
e_new(1:r) = 0 ;
e_ex = e_new ;
e_ex(start:end) = 0.25 ;
y1 = -1.2 ;
y2 = 1.2 ;
subplot(3 , 2 , 5) ;
hold on ;
ylim([y1 , y2]) ;
%
v = [r y1; start y1; start y2; r y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor',[0.7 0.7 0.7]) ;
h.FaceAlpha = 0.3;
h.EdgeAlpha = 0 ;
%
v = [start y1; l y1; l y2; start y2];
f = [1 2 3 4];
h = patch('Faces',f,'Vertices',v,'FaceColor','blue') ;
h.FaceAlpha = 0.1;
h.EdgeAlpha = 0 ;
%
plot(e_ex , 'LineWidth' , 2 , 'Color' , 'k') ;
%
title('Paradigm') ;
% figure 4 part 3
re = 50 ;
e_extra = ones(re , 1) ;
e_new1 = e_new(1:r+t(1)+1+s);
e_new1(r+t(1)+1:end) = 0.25 ;
e_new1 = [e_new1 ; e_extra] ;
e_new2 = e_new(1:r+t(2)+1+s) ;
e_new2(r+t(2)+1:end) = 0.25 ;
e_new2 = [e_new2 ; e_extra] ;
e_new3 = e_new(1:r+t(3)+1+s) ;
e_new3(r+t(3)+1:end) = 0.25 ;
e_new3 = [e_new3 ; e_extra] ;
[x_new , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new(1:r+t(3))) ;
[x_new1 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new1) ;
[x_new2 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new2) ;
[x_new3 , x1 , x2] = MultiRate(Af , As , Bf , Bs , e_new3) ;
subplot(3 , 2 , 6) ;
hold on ;
plot(x_new1(1:r+t(1)+1+s)/(1.5*x_new(end)) , '--' , 'LineWidth' , 1.5 , 'Color' , 'red') ;
plot(x_new2(1:r+t(2)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'green') ;
plot(x_new3(1:r+t(3)+1+s)/(1.5*x_new(end))  , '--' , 'LineWidth' , 1.5 , 'Color' , 'c') ;
plot(x_new/(1.5*x_new(end))  , 'LineWidth' , 1.5 , 'Color' , 'blue') ;
xlim([0 225]) ;
ylim([-0.8 , 0.8]) ;
legend('30 trials' , '60 trials' , '120 trials' , 'original adaptation') ;
%% function declaration
function [x] = SingleState(A , B , e)
l = length(e) ;
x = zeros(l , 1) ;
for n = 1:l-1
    x(n+1) = A.*x(n) + B.*e(n) ;
end
end

function [x , x1 , x2] = GainSpecific(A , B , e)
l = length(e) ;
x1 = zeros(l , 1) ;
x2 = zeros(l , 1) ;
for n = 1:l-1
    x1(n+1) = min(0 , A.*x1(n) + B.*e(n)) ;
    x2(n+1) = max(0 , A.*x2(n) + B.*e(n)) ;
end
x = x1 + x2 ;
end

function [x , x1 , x2] = MultiRate(Af , As , Bf , Bs , e)
l = length(e) ;
x1 = zeros(l , 1) ;
x2 = zeros(l , 1) ;
for n = 1:l-1
    x1(n+1) = Af.*x1(n) + Bf.*e(n) ;
    x2(n+1) = As.*x2(n) + Bs.*e(n) ;
end
x = x1 + x2 ;
end

function [n , e] = FindBoundarySingle(A , B , e , start)
e(start:end) = -1 ;
x = SingleState(A , B , e) ;
loc = find(x<0) ;
n = loc(1)+1 ;
e(n:end) = 1 ;
end

function [n , e] = FindBoundaryGain(A , B , e , start)
e(start:end) = -1 ;
[x , x1 , x2] = GainSpecific(A , B , e) ;
loc = find(x<0) ;
n = loc(1)+1 ;
e(n:end) = 1 ;
end

function [n , e] = FindBoundaryMulti(Af , As , Bf , Bs , e , start)
e(start:end) = -1 ;
[x , x1 , x2] = MultiRate(Af , As , Bf , Bs , e) ;
loc = find(x<0) ;
n = loc(1)+1 ;
e(n:end) = 1 ;
end

function [x] = SingleState1(A , B , e , n1)
l = length(e) ;
x = zeros(l , 1) ;
for n = 1:l-1
    if n == n1
        x(n+1) = 0 ;
    else
        x(n+1) = A.*x(n) + B.*e(n) ;
    end
end
end

function [x , x1 , x2] = GainSpecific1(A , B , e , n2)
l = length(e) ;
x1 = zeros(l , 1) ;
x2 = zeros(l , 1) ;
for n = 1:l-1
    if n == n2
        x1(n+1) = min(0 , A.*x1(n) + B.*e(n)) ;
        x2(n+1) = -x1(n+1) ;
    else
        x1(n+1) = min(0 , A.*x1(n) + B.*e(n)) ;
        x2(n+1) = max(0 , A.*x2(n) + B.*e(n)) ;
    end
end
x = x1 + x2 ;
end

function [x , x1 , x2] = MultiRate1(Af , As , Bf , Bs , e , n3)
l = length(e) ;
x1 = zeros(l , 1) ;
x2 = zeros(l , 1) ;
for n = 1:l-1
    if n == n3
        x1(n+1) = Af.*x1(n) + Bf.*e(n) ;
        x2(n+1) = -x1(n+1) ;
    else
        x1(n+1) = Af.*x1(n) + Bf.*e(n) ;
        x2(n+1) = As.*x2(n) + Bs.*e(n) ;
    end
end
x = x1 + x2 ;
end