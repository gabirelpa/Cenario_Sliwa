clear

m1=2;
n1=2;
m2=2;
n2=2;
m3=2;
n3=2;

D1=deter(m1,n1);
D2=deter(m2,n2);
D3=deter(m3,n3);

d1=size(D1);
d2=size(D2);
d3=size(D3);

D=zeros(d1(1,1)*d2(1,1)*d3(1,1),d1(1,2)*d2(1,2)*d3(1,2));

k=1;

for lambda1=1: d1(1,2)
    for lambda2=1: d2(1,2)
        for lambda3=1: d3(1,2)
            l=1;
            for x=1: m1
                for y=1: m2
                    for z=1: m3
                        for a=1: n1
                            for b=1: n2
                                for c=1: n3
                                    D(l,k)=D1((x-1)*n1+a,lambda1)*D2((y-1)*n2+b,lambda2)*D3((z-1)*n3+c,lambda3);
                                    l=l+1;
                                end
                            end
                        end
                    end
                end
            end
            k=k+1;
        end
    end
end

disp(D);

D=transpose(D);

dlmwrite('Deterministicos_Sliwa.txt',D,'\t')