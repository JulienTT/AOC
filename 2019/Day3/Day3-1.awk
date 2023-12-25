function ABS(x1){
    return ((x1)>=0?(x1):(-x1))
}

BEGIN { FS = ","; nh1=0; nh2=0; nv1=0; nv2=0;}
{
    x=0;
    y=0;
    ell=0;
    for(i=1;i<=NF;i++){
	
	if($i~/R/){
	    dx=int(substr($i,2));
	    if(NR==1){
		nh1++;
		H1[nh1,1]=x;
		H1[nh1,2]=x+dx;
		H1[nh1,3]=y;
		H1[nh1,4]=ell;
	    }
	    else{
		nh2++;
		H2[nh2,1]=x;
		H2[nh2,2]=x+dx;
		H2[nh2,3]=y;
		H2[nh2,4]=ell;
	    }
	    x+=dx;
	    ell+=dx;
	}
	
	if($i~/L/){
	    dx=int(substr($i,2));
	    if(NR==1){
		nh1++;
		H1[nh1,1]=x;
		H1[nh1,2]=x-dx;
		H1[nh1,3]=y;
		H1[nh1,4]=ell;
	    }
	    else{
		nh2++;
		H2[nh2,1]=x;
		H2[nh2,2]=x-dx;
		H2[nh2,3]=y;
		H2[nh2,4]=ell;
	    }
	    x-=dx;
	    ell+=dx;
	}
	
	if($i~/U/){
	    dy=int(substr($i,2));
	    if(NR==1){
		nv1++;
		V1[nv1,1]=y;
		V1[nv1,2]=y+dy;
		V1[nv1,3]=x;
		V1[nv1,4]=ell;
	    }
	    else{
		nv2++;
		V2[nv2,1]=y;
		V2[nv2,2]=y+dy;
		V2[nv2,3]=x;
		V2[nv2,4]=ell;
	    }
	    y+=dy;
	    ell+=dy;
	}
	
	if($i~/D/){
	    dy=int(substr($i,2));
	    if(NR==1){
		nv1++;
		V1[nv1,1]=y;
		V1[nv1,2]=y-dy;
		V1[nv1,3]=x;
		V1[nv1,4]=ell;
	    }
	    else{
		nv2++;
		V2[nv2,1]=y;
		V2[nv2,2]=y-dy;
		V2[nv2,3]=x;
		V2[nv2,4]=ell;
	    }
	    y-=dy;
	    ell+=dy;
	}
    }
}

END{
    dist=1000000000000;
    for(i=1;i<=nh1;i++){
	for(j=1;j<=nv2;j++){
	    x=V2[j,3];
	    y=H1[i,3];
	    xmin=(H1[i,1]<H1[i,2])?(H1[i,1]):(H1[i,2])
	    xmax=(H1[i,1]>H1[i,2])?(H1[i,1]):(H1[i,2])
	    ymin=(V2[j,1]<V2[j,2])?(V2[j,1]):(V2[j,2])
	    ymax=(V2[j,1]>V2[j,2])?(V2[j,1]):(V2[j,2])
	    if(x>=xmin && x<=xmax && y>=ymin && y<=ymax){
		if(x!=0&&y!=0){
		    ell1=H1[i,4]+ABS(x-H1[i,1])
		    ell2=V2[j,4]+ABS(y-V2[j,1])
		    if(ell1+ell2<dist)
			dist=ell1+ell2;
		}
	    }
	}
    }
    
    for(i=1;i<=nh2;i++){
	for(j=1;j<=nv1;j++){
	    x=V1[j,3];
	    y=H2[i,3];
	    xmin=(H2[i,1]<H2[i,2])?(H2[i,1]):(H2[i,2])
	    xmax=(H2[i,1]>H2[i,2])?(H2[i,1]):(H2[i,2])
	    ymin=(V1[j,1]<V1[j,2])?(V1[j,1]):(V1[j,2])
	    ymax=(V1[j,1]>V1[j,2])?(V1[j,1]):(V1[j,2])
	    
	    if(x>=xmin && x<=xmax && y>=ymin && y<=ymax){
		if(x!=0&&y!=0){
		    ell1=H2[i,4]+ABS(x-H2[i,1])
		    ell2=V1[j,4]+ABS(y-V1[j,1])
		    if(ell1+ell2<dist)
			dist=ell1+ell2;
		}
	    }
	}
    }
    print dist;
}
