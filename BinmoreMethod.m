%%assignation des nombres selon les pr�f�rences
clear all;close all;clc;
format rat
n=9; %Nbombre d'issue
global tab;% les payoffs
tab(1)=0; % Pour l'issue la plus d�favorable
tab(n)=1; % Pour l'issue la plus favorable
fct(tab,1,n);
tab
format short
%Changement d�chelle: 8 est le plus grand d�nominateur parmi  
% les tab(i) 
8.*tab