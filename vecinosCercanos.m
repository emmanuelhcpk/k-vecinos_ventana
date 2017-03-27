function [f] = vecinosCercanos(Xval,Xent,Yent,k,tipo)

    %%% El parametro 'tipo' es el tipo de modelo de que se va a entrenar
    %(Xtest,Xtrain,Ytrain,k
    
    
    N=size(Xent,1);
    M=size(Xval,1);
    f=zeros(M,1);
    dis=zeros(N,1);

    if strcmp(tipo,'class')
        
        for j=1:M
            %%% Complete el codigo %%%
            for j=1:M
            auxY=Yent;
            sum=0;
            %%% Complete el codigo %%%
			for i=1:N
                aux=[Xval(j);Xent(i)];
                dis(j)=pdist(aux,'euclidean');
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%
            [dis,indice]=sort(dis);
            auxY=auxY(indice);
            vectAux=[];
            for i=1:k
                vectAux=[vectAux;auxY(i)];
            end
            f(j)=mode(vectAux);
        end
            
        end
  elseif strcmp(tipo,'regress')
        sum=0;
        for j=1:M
            auxY=Yent;
            sum=0;
            %%% Complete el codigo %%%
			for i=1:N
                aux=[Xval(j);Xent(i)];
                dis(j)=pdist(aux,'euclidean');
            end
            %disp(dis);
            [dis,indice]=sort(dis);
            auxY=auxY(indice);
            for i=1:k
                sum=sum+auxY(i);
            end
            sum=sum/k;
            f(j)=sum;
			%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
        end
        

        
    end

end