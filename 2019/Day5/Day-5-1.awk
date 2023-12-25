# Choose field separator as commas
BEGIN{
    FS= ","
}

# Read the input code
{
    #The number of fields determines the number of parameters
    N=NF;
    #Store each parameter in the array code
    for (i=0;i<N;i++){
	j=i+1;
	code[i]=$j;
    }
    #Input is set to 1
    input=1;
}

END{
    #pos is the current position in the code. It starts at 0.
    pos=0;
    
    #pad the opcode with 0 to make it a 5 digit number
    opcode=sprintf("%05i",code[pos]);
    
    #the opcode is given by the last two digits
    op=int(substr(opcode,4,2));
    #op=99 signals the end of the code. As long as it is not reached,
    #move forward depending on the value of op
    
    
    while(op!=99){
	#print "opcode is",opcode
	#print "pos is",pos;
	#print "op is",op;

	#mode of the first parameter
	mode1=int(substr(opcode,3,1));
	#mode of the second parameter
	mode2=int(substr(opcode,2,1));
	#mode of the third parameter
	mode3=int(substr(opcode,1,1));
	
	#operation 1 is the addition of parameters stored at the two
	#positions following pos, and stored at the position indicated
	#by the third parameter after pos
	#operation 2 is the same with a multiplication
	if(op==1 || op==2){
	    #store the first number to be added
	    #parameter mode
	    if(mode1==0){
		#read the address
		pos1=code[pos+1];
		#store the corresponding number
		n1=code[pos1];
	    }
	    #immediate mode 
	    else
		#Store the value
		n1=code[pos+1];
	    
	    #store the second number to be added
	    #parameter mode
	    if(mode2==0){
		#read the address
		pos2=code[pos+2];
		#store the corresponding number
		n2=code[pos2];
	    }
	    #immediate mode
	    else
		#store the value
		n2=code[pos+2];
	    
	    #store the output position. Always in parameter mode.
	    posoutput=code[pos+3];
	    
	    #store the result of the addition at the correct position
	    if(op==1)
		code[posoutput]=(n1)+(n2);
	    else if(op==2)
		code[posoutput]=(n1)*(n2);
	    #Move forward 4 position in the code
	    pos+=4;
	    
	    #read the next operation
	    #pad the opcode with 0 to make it a 5 digit number
	    opcode=sprintf("%05i",code[pos]);
	    
	    #the opcode is given by the last two digits
	    op=int(substr(opcode,4,2));
	}
	
	#operation 3 stores the input at the position indicated by the
	#parameters which occupies the following position in the code
	else if(op==3){
	    #Store the position where the input should be stored
	    p1=code[pos+1];
	    #Store the input
	    code[p1]=input;
	    #Go two steps forward in the code
	    pos+=2;
	    #read the next operation
	    #pad the opcode with 0 to make it a 5 digit number
	    opcode=sprintf("%05i",code[pos]);
	    
	    #the opcode is given by the last two digits
	    op=int(substr(opcode,4,2));
	}
	#operation 4 outputs the value stored at the position
	#indicated by the parameters which occupies the following
	#position in the code
	else if(op==4){
	    if(mode1==0){
		#Store the position where the input is
		p1=code[pos+1];
		print code[p1];
	    }
	    else if(mode1==1){
		p1=code[pos+1];
		print p1;
	    }
	    # print it out
	    # Move two steps forward
	    pos+=2;
	    #read the next operation
	    #pad the opcode with 0 to make it a 5 digit number
	    opcode=sprintf("%05i",code[pos]);
	    
	    #the opcode is given by the last two digits
	    op=int(substr(opcode,4,2));
	}
	else if(op==5||op==6){
	    #if first param is in mode 0 the bool is at the address
	    #stored in code[pos+1]
	    if(mode1==0)
		bool=code[code[pos+1]];
	    #otherwise the bool is given by the first parameter
	    else if(mode1==1)
		bool=code[pos+1];
	    #if the bool is 1
	    if(bool==1 && op==5){
		#if the second parameter is in mode 0, move pos at the
		#address stored at the address storeed at code[pos+2]
		if(mode2==0)
		    pos=code[code[pos+2]];
		#else move it to the address stored at code[pos+2]
		else if(mode2==1)
		    pos=code[pos+2];
	    }
	    #otherwise move forward by 3;
	    else if(bool=0 && op==6){
		#if the second parameter is in mode 0, move pos at the
		#address stored at the address storeed at code[pos+2]
		if(mode2==0)
		    pos=code[code[pos+2]];
		#else move it to the address stored at code[pos+2]
		else if(mode2==1)
		    pos=code[pos+2];
	    }
	    else
		pos+=3;
	}
	else if (op==7||op==8){
	    #store the first number
	    #parameter mode
	    if(mode1==0){
		#read the address
		pos1=code[pos+1];
		#store the corresponding number
		n1=code[pos1];
	    }
	    #immediate mode 
	    else
		#Store the value
		n1=code[pos+1];
	    
	    #store the second number to be added
	    #parameter mode
	    if(mode2==0){
		#read the address
		pos2=code[pos+2];
		#store the corresponding number
		n2=code[pos2];
	    }
	    #immediate mode
	    else
		#store the value
		n2=code[pos+2];
	    #store the output position. Always in parameter mode.
	    posoutput=code[pos+3];
	    if( (op==7&&n1<n2) || (op==8&&n1==n2) )
		code[posoutput]=1;
	    else
		code[posoutput]=0;
	    pos += 4;
	}
    }
}

