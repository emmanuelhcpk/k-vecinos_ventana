function k = kernel(Xi,Xj,h)

aux=[Xi(:);Xj(:)];
dis=pdist(aux,'euclidean');
u=dis/h;
k=0.5*(exp(-0.5*u^2));