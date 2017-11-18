global SuccessionDissue histoire delta  tPlus1;
global probaS  probaSApresCorrection;
%probaS=[1/2 1/2 0 0];
%histoire=[complex(1,11) complex(1,12) complex(4,42) complex(3,31)];
%t=4;
%t=9;%Nombre d'itération écoulée
%t=19
%t=29
%t=39
% t=59 %equiprobable
% t=569

%t=80
%tPlus1=t+1;
t=4
tPlus1=t+1;
%t=tPlus1-1;
% histoire=[complex(1,14) complex(3,31) complex(4,43) complex(3,33)];
%delta=[0.9 0.9 0.9 0.9];
SuccessionDissue='{ Debut ';
%%Debut
%k1=randi([1 4],1,1)
SuccessionDissue='{ Debut ';
%  %bbb='Booooooooooo'
%     iteration=1
%     k1=randi([1 4],1,1);k1=4
%     Si=k1;
%     k2=randi([1 4],1,1);k2=4
%     Dij=k1*10+k2;
%     histoire(iteration)=complex(Si,Dij);
%     SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
%     %bbb='Booooooooooo'
%     iteration=2
%     k1=randi([1 4],1,1);k1=1
%     Si=k1;
%     k2=randi([1 4],1,1);k2=3
%     Dij=k1*10+k2;
%     histoire(iteration)=complex(Si,Dij);
%     SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];

    %bbb='Booooooooooo'
    iteration=1
    k1=randi([1 4],1,1);k1=4%2
    Si=k1;
    k2=randi([1 4],1,1);k2=4%4
    Dij=k1*10+k2;
    histoire(iteration)=complex(Si,Dij);
    SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
    %bbb='Booooooooooo'
    iteration=2
    k1=randi([1 4],1,1);k1=4%2
    Si=k1;
    k2=randi([1 4],1,1);k2=4%2
    Dij=k1*10+k2;
    histoire(iteration)=complex(Si,Dij);
    SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
    %bbb='Booooooooooo'
    iteration=3
    k1=randi([1 4],1,1);k1=4%3
    Si=k1;
    k2=randi([1 4],1,1);k2=4%2
    Dij=k1*10+k2;
    histoire(iteration)=complex(Si,Dij);
    SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
        %bbb='Booooooooooo'
    iteration=4
    k1=randi([1 4],1,1);k1=4%3
    Si=k1;
    k2=randi([1 4],1,1);k2=4%2
    Dij=k1*10+k2;
    histoire(iteration)=complex(Si,Dij);
    SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];

% for iteration=1:t
%     %bbb='Booooooooooo'
%     k1=randi([1 4],1,1);k1=4
%     Si=k1;
%     k2=randi([1 4],1,1);k2=44
%     Dij=k1*10+k2;
%     histoire(iteration)=complex(Si,Dij);
%     SuccessionDissue=[SuccessionDissue ' , (S' num2str(Si) ';D' num2str(Dij) ')' ];
% end
SuccessionDissue=[SuccessionDissue ' , Fin}' ];
%histoire=  [ 1.0000+11.0000*1i   2.0000+22.0000*1i   3.0000+34.0000*1i   4.0000+42.0000*1i   1.000+14.0000*1i   4.0000+43.0000*1i]
%%Importer une histoire qui fait apparaitre les NaN Debut
   %load('histNan.mat')
   save('cool', 'histoire', 'SuccessionDissue', 't', 'tPlus1');
%%Importer une histoire qui fait apparaitre les NaN Fin

delta=0.5+zeros(1,t)% matrice ligne de t colonnes n'ayant que des 0.9;
%%Fin
%histoire=[complex(4,44) complex(4,44) complex(4,44)];
%histoire=[complex(2,21) complex(4,44) complex(2,22)];
% delta=[0.9 0.9 0.9 0.9 0.9];

%delta=[1 0.9 0.8 0.7 0.6];
% histoire=[complex(4,41) complex(2,23)];
% delta=[1 0.9 0.8];

%%Mise a jour des proba
signe=+1;
probaSApresCorrection=probaS;
for h=(length(histoire)-1):-1:0
    length(histoire)
    h
    Si=real(histoire(h+1));Dij=imag(histoire(h+1));
    utp=power(delta(h+1),length(histoire)-1-h)*(real(up(Si,Dij)));
    if( mod(Dij,10)== 2 | mod(Dij,10)== 4)
        signe=-1;
        utp=power(delta(h+1),length(histoire)-1-h)*(imag(up(Si,Dij)));
    end
    if(signe==1)
  
    end
             %signe=-signe;
    probaSApresCorrection(Si)=probaSApresCorrection(Si)+signe*((1-eps-utp)*probaSApresCorrection(Si));
    tau=signe*((1-eps-utp)*probaSApresCorrection(Si));
     %probaSApresCorrection(Si)=1-probaSApresCorrection(Si);
    for S=1:4
        if(S~=Si)
            probaSApresCorrection(S)=probaSApresCorrection(S)-tau/3;
            % probaSApresCorrection(S)=1-probaSApresCorrection(S);
        end        
    end
    
    %Une proba négatif est assimilé à eps
    for S=1:4
        if(probaSApresCorrection(S)<=0)
            probaSApresCorrection(S)=eps;
            % probaSApresCorrection(S)=1-probaSApresCorrection(S);
        end        
    end
   probaSApresCorrection=1-probaSApresCorrection;
    

end