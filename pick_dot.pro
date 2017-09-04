function pick_dot,data,xr,yr
;   wrote on 217-08-30
;   A program to pick out the dots over the 'data' space,
;   the program will return a 2-dimension array contains
;   the dots' x and y coordinates
;   
;   Left-cursor botton pick data point and cneter botton
;   eliminate the last dot that have been picked, while
;   the right botton finish the progress
;   input: data the 2-dimension array of data space to plot
;          the figure
;          xr & yr the xrange and yrange of the plot

jumpf=0
set_plot,'win' & window,1,xsize=1000,ysize=650
jump1:
plot,data(0,*),data(1,*),color=0,background=1,thick=3.5,$
xthick=3,ythick=3,charsize=1.5,charthick=2.8,psym=2,$
xstyle=1,ystyle=1,xrange=xr,yrange=yr,$
ytitle=textoidl('data(0,*)'),xtitle=textoidl('data(1,*)')

if jumpf ne 0 then begin
 oplot,dot(0,*),dot(1,*),psym=2,color=2,thick=1.6
endif

!mouse.button=2
while (!mouse.button ne 4 ) do begin
 cursor,x,y,/down 
 IF !mouse.button eq 1 and jumpf eq 0 then begin
  dot=[x,y]
  jumpf++
 endif
 cursor,x,y,/up  
 IF !mouse.button eq 1 then begin 
  dot=[[dot],[x,y]]
  oplot,dot(0,*),dot(1,*),psym=2,color=2,thick=1.6
  endif else if !mouse.button eq 2 then begin
  print,'delete this data point'
  bn=N_elements(dot(0,*))
  dot=dot(*,0:bn-2)
 goto,jump1
 endif
endwhile
return,dot(*,1:n_elements(dot(0,*))-1)
end