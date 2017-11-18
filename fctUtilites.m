%U et U'
clear all;
close all;
clc;
%%u: u(i,j)=u1(S=i,D=j)+u2(S=i,D=j)*i, i belong to {} et j belong to {}
%S1
u(1,11)=complex(16,4); u(1,12)=complex(8,8); u(1,13)=complex(10,0);u(1,14)=complex(0,7);
%S2
u(2,21)=complex(16,4); u(2,22)=complex(8,8); u(2,23)=complex(10,0);u(2,24)=complex(0,7);
%S3
u(3,31)=complex(15,4); u(3,32)=complex(7,8); u(3,33)=complex(12,2); u(3,34)=complex(4,5);
%S4
u(4,41)=complex(14,3); u(4,42)=complex(6,8); u(4,43)=complex(11,1);u(4,44)=complex(2,6);
%u
%%up=u prime
up=u;
for i=1:4
    for j=1:44        
%up(i,j)=complex( real(u(i,j))/sum(real(u(i,(10*i+1):(10*i+4)))) , imag(u(i,j))/sum(imag(u(i,(10*i+1):(10*i+4)))) );
%up(i,j)=complex(real(u(i,j))/sum(EliminerLesDoublons(sum(real(u)))) ,imag(u(i,j))/sum(EliminerLesDoublons(sum(imag(u)))))
up(i,j)=complex(real(u(i,j))/sum(sum(real(u))) ,imag(u(i,j))/sum(sum(imag(u))))
    end
end
%EliminerLesDoublons(real(u))
format rat
up
%%Somme de tous les up2
%sum(sum(imag(up)))
%%Somme de tous les up1
%sum(sum(real(up)))



%%Hypothèses
Effue=0.8;
Pbt=0.7; Pav=0.7;
%Ps1=8/25;  Ps2=7/25;  Ps3=6/25;  Ps4=4/25; %S1>S2>S3>S4 Binmore's method sur l'intervalle [1;2] pour ne pas choisir S4 avec une proba de 0
%Ps1=4/9;  Ps2=4/9;  Ps3=3/9;  Ps4=2/9; %S1~S2>S3>S4 Binmore's method sur l'intervalle [1;2] pour ne pas choisir S4 avec une proba de 0
Ps1=1/2;  Ps2=1/2;  Ps3=0/9;  Ps4=0/9; % lorsque le NE est atteint
probaS=[Ps1 Ps2 Ps3 Ps4];
probaS=0.25+zeros(1,4);
probaSApresCorrection=probaS;
%%Calcul des probabilités de succes et d'échec des attaques dans un one-shot game
PROBAattackSucceed=Ps1*( real( up(1,11) )+Effue*real( up(1,13) ) ) + Ps2*( real( up(2,21) )+Effue*real( up(2,23) ) ) + Ps3*( real( up(3,31) )+(1-Pbt)*real( up(3,33) ) ) +Ps4*( real( up(4,41) )+(1-Pav)*real( up(4,43) ) )
%PROBAattackSucceed=Ps1*( real( up(1,11) )+(1-Effue)*real( up(1,13) ) ) + Ps2*( real( up(2,21) )+(1-Effue)*real( up(2,23) ) ) + Ps3*( real( up(3,31) )+(1-Pbt)*real( up(3,33) ) ) +Ps4*( real( up(4,41) )+(1-Pav)*real( up(4,43) ) )
PROBAdefenseSucceed=Ps1*( imag( up(1,12) )+Effue*imag( up(1,14) ) ) + Ps2*( imag( up(2,22) )+Effue*imag( up(2,24) ) ) + Ps3*( imag( up(3,32) )+(Pbt)*imag( up(3,34) ) ) +Ps4*( imag( up(4,42) )+(Pav)*imag( up(4,44) ) )
PROBA2defenseSucceed=1-PROBAattackSucceed
% %%Calcul des probabilités de succes et d'échec des attaques dans un one-shot game
% PROBAattackSucceed=Ps1*((1-imag( up(1,11) ))*real( up(1,11) )+Effue*(1-imag( up(1,13) ))*real( up(1,13) ) ) + Ps2*( (1-imag( up(2,21) ))*real( up(2,21) )+Effue*(1-imag( up(2,23) ))*real( up(2,23) ) ) + Ps3*( (1-imag( up(3,31) ))*real( up(3,31) )+(1-Pbt)*(1-imag( up(3,33) ))*real( up(3,33) ) ) +Ps4*( (1-imag( up(4,41) ))*real( up(4,41) )+(1-Pav)*(1-imag( up(4,43) ))*real( up(4,43) ) )
% %PROBAattackSucceed=Ps1*( real( up(1,11) )+(1-Effue)*real( up(1,13) ) ) + Ps2*( real( up(2,21) )+(1-Effue)*real( up(2,23) ) ) + Ps3*( real( up(3,31) )+(1-Pbt)*real( up(3,33) ) ) +Ps4*( real( up(4,41) )+(1-Pav)*real( up(4,43) ) )
% PROBAdefenseSucceed=Ps1*( (1-real( up(1,12) ))*imag( up(1,12) )+Effue*(1-real( up(1,14) ))*imag( up(1,14) ) ) + Ps2*( (1-real( up(2,22) ))*imag( up(2,22) )+Effue*(1-real( up(2,24) ))*imag( up(2,24) ) ) + Ps3*( (1-real( up(3,32) ))*imag( up(3,32) )+(Pbt)*(1-real( up(3,34) ))*imag( up(3,34) ) ) +Ps4*( (1-real( up(4,42) ))*imag( up(4,42) )+(Pav)*(1-real( up(4,44) ))*imag( up(4,44) ) )

format short
PROBAattackSucceed
PROBAdefenseSucceed
ecartAbsurde=1-(PROBAdefenseSucceed+PROBAattackSucceed)
format rat
%COEFattack
COEFattack=[real( up(1,11) )+Effue*real( up(1,13) ),real( up(2,21) )+Effue*real( up(2,23) ),real( up(3,31) )+(1-Pbt)*real( up(3,33) ), real( up(4,41) )+(1-Pav)*real( up(4,43) )]
%COEFdefense
COEFdefense=[imag( up(1,12) )+Effue*imag( up(1,14) ),imag( up(2,22) )+Effue*imag( up(2,24) ),imag( up(3,32) )+(Pbt)*imag( up(3,34) ) ,  imag( up(4,42) )+(Pav)*imag( up(4,44) )]

format short
%COEFattack
COEFattack=[real( up(1,11) )+Effue*real( up(1,13) ),real( up(2,21) )+Effue*real( up(2,23) ),real( up(3,31) )+(1-Pbt)*real( up(3,33) ), real( up(4,41) )+(1-Pav)*real( up(4,43) )]
%COEFdefense
COEFdefense=[imag( up(1,12) )+Effue*imag( up(1,14) ),imag( up(2,22) )+Effue*imag( up(2,24) ),imag( up(3,32) )+(Pbt)*imag( up(3,34) ) ,  imag( up(4,42) )+(Pav)*imag( up(4,44) )]
%%Three moves games
display(['RESULTATS:']);
display(['PROBAattackSucceed = ' num2str(PROBAattackSucceed)]);
display(['PROBAdefenseSucceed = ' num2str(PROBA2defenseSucceed)]);