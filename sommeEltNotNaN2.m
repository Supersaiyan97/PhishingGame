function [somme nbre]=sommeEltNotNaN2(tab,lamda)
somme=0;
nbre=0;
for i=1:length(tab)
    if (isnan(tab(i))== 0 & lamda(i)<=32)
        nbre=nbre+1;
        somme=somme+tab(i);
    end
end