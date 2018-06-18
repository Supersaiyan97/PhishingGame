%CreateStory.m
function CreateStory(aleatoire)
global SuccessionDissue histoire delta  tPlus1;
global up; global probaS  probaSApresCorrection; t=0; global u;global upp;
SuccessionDissue='{ Begin '; histoire=[];
if(aleatoire==0)
    MesureDeDefense=input('Entrer les mesures défensives précédement employées: ');
    t=length(MesureDeDefense);
    tic
    for iteration=1:t
     k1=floor(MesureDeDefense(iteration)/10);
     Si=k1;
     Dij=MesureDeDefense(iteration);
     histoire(iteration)=complex(Si,Dij);
     SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
    end
else
    t=input('Entrer le nombre d itérations déjà écoulée: ');
    tic
    display('CREATION ALEATOIRE DE L HISTOIRE ENTRE LE PHISHER ET L UTILISATEUR')
    for iteration=1:t
     k1=randi([1 4],1,1);Si=k1; k2=randi([1 4],1,1); Dij=k1*10+k2;
     histoire(iteration)=complex(Si,Dij);
     SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
    end
end
SuccessionDissue=[SuccessionDissue ' , End}' ];
tPlus1=t+1; delta=0.755+zeros(1,t);
%%Sauvegarder l'histoire debut
  save('cool', 'histoire', 'SuccessionDissue', 't', 'tPlus1');
%%Sauvegarder l'histoire fin
%%%%% Ajustement des probabilités %%%%%
probaS=0.25+zeros(1,4); probaSApresCorrection=probaS; signe=+1;
beta2=2+eps;beta1=2-beta2;
ProbaMax=0.65;k=(beta2-1)*ProbaMax/(1-ProbaMax);
for h=(length(histoire)-1):-1:0
    Si=real(histoire(h+1));Dij=imag(histoire(h+1));
    utp=1+power(delta(h+1),length(histoire)-1-h)*(real(upp(Si,Dij)));
    utp=min(utp,k+1-eps);
    if( mod(Dij,10)== 2 | mod(Dij,10)== 4)
        signe=-1;
        utp=1+power(delta(h+1),length(histoire)-1-h)*(imag(upp(Si,Dij)));
        utp=min(utp,k+1-eps);
    end
    tau=signe*((1-utp)*probaSApresCorrection(Si)/k);
     probaSApresCorrection(Si)=probaSApresCorrection(Si)+tau;
    for S=1:4
        if(S~=Si)
            probaSApresCorrection(S)=probaSApresCorrection(S)-tau/3;
        end        
    end    
  
end