function closest_dot,data,x0,y0
coe=0.2
datax=data(0,*)
datay=data(1,*)

maxy=max(datay)
miny=min(datay)

maxx=max(datax)
minx=min(datax)

indexr=where(abs(datax-x0) le coe*(maxx-minx) and abs(datay-y0) le coe*(maxy-miny))
datap=data(*,indexr)
index=where((datap(0,*)-x0)^2+(datap(1,*)-y0)^2 eq min((datap(0,*)-x0)^2+(datap(1,*)-y0)^2))
return,datap(*,index)
end
