%ProbCond.m
function resultat=ProbCond(D,S)
%Prob(Dij|Si)
global up; global u; global probaS  probaSApresCorrection;
global SuccessionDissue histoire delta  tPlus1;
ProbSiDij=0.5*real(Utility(S,D))/sum(sum(real(u)))+0.5*imag(Utility(S,D))/sum(sum(imag(u)));
resultat=ProbSiDij/probaSApresCorrection(S);
%display(['Proba(D' num2str(D) '|S' num2str(S) ') = ' num2str(resultat)]);
