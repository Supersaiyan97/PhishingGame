%Uphisher.m
function resultat=Uphisher(S)
%Uphisher=Uplayer avec player=phisher
global up; global u;
resultat=0;
for j=1:4
    D=S*10+j;% Pour g�n�rer les Dij associ�s � Si
    resultat=resultat+ProbCond(D,S)*real(u(S,D));
end
%display(['Utilit� du phisher adoptant la strat�gie S' num2str(S) ' est:']);
%display(['Uphisher(S' num2str(S) ') = ' num2str(resultat)]);