clear all;
close all;
clc;
format rat
n=12; %n=disp( [Entrer la taille des donn�es'] )
global tab;
tab(1)=0;
tab(n)=1;
fct(tab,1,n);
tab
format short
%Changement d�chelle
16.*tab