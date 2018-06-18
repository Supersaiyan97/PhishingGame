%%assignation des nombres selon les pr�f�rences
clear all;close all;clc;
format rat
n=9; %Nbombre d'issue
global tab;% les payoffs
tab(1)=0; % Pour l'issue la plus d�favorable
tab(n)=1; % Pour l'issue la plus favorable
Binmore(tab,1,n);
tab
format short
%Changement d�chelle: 8 est le plus grand d�nominateur parmi  
% les tab(i) 
8.*tab

%%Avec:
function Binmore(tab,i,j)
global tab;
if((j-i)>1)
    tab(floor((i+j)/2))=(tab(i)+tab(j))/2;    
    Binmore(tab,i,floor((i+j)/2));
    Binmore(tab,floor((i+j)/2),j);
end
    