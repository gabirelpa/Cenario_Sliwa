function A = elementosgrupo_Sliwa

Perm=zeros(1);

r=1;
for i=1: 12
    c=combnk(1:12,i);
    
    dimc=size(c);
    
    for j=1: dimc(1,1)
        for k=1: dimc(1,2)
            v_aux(k)=c(j,k);
            
                       
        end
        p=perms(v_aux);     
        
        dimp=size(p);
        
        for l=1: dimp(1,1)
            s=1;
            for k=1: dimp(1,2)
                Perm(r,s)=p(l,k);
                
                s=s+1;
            end
            r=r+1;
        end
    end  
end

G=geradoras_tri;

A=table(G{1:26,1});

dimPerm=size(Perm);
ind2=0;
for i=1: dimPerm(1,1)
    G_aux=G{1:26,Perm(i,1)+1}*G{1:26,Perm(i,2)+1}*G{1:26,Perm(i,3)+1}*G{1:26,Perm(i,4)+1}*G{1:26,Perm(i,5)+1}*G{1:26,Perm(i,6)+1}*G{1:26,Perm(i,7)+1}*G{1:26,Perm(i,8)+1}*G{1:26,Perm(i,9)+1}*G{1:26,Perm(i,10)+1}*G{1:26,Perm(i,11)+1}*G{1:26,Perm(i,12)+1};
    
    dimA=size(A);
    ind1=0;
    for j=1: dimA(1,2)
        if isequal(G_aux,A{1:26,j})
            ind1=ind1+1;
        end        
    end
    if ind1==0
        G_tab=table(G_aux);
        A(1:26,ind2+2)=G_tab;
        ind2=ind2+1;
    end
end

end    
