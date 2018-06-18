%UphisherHistory.m
function resultat=UphisherHistory(S)
global u;global SuccessionDissue histoire delta;
t=length(histoire);
resultat=power(delta(t),t)*Uphisher(S);
for t=0:(length(histoire)-1) 
Sti=real(histoire(t+1)); %car les indices du tableau histoire commencent � partir de 1
Dtij=imag(histoire(t+1));
resultat=resultat+power(delta(t+1),t)*real(u(Sti,Dtij)); 
end
%display(['UphisherHistory(S' num2str(S) ') = ' num2str(resultat)]);

%fin=0
%Utilit� du phisher compte tenu de son historique dans le jeu: UtPhisher(Si)
%ie Apr�s que "Histoire" s'est d�roul� quelle utilit� cumulative obtiendra
%le phisher en adoptant par la suite la strat�gie S?
