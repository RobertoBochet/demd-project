clc
clear
close all

%%
syms Rs Rr Ls Lr Lm Rkr Lks Lkr Lkm real positive;
syms np integer positive;

syms Vs w wb real positive;
syms wm real positive;
syms x real
assume(-1 <= x & x <=1);

%%
Te = 3 * (Rkr/x) * (np/w) * Vs^2 / ( (Rs + (Rkr/x))^2 + (w*Lkr)^2 );

wb = w/np;

x = (wb-wm)/wb;

%%
parameters;

% transformer rate 4 parameter model without stator inductance
k = Ls / Lm;

Rkr = Rr*k^2;
Lks = Ls - Lm*k; % = 0
Lkr = Lr*k^2 - Lm*k;
Lkm = Lm*k;

Vs = Vac * sqrt(3/2);
w = wn;

wb = subs(wb);

Te = subs(subs(Te));

%%
x_Temax = Rkr / sqrt(Rs^2 + (w*Lkr)^2);
wm_Temax = double(wb*(1-x_Temax));

Te_max = double(subs(Te,wm,wm_Temax));
Te_start = double(subs(Te,wm,0));

%%
figure;
hold on;

X = 0:0.1:wb;

plot(X, subs(Te,wm,X));

yline(Te_start, "--");
yline(Te_max, "--");

xline(wm_Temax, "--");
