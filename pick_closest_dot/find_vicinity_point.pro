pro find_vicinity_point
device,decomposed=0
my_colors

data=fltarr(2,100)
data(0,*)=randomu(undefinevar,100)*50.0
data(1,*)=randomu(undefinevar,100)*50.0

xr=[-10.0,60.0]
yr=[-10.0,60.0]

result=find_closest_dot(data,xr,yr)
print,result
done
end

