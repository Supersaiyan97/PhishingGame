function resultat=ProbatSx(S)
%%ie Apr�s que "Histoire" s'est d�roul� quelle utilit� cumulative obtiendra
%le phisher en adoptant par la suite la strat�gie S?
global u;
%LhistoireDuJeu;
global SuccessionDissue histoire delta;
lamda=4 %L'irrationalit� du phisher
somme=0
for Si=1:4
  somme=somme+exp(lamda*UphisherHistory(Si));
end
resultat=exp(lamda*UphisherHistory(S))/somme;
lamda=[0:0.1:10]
close all
plot(lamda, exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4))));
lamda=10;
ylim([0 1])
display(['ProbatSx(S' num2str(S) ') = ' num2str(resultat)]);