%%QRE-Based Strategie of the repeated game
%Utilities;
fctUtilites;
global u;
LhistoireDuJeu;
global SuccessionDissue histoire delta tPlus1;
close all
S=0;
hold on
 lamda=[0:0.1:100]
 taille=1.5;
 S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 %[sommeElt nbreElt]=sommeEltNotNaN(ProbatSi);
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda);
 PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'pk','lineWidth', taille);
 S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 %[sommeElt nbreElt]=sommeEltNotNaN(ProbatSi);
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda);
 PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'go','lineWidth', taille);
  S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 %[sommeElt nbreElt]=sommeEltNotNaN(ProbatSi);
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda);
 PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'r^','lineWidth', taille);
  S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 %[sommeElt nbreElt]=sommeEltNotNaN(ProbatSi);
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda);
 PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'sb','lineWidth', taille);
 xlabel('Lamda','FontSize',11, 'FontWeight','bold')
 ylabel('Probabilité','FontSize',11, 'FontWeight','bold')
 ylim([0 1]) 
 xlim([0 3]) 
hold off
l1=['S1: Texte adapté+Adresse e-mail'];
l2=['S2: Texte adapté+Numéro de téléphone'];
l3=['S3: Url phishing'];
l4=['S4: Malware-based phishing'];
legend({l1,l2,l3,l4},'FontSize',9, 'FontWeight','bold','Location','NorthWest');
%title( 'QRE Based Strategie on Phisshing repeated game','FontSize',12, 'FontWeight','bold')
title( ['Prédiction du comportement du phisher à la ' num2str(tPlus1) ' ième itération du jeu' ],'FontSize',12, 'FontWeight','bold')
PourcentageDeS
SuccessionDissue
display(['Pour renforcer la sécurité au cours de la ' num2str(tPlus1) '  ième itération Veuillez consacrer:']);
display(['- ' num2str(PourcentageDeS(1)) '% de vos ressources pour prévenir les attaques de type S1']);
display(['- ' num2str(PourcentageDeS(2)) '% de vos ressources pour prévenir les attaques de type S2']);
display(['- ' num2str(PourcentageDeS(3)) '% de vos ressources pour prévenir les attaques de type S3']);
display(['- ' num2str(PourcentageDeS(4)) '% de vos ressources pour prévenir les attaques de type S4']);
sum(PourcentageDeS)
%mean(ProbatSi)