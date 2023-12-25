#This is a function that compute the distance between a node and the
#root
function DistanceToRoot(i,parent){
    if(parent[i]~/^COM$/)
	return 1
    else return 1+DistanceToRoot(parent[i],parent)
}

#This is a function that compute the distance to a node
function DistanceToNode(i,parent,j){
    if(parent[i]~j){
	print parent[i]
	return 1
    }
    else return 1+DistanceToNode(parent[i],parent,j)
}

#This is a function creates the route to the root and indicate its
#length in the global variable _length
function RouteToRoot(i,parent,route){
    if(parent[i]~/^COM$/){
	route[_length]="COM"
	_length +=1;
    }
    else{
	RouteToRoot(parent[i],parent,route);
	route[_length]=parent[i];
	_length +=1;
    }
}

#This set the field separator
BEGIN{
    FS = ")";
}

#This creates the array of parents. parent["TCD"] will be "HDT", for
#instance.
{
    parent[$2]=$1
}


END{
    #initialize _length at 0
    _length=0
    #construct the route from YOU to COM
    RouteToRoot("YOU",parent,routefromYou);
    lengthyou=_length;
    
    #construct the route from YOU to COM. First reset _length to 0.
    _length=0
    RouteToRoot("SAN",parent,routefromSan);
    lengthsan=_length;

    #compute the max length
    max=lengthyou>lengthsan?lengthyou:lengthsan

    # printf("length route from YOU: %d\n",lengthyou);
    # printf("route from YOU ");
    # for (i=0;i<lengthyou;i++)
    # 	printf("%s ",routefromYou[i]);
    # printf("\n");

    # printf("length route from SAN: %d\n",lengthsan);
    # printf("route from SAN ");
    # for (i=0;i<lengthsan;i++)
    # 	printf("%s ", routefromSan[i]);
    # printf("\n");

    #Find the first divergence
    i=0;
    while(routefromYou[i]==routefromSan[i])
	i++;

    #print the distance to the first common node
    printf("Distance to common node from YOU %d\n",lengthyou-i);
    printf("Distance to common node from SAN %d\n",lengthsan-i);

    #print the number of hops which are needed
    printf("Number of jumps needed %d\n",lengthyou+lengthsan-i-i);
}
