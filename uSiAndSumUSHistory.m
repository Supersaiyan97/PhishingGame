function [ uSi , sumUSHistory ]= uSiAndSumUSHistory(Si,H)
global u;
uSi=0;
sumUSHistory=0;
for i=1:length(H)
    sumUSHistory=sumUSHistory+real(u(real(H(i)),imag(H(i))));
    if(Si==real(H(i)))
        uSi=uSi+real(u(real(H(i)),imag(H(i))));
    end
end