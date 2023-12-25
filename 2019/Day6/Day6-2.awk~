function DistanceToRoot(i,parent){
    if(parent[i]~/^COM$/)
	return 1
    else return 1+DistanceToRoot(parent[i],parent)
}

BEGIN{
    FS = ")";
}

{
    parent[$2]=$1
}
END{
    direct=0;
    indirect=0;
    for (i in parent){
	indirect += DistanceToRoot(i,parent)-1;
	direct++;
    }
    print direct+indirect;
}
