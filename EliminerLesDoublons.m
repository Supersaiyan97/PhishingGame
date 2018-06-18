function vv=EliminerLesDoublons(vect)
if(length(vect)~=0)
 vv(1)=vect(1);
 k=1;
end
for i=1:length(vect)
    if(ismember(vect(i),vv)==0) %vect(i) n est pas dans vv
       k=k+1;
        vv(k)=vect(i); 
    end
end

    