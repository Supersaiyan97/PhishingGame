%Prediction.m %%QRE-Based Strategie of the repeated game
if(~exist('OneShotGameCreated','var'))
     StageGame;
end
aleatoire=input('Voulez-vous une histoire aléatoire ou non (1/0)? '); 
CreateStory(aleatoire); global SuccessionDissue histoire delta tPlus1; close all; S=0;lamda=[0:0.1:100]; taille1=2;taille2=10; S=S+1; hold on
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda); PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'--pk','LineWidth',taille1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','k',...
                       'MarkerSize',taille2); S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda); PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'--go','LineWidth',taille1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',taille2);  S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda); PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'--r^','LineWidth',taille1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',taille2);
  S=S+1;
 ProbatSi=exp(lamda.*UphisherHistory(S))./(exp(lamda.*UphisherHistory(1))+exp(lamda.*UphisherHistory(2))+exp(lamda.*UphisherHistory(3))+exp(lamda.*UphisherHistory(4)));
 [sommeElt nbreElt]=sommeEltNotNaN2(ProbatSi,lamda); PourcentageDeS(S)=100*sommeElt/nbreElt;
 plot(lamda,ProbatSi,'--sb','LineWidth',taille1,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',taille2);
 xlabel('Lamda','FontSize',15, 'FontWeight','bold'); ylabel('Probabilities','FontSize',15, 'FontWeight','bold')
 ylim([0 1]); xlim([0 3]); hold off
l1=['S1: Deceptive phishing using a reply email address'];l2=['S2: Deceptive phishing using a reply phone number']; l3=['S3: Url phishing'];l4=['S4: Malware-based phishing'];
legend({l1,l2,l3,l4},'FontSize',14, 'FontWeight','bold','Location','NorthWest');
title(['Phisher intent prediction at iteration number ' num2str(tPlus1) '' ],'FontSize',15, 'FontWeight','bold')
% display(['Succession d issues: ' SuccessionDissue '.']);
% display(['Pour renforcer la sécurité au cours de la ' num2str(tPlus1) '  ième itération Veuillez consacrer:']);
% display(['- ' num2str(PourcentageDeS(1)) '% de vos ressources à la prévention des attaques de type S1']);
% display(['- ' num2str(PourcentageDeS(2)) '% de vos ressources à la prévention des attaques de type S2']);
% display(['- ' num2str(PourcentageDeS(3)) '% de vos ressources à la prévention des attaques de type S3']);
% display(['- ' num2str(PourcentageDeS(4)) '% de vos ressources à la prévention des attaques de type S4']);
val='%';
fprintf('<strong>History: %s.</strong>\n', SuccessionDissue)
fprintf('<strong>To reinforce security at iteration number %g, you should dedicate:</strong>\n', tPlus1);
fprintf('<strong>- %g%s of your resources to avoid being lured by S1</strong>\n', PourcentageDeS(1),val);
fprintf('<strong>- %g%s of your resources to avoid being lured by S2</strong>\n', PourcentageDeS(2),val);
fprintf('<strong>- %g%s of your resources to avoid being lured by S3</strong>\n', PourcentageDeS(3),val);
fprintf('<strong>- %g%s of your resources to avoid being lured by S4</strong>\n', PourcentageDeS(4),val);
toc
%sum(PourcentageDeS)
fin='1'