%Uphisher.m
function resultat=Uphisher(S)
%Uphisher=Uplayer avec player=phisher
global up; global u;
resultat=0;
for j=1:4
    D=S*10+j;% Pour générer les Dij associés à Si
    resultat=resultat+ProbCond(D,S)*real(u(S,D));
end
%display(['Utilité du phisher adoptant la stratégie S' num2str(S) ' est:']);
%display(['Uphisher(S' num2str(S) ') = ' num2str(resultat)]);