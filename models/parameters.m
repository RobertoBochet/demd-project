%% known parameters

Vn = 380;
wn = 50*2*pi;

Rs = 0.24; 
Ls = 0.0594;
Lr = 0.0591;
Lm = 0.057;
Rr = 0.175;
M = Lm;
n = 3;
J = 0.51;
np = 3;
B = 0.068;

Vac=230;
fac=50*2*pi;

% ml = h * ωl^2 / r
r = 4; % ωl/ωm
h = 0.009;

%% derived parameters

% transformer rate 4 parameter model without rotor inductance
k = Lm / Lr;

Rkr = Rr*k^2;
Lks = Ls - Lm*k;
Lkr = Lr*k^2 - Lm*k; % = 0
Lkm = Lm*k;

wb = wn / np;

%% computed parameters

Psisn = 1.48;

%% estimator parameters

alpha = 2;

%% DTC parameters

dPsi = 0.002 * Psisn;

dT = 5;

%% motor speed PI parameters

Kp = 180;
Ki = 5000;

umax = 380;
umin = -umax;

