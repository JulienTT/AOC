BEGIN{
    for (i=1;i<7;i++){
	number1[i]=substr(n1,i,1);
	number2[i]=substr(n2,i,1);
    }
    # for (i=1;i<7;i++)
    # 	printf("%d",number1[i]);
    # print ""
    # for (i=1;i<7;i++)
    # 	printf("%d",number2[i]);
    # print ""
}

{
    count=0;
    for(i1=number1[1];i1<=9;i1++)
	for(i2=i1;i2<=9;i2++)
	    for(i3=i2;i3<=9;i3++)
		for(i4=i3;i4<=9;i4++)
		    for(i5=i4;i5<=9;i5++)
			for(i6=i5;i6<=9;i6++){
			    n=int(sprintf("%d%d%d%d%d%d",i1,i2,i3,i4,i5,i6));
			    if(n<n1)
				continue;
			    else if(n>n2){
				print count;
				exit;
			    }
			    else{
				if( ( (i1==i2) && (i2!=i3) ) || ( (i1!=i2) && (i2==i3) && (i3!=i4) ) || ( (i2!=i3) && (i3==i4) && (i4!=i5) ) || ( (i3!=i4) && (i4==i5) && (i5!=i6) ) || ( (i4!=i5) && (i5==i6) ) )
				    count++;
			    }
			}
}

