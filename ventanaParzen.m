function f = ventanaParzen(Xval,Xent,Yent,h,tipo)

    M=size(Xval,1);
    N=size(Xent,1);
    suma1=zeros(N,1);
    suma2=zeros(N,1);
    dis=zeros(N,1);
    f=zeros(M,1);

    if strcmp(tipo,'regress')
    
		for j=1:M
			%%% Complete el codigo %%%
           
			%%%%%%%%%%%%%%%%%%%%%%%%%%
		end
    
    elseif strcmp(tipo,'class')
        
        for j=1:M
            sum=0;
            %%% Complete el codigo %%%
            for i=1:N
               aux=[Xval(j);Xent(i)];
               dis=pdist(aux,'euclidean');
               u=dis/h;
               k=gaussianKernel(u);
               sum=sum+(k*aux)/h;
            end
            sum=sum/N;
            f(j)=sum;
            %%%%%%%%%%%%%%%%%%%%%%%%%%
        end
        
    end

end
