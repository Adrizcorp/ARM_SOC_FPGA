Archivo=fopen('Nref.txt','r');
scan=fscanf(Archivo, '%d',[1 inf]);

%Conv=zeros(1,4800);
vector=zeros(1,4801);

for i=1:4800
   for j=1;1
    A(i)=scan(i);
    Conv=dec2hex(A,6);
   end
    
  
end

fclose(Archivo);