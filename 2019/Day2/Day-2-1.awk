BEGIN{
    FS= ","
}

{
    N=NF;
    for (i=0;i<N;i++){
	j=i+1;
	code[i]=$j;
    }
}

END{
    code[1]=12;
    code[2]=2;
    pos=0;
    op=code[pos];
    #print pos,op;
    while(op!=99){
	p1=code[pos+1];
	p2=code[pos+2];
	posoutput=code[pos+3];
	#print pos,p1,p2,posoutput;
	
	if(op==1){
	    result=code[p1]+code[p2];
	}
	else if(op==2){
	    result=(code[p1])*(code[p2]);
	}
	code[posoutput]=result;
	pos+=4;
	op=code[pos];
    }
    for (i=0;i<N;i++){
	printf("%d ",code[i]);
    }
}

