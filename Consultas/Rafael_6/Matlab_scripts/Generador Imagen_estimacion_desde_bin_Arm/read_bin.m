fileID = fopen('video.bin');
A = fread(fileID,'*uint32')';


size=length(A);
A=uint32(A);
pos1=zeros(size,1);
 pos2=zeros(size,1);
 
 vector0_x=zeros(size,1);
vector0_y=zeros(size,1);
vector1_x=zeros(size,1);
vector1_y=zeros(size,1);
dir=1;
w=80;
while(size>0000)
    pos2(dir)=bitand(A(dir),  16383);
    pos1(dir)=bitand((A(dir)/16384),16383) ;
    y=floor(pos1(dir)/w);
    x=pos1(dir)-y*w;
    vector0_x(dir)=x;
    vector0_y(dir)=y;
    y=floor(pos2(dir)/w);
    x=pos2(dir)-y*w;
    vector1_x(dir)=x;
    vector1_y(dir)=y;
    dir=dir+1;
    size=size-1;
end

quiver(vector0_x,vector0_y,vector1_x,vector1_y)

