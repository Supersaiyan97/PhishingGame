function ss =  uCOOL(i,j)
global up;
global u;
ss=0;
display(['U(S' num2str(i) ',D' num2str(j) ') = (' num2str(real(u(i,j))) ',' num2str(imag(u(i,j))) ')']);