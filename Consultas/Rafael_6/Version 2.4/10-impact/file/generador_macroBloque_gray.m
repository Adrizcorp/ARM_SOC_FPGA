% Written by: Holguer A Becerra
%image to mif

A = imread('ref.jpg');
[h,w,channels]= size(A);
window=80*60;
fID = fopen('ref','w');

b=A;
b=rgb2gray(A);

macroBloque = zeros(80,60);
macroBloque1 = zeros(80,60);
macroBloque2 = zeros(80,60);
macroBloque( uint32(1), uint32(1))=uint32(b(1,1));
for y = 1:(h)
    for x = 1:(w)               % R                     G              B
        %pixel=uint32(b(y,x,1))*65536+uint32(b(y,x,2))*256+uint32(b(y,x,3));
        pixel_r=uint32(b(y,x));
        %pixel_g=uint32(b(y,x,2));
        %pixel_b=uint32(b(y,x,3));
        macroBloque( uint32(ceil(x/8)), uint32(ceil(y/8)))=(macroBloque( uint32(ceil(x/8)), uint32(ceil(y/8)))+pixel_r)/2;
        %macroBloque1( uint32(ceil(x/8)), uint32(ceil(y/8)))=(macroBloque1( uint32(ceil(x/8)), uint32(ceil(y/8)))+pixel_g)/2;
        %macroBloque2( uint32(ceil(x/8)), uint32(ceil(y/8)))=(macroBloque2( uint32(ceil(x/8)), uint32(ceil(y/8)))+pixel_b)/2;
    end     
end



for y = 1:(60)
    for x = 1:(80)               % R                     G              B
        %fprintf(fID,'%06x\n',macroBloque( uint32(x), uint32(y))*65536+macroBloque1( uint32(x), uint32(y))*256 +macroBloque2( uint32(x), uint32(y)) );
        fprintf(fID,'%06x\n',macroBloque( uint32(x), uint32(y)) );
        window=window-1;
        if(window==0)
            break;
        end
    end    
    if(window==0)
            break;
        end
end

fclose(fID);
imwrite(macroBloque, 'myimage2.bmp', 'bmp')
imshow(uint8(macroBloque))
%imwrite(image_matrix,'newImage.jpg','jpg','Comment','My JPEG file')