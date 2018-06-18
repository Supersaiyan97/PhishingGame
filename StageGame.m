%StageGame.m
%U et U'
clear all; close all;clc; global u; global up; global probaS probaSApresCorrection; global upp;
%S1
u(1,11)=complex(16,4); u(1,12)=complex(8,8); u(1,13)=complex(10,0);u(1,14)=complex(0,7);
%S2
u(2,21)=complex(16,4); u(2,22)=complex(8,8); u(2,23)=complex(10,0);u(2,24)=complex(0,7);
%S3
u(3,31)=complex(15,4); u(3,32)=complex(7,8); u(3,33)=complex(12,2); u(3,34)=complex(4,5);
%S4
u(4,41)=complex(14,3); u(4,42)=complex(6,8); u(4,43)=complex(11,1);u(4,44)=complex(2,6);
%%up=u prime
up=u;
for i=1:4
    for j=1:44        
     up(i,j)=complex(real(u(i,j))/sum(sum(real(u))) ,imag(u(i,j))/sum(sum(imag(u))))
    end
end
for i=1:4
    for j=1:44        
     upp(i,j)=complex(real(u(i,j))/sum(sum(real(u(i,10*i+1:10*i+4)))) ,imag(u(i,j))/sum(sum(imag(u(i,10*i+1:10*i+4)))))
    end
end
format rat
%%Hypothèses
Effue=0.8;
Pbt=0.7; Pav=0.7;
Ps1=1/2;  Ps2=1/2;  Ps3=0;  Ps4=0; % lorsque le NE est atteint
probaS=[Ps1 Ps2 Ps3 Ps4]; 
probaSApresCorrection=probaS; Effue=1-Effue;
%%Calcul des probabilités de succes et d'échec des attaques dans un one-shot game
PROBAattackSucceed=Ps1*( real( up(1,11) )+Effue*real( up(1,13) ) ) + Ps2*( real( up(2,21) )+Effue*real( up(2,23) ) ) + Ps3*( real( up(3,31) )+(1-Pbt)*real( up(3,33) ) ) +Ps4*( real( up(4,41) )+(1-Pav)*real( up(4,43) ) )
PROBA2defenseSucceed=1-PROBAattackSucceed
format short
COEFattack=[real( up(1,11) )+Effue*real( up(1,13) ),real( up(2,21) )+Effue*real( up(2,23) ),real( up(3,31) )+(1-Pbt)*real( up(3,33) ), real( up(4,41) )+(1-Pav)*real( up(4,43) )]
COEFdefense=[imag( up(1,12) )+Effue*imag( up(1,14) ),imag( up(2,22) )+Effue*imag( up(2,24) ),imag( up(3,32) )+(Pbt)*imag( up(3,34) ) ,  imag( up(4,42) )+(Pav)*imag( up(4,44) )]

fprintf('<strong>RESULTS:</strong>\n')
fprintf('<strong>PROBAattackSucceed = %f</strong>\n', PROBAattackSucceed)
fprintf('<strong>PROBAdefenseSucceed = %f</strong>\n', PROBA2defenseSucceed)
OneShotGameCreated=1;
