function ss=countNumberOfSiInHistory(Si,H)
ss=0;
for i=1:length(H)
    if(Si==real(H(i)))
        ss=ss+1;
    end
end