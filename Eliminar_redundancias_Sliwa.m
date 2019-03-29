clear

Data=importdata('Correlatores_Sliwa.out');

D=zeros(53856,26);

for i=1: 53856
    for j=1: 26
    D(i,j)=Data(i,j);    
    end
end

A=elementosgrupo_tri_leve;

v=[D(1,1),D(1,2),D(1,3),D(1,4),D(1,5),D(1,6),D(1,7),D(1,8),D(1,9),D(1,10),D(1,11),D(1,12),D(1,13),D(1,14),D(1,15),D(1,16),D(1,17),D(1,18),D(1,19),D(1,20),D(1,21),D(1,22),D(1,23),D(1,24),D(1,25),D(1,26)];
orb=orbita(v,A);
desig=table(v);

ind2=0;
for i=2: 53856
    v_aux=[D(i,1),D(i,2),D(i,3),D(i,4),D(i,5),D(i,6),D(i,7),D(i,8),D(i,9),D(i,10),D(i,11),D(i,12),D(i,13),D(i,14),D(i,15),D(i,16),D(i,17),D(i,18),D(i,19),D(i,20),D(i,21),D(i,22),D(i,23),D(i,24),D(i,25),D(i,26)];
    dimorb=size(orb);
    ind1=0;
    for j=1: dimorb(1,2)
        if isequal(v_aux,orb{1,j})
            ind1=ind1+1;
        end
    end
    if ind1==0
        desig_tab=table(v_aux);
        desig(1,ind2+2)=desig_tab;
        orb_tab=orbita(v_aux,A);
        dimorb_tab=size(orb_tab);
        orb(1,dimorb(1,2)+1:dimorb(1,2)+dimorb_tab(1,2))=orb_tab;
        ind2=ind2+1;
    end
end

dimdesig=size(desig);
for i=1: dimdesig(1,2)
    disp(desig{1,i});
end
