function [somme nbre]=sommeEltNotNaN2(tab,lamda)
somme=0;
nbre=0;
%somme2=0;nbre2=0;
for i=1:length(tab)
    if (isnan(tab(i))== 0 & lamda(i)<=32)
        nbre=nbre+1;
        somme=somme+tab(i);
        %somme2=somme2+tab(i)*lamda(i);  nbre2=nbre2+lamda(i);
    end
end
%somme=somme2; nbre=nbre2;
