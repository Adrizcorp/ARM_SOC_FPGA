img1=zeros(80,60);
vector0_x=zeros(133,1);
vector0_y=zeros(133,1);
vector1_x=zeros(133,1);
vector1_y=zeros(133,1);
img2=zeros(80,60);
window=2000;
wd=window;
w=80;
fid = fopen('Lref.txt');
tline = fgetl(fid);
while (ischar(tline)&& window>0)
    window=window-1;
    d=bin2dec(tline);
    y=floor(d/w);
    x=d-y*w;
    img1(x+1,y+1)=1;
    vector0_x(window+1)=x;
    vector0_y(window+1)=y;
    tline = fgetl(fid);
      
end


fclose(fid);
window=wd;
fid = fopen('Lact.txt');
tline = fgetl(fid);
while (ischar(tline)&& window>0)
    window=window-1;
    d=bin2dec(tline);
    y=floor(d/w);
    x=d-y*w;
    img2(x+1,y+1)=1;
    vector1_x(window+1)=x;
    vector1_y(window+1)=y;
    tline = fgetl(fid);
end

fclose(fid);
%,vector0_y,vector1_y

quiver(vector0_x,vector0_y,vector1_x,vector1_y)
hold on
