clear

C=zeros(1);

k=0;
for i=21: 26
    c=2^k;
    for j=1: 64
        if c>=1
            C(i,j)=1;
        else
            C(i,j)=-1;
        end
        c=c-1;
        if c<=-2^k
           c=2^k;
        end
    end
    k=k+1;
end

r=23;
s=21;
for i=9: 12
    
    if r==25
        r=23;
        s=s+1;
    end
    
    for j=1: 64
        C(i,j)=C(s,j)*C(r,j);
    end
    r=r+1;
end

r=25;
s=21;
for i=13: 16
    
    if r==27
        r=25;
        s=s+1;
    end
    
    for j=1: 64
        C(i,j)=C(s,j)*C(r,j);
    end
    r=r+1;
end

r=25;
s=23;
for i=17: 20
    
    if r==27
        r=25;
        s=s+1;
    end
    
    for j=1: 64
        C(i,j)=C(s,j)*C(r,j);
    end
    r=r+1;
end

r=21;
s=23;
t=25;
for i=1: 8
    
    if t==27&&s~=24
        t=25;
        s=s+1;
    end
    
    if t==27&&s==24
        t=25;
        s=23;
        r=r+1;
    end
    
    for j=1: 64
        C(i,j)=C(r,j)*C(s,j)*C(t,j);
    end
    t=t+1;
end

C=transpose(C);

dlmwrite('Correlatores_tripartido.txt',C,'\t')