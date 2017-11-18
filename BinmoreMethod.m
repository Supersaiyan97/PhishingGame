%%assignation des nombres selon les préférences
clear all;close all;clc;
format rat
n=9; %Nbombre d'issue
global tab;% les payoffs
tab(1)=0; % Pour l'issue la plus défavorable
tab(n)=1; % Pour l'issue la plus favorable
fct(tab,1,n);
tab
format short
%Changement déchelle: 8 est le plus grand dénominateur parmi  
% les tab(i) 
8.*tab