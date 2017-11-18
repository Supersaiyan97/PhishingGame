function fct(tab,i,j)
global tab;
if((j-i)>1)
    tab(floor((i+j)/2))=(tab(i)+tab(j))/2;    
    fct(tab,i,floor((i+j)/2));
    fct(tab,floor((i+j)/2),j);
end
    