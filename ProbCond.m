function resultat=ProbCond(D,S)
%Prob(Dij|Si)
%Utilities;
global up;
global u;
global probaS  probaSApresCorrection;
global SuccessionDissue histoire delta  tPlus1;
%Prob(Si,Dij)
%ProbSiDij=real(Utility(S,D))/sum(sum(real(u)))
ProbSiDij=0.5*real(Utility(S,D))/sum(sum(real(u)))+0.5*imag(Utility(S,D))/sum(sum(imag(u)))
%j'utilise real() pour faire reférence à U1(Si,Dij)
%Rem: puisque u(1,12)=u1(S1,D12)+u2(S1,D12)*i , on aurait pu utiliser
%simplement real(u(S,D)) au lieu de real(Utility(S,D))
%Correction des ProbaS sssi l'histoire a été définie
% if(length(histoire)>0)
%     %%Alors la correction peut se réaliser en fonction de l'intention
%     %%présumée du phisher à choisir un Si d apres les issues repertoriées
%     %%dans l'histoire
%     probaSApresCorrection(S)=0.5*( probaS(S)+countNumberOfSiInHistory(S,histoire)/length(histoire));
%     [uSi , sumUSHistory] = uSiAndSumUSHistory(S,histoire)
%     %probaSApresCorrection(S)=0.5*(probaS(S)+ uSi/sumUSHistory);
%     probaSApresCorrection(S)=1-probaSApresCorrection(S);
% end

resultat=ProbSiDij/probaSApresCorrection(S);
display(['Proba(D' num2str(D) '|S' num2str(S) ') = ' num2str(resultat)]);
