%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MECH 325 TUTORIAL 10 NOV 5 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Q1 
% Given
Do = 1.225; % in, outside diameter
d = 0.105; % in, wire diameter
Nt = 12;

% a) Find F before the spring starts to yield
D = Do - d; % in, mean diameter

% tau = Kb * 8 * F * D / (pi * d^3)
C = D / d; % spring index
Kb = (4*C+2) / (4*C-3); % helical spring shear stress correction factor (Begrstasser Factor)

% m is from Table 10-4, using a music wire ...
A = 201; % kpsi * in^m
m = 0.145;
Sut = A / d^m; % kpsi
Ssy = 0.45*Sut * 1000; % psi

F = Ssy * pi * d^3 / (Kb * 8 * D) % 45.2 lbf

% b) Find spring rate

% k = F / y (total deflection) = d^4 * G / (8 * D^3 * Na)

% To find Na, Table 10-1
% Nt = Na + 1
Na = Nt - 1; % number of active coils

% To find G, Table 10-5
G = 11.75; % Mpsi

k = d^4 * G * (10^6) / (8 * D^3 * Na) % 11.55 lbf * in

% c) Free Length?
y = F / k; % in, total deflection
% From Table-1 Ls = d*Nt
Ls = d*Nt; % in, solid length
Lo = y + Ls % free length, 5.17 in

% d) Find Pitch of spring

% Table 10-1
p = Lo/(Na + 1) % pitch, 0.4311 in

% e) Will it buckle?
n = 5
% Safe when Lo < Locrit / n

% Table 10-2 for alpha
alpha = 0.5;
Locrit = 2.63 * D / alpha / n % 1.18 in
% NOT safe from buckling since Lo is greater then Locrit
clear; clc;

% PART 2
d = 2/1000; % m
D = (22 - 2)/1000;
n = 2;
A = 1.783; % GPA
m = 0.19;
Nt = 17/2;

C = D / d;
Kb = (4*C+2) / (4*C-3);
Sut = A * 10^9 / (d*1000)^m; 
Ssy = 0.45*Sut ;

F = Ssy * pi * d^3 / (Kb * 8 * D) / n %  48.6643

% b) 
Na = Nt - 2; % b/c squared and ground
% To find G, Table 10-5
G = 79.3 * 10^9; % GPa

k = d^4 * G / (8 * D^3 * Na) %  3.0500e+03

% c)
y = F / k;
% From Table-1 Ls = d*Nt
Ls = d*Nt;
Lo = y + Ls % 0.0330 m

% d) 
p = (Lo - 2*d )/Na % 0.0045 m

% e)
alpha = 1;
Locrit = 2.63 * D / alpha / n % 0.0263 m
% Lo > Locrit so it can buckle
clear; clc;

% Q2

% Given
F = 20;
y = 2;
Ls_max = 1.5;
Lo_max = 4;
n = 1.2;
epsilion = 0.15;

% a)
d = 0.085;
D = 0.05+3/4 + d; % diamteral clearance plus rod diameter
m = 0.145;
A = 201;

C = D / d;
Kb = (4*C+2) / (4*C-3);
Sut = A / d^m;
Ssy = 0.45*Sut;
tau = Kb * 8 * F * D / (pi * d^3) /1000

n = Ssy / tau


% Na = Nt - 2;
% G = 11.75; % Mpsi
% k = d^4 * G * (10^6) / (8 * D^3 * Na) % 11.55 lbf * in

% y = F / k;
% Ls = d*Nt;
% Lo = y + Ls






