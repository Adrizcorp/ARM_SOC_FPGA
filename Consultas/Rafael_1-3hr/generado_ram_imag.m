% Written by: Holguer A Becerra
%image to mif

A = imread('ejemplo.bmp');
[w,h,channels]= size(A);



fID = fopen('image.mif','w');
 
fprintf(fID,'DEPTH = %d;\nWIDTH = 12;\nADDRESS_RADIX = DEC;\nDATA_RADIX = DEC;\nCONTENT\nbegin\n\n',w*h);

dir=0;
b=A/17;
for x = 1:(w)
    for y = 1:(h)               % R                     G              B
        pixel=uint16(b(x,y,1))*256+uint16(b(x,y,2))*16+uint16(b(x,y,3));
        fprintf(fID,'%d: %s;\n',dir,int2str(pixel));
        dir=dir+1;
    end     
end



fprintf(fID,'\nend;\n');
fclose(fID);