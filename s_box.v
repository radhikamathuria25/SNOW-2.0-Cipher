
module s_box(in,out);

input [7:0]in;

output [7:0]out;

//reg [7:0]out;

wire [7:0]t2,t3,t5,t6;
wire [3:0]p,p1,p2,p21,q,q1,q2,x,y,t4;
wire [1:0]a,a1,a2,b,b1,b2,c,c1,d,d1,f,f1,f2,f3,g,g1,h,h1,h2,e,e1,e2,i,i1,i2,j,j1,j2,j3,m,m1,l,l1,l2;

	
	// Multiplicative Inversion
		//Isomorphic mapping
	assign	t2[7]=in[7]^in[5];
	assign	t2[6]=in[7]^in[6]^in[4]^in[3]^in[2]^in[1];
	assign	t2[5]=in[7]^in[5]^in[3]^in[2];
	assign	t2[4]=in[7]^in[5]^in[3]^in[2]^in[1];
	assign	t2[3]=in[7]^in[6]^in[2]^in[1];
	assign	t2[2]=in[7]^in[4]^in[3]^in[2]^in[1];
	assign	t2[1]=in[6]^in[4]^in[1];
	assign	t2[0]=in[6]^in[1]^in[0];

		//Spliting to upper and lower nibble
	assign	p=t2[7:4];    //p_upper_nibble
	assign	q=t2[3:0];    //q_lower nibble         
		//Adition operation in GF(2^4)
	assign	q1=p^q;     
		
	//Squareing  in GF(2^4)
	assign	p1[3]=p[3];      
	assign	p1[2]=p[3]^p[2];
	assign	p1[1]=p[2]^p[1];
	assign	p1[0]=p[3]^p[1]^p[0];     
		
	//Multiplication with constant lambda in GF(2^4)
	assign p2[3]=p1[2]^p1[0];
	assign	p2[2]=p1[3]^p1[2]^p1[1]^p1[0];
	assign	p2[1]=p1[3];
	assign	p2[0]=p1[2];    
		//Multiplication Operation in GF(2^4)
	
	assign	a=q1[3:2];
	assign	b=q1[1:0];
	assign	c=q[3:2];
	assign	d=q[1:0];
		
	assign	a1[1]=(a[1]^a[0])&(c[1]^c[0])^(a[0]&c[0]);
	assign	a1[0]=(a[1]&c[1])^(a[0]&c[0]);
	assign	a2[1]=a1[1]^a1[0];
	assign	a2[0]=a1[1];
		
	assign	b1=a^b;
	assign	c1=c^d;
	assign	b2[1]=(b1[1]^b1[0])&(c1[1]^c1[0])^(b1[0]&c1[0]);
	assign	b2[0]=(b1[1]&c1[1])^(b1[0]&c1[0]);
		
	assign	d1[1]=(b[1]^b[0])&(d[1]^d[0])^(b[0]&d[0]);
	assign	d1[0]=(b[1]&d[1])^(b[0]&d[0]);

	assign	p21=p2;

	assign	q2[3:2]=b2^d1;
	assign	q2[1:0]=a2^d1;
		//xor operation
	assign	t3=p21^q2;                         
		
	//Multiplicative Inversion in GF(2^4)
	assign	t4[3]=t3[3]^t3[3]&t3[2]&t3[1]^t3[3]&t3[0]^t3[2];
	assign	t4[2]=t3[3]&t3[2]&t3[1]^t3[3]&t3[2]&t3[0]^t3[3]&t3[0]^t3[2]^t3[2]&t3[1];
	assign	t4[1]=t3[3]^t3[3]&t3[2]&t3[1]^t3[3]&t3[1]&t3[0]^t3[2]^t3[2]&t3[0]^t3[1];
	assign	t4[0]=t3[3]&t3[2]&t3[1]^t3[3]&t3[2]&t3[0]^t3[3]&t3[1]^t3[3]&t3[1]&t3[0]^t3[3]&t3[0]^t3[2]^t3[2]&t3[1]^t3[2]&t3[1]&t3[0]^t3[1]^t3[0];
		
	
	//Multiplication Operation in GF(2^4)
	assign	e=p[3:2];
	assign	f=p[1:0];
	assign	g=t4[3:2];
	assign	h=t4[1:0];
	assign	e1[1]=(e[1]^e[0])&(g[1]^g[0])^(e[0]&g[0]);
	assign	e1[0]=(e[1]&g[1])^(e[0]&g[0]);
	assign	e2[1]=e1[1]^e1[0];
	assign	e2[0]=e1[1];
		
	assign	f1=e^f;
	assign	g1=g^h;
	assign	f2[1]=(f1[1]^f1[0])&(g1[1]^g1[0])^(f1[0]&g1[0]);
	assign	f2[0]=(f1[1]&g1[1])^(f1[0]&g1[0]);
		
	assign	h1[1]=(f[1]^f[0])&(h[1]^h[0])^(f[0]&h[0]);
	assign	h1[0]=(f[1]&h[1])^(f[0]&h[0]);
		
	assign	f3=f2^h1;
	assign	h2=e2^h1;
			
	assign	x[3:2]=f3;
	assign	x[1:0]=h2;
	
        //Multiplication Operation in GF(2^4)
	assign	i=t4[3:2];
	assign	j=t4[1:0];
	assign	m=q1[3:2];
	assign	l=q1[1:0];
		
	assign	i1[1]=(i[1]^i[0])&(m[1]^m[0])^(i[0]&m[0]);
	assign	i1[0]=(i[1]&m[1])^(i[0]&m[0]);
	assign	i2[1]=i1[1]^i1[0];
	assign	i2[0]=i1[1];
		
	assign	j1=i^j;
	assign	m1=m^l;
	assign	j2[1]=(j1[1]^j1[0])&(m1[1]^m1[0])^(j1[0]&m1[0]);
	assign	j2[0]=(j1[1]&m1[1])^(j1[0]&m1[0]);
		
	assign	l1[1]=(j[1]^j[0])&(l[1]^l[0])^(j[0]&l[0]);
	
	assign	l1[0]=(j[1]&l[1])^(j[0]&l[0]);
		
	assign	j3=j2^l1;
	assign	l2=i2^l1;
		
	assign	y[3:2]=j3;
	assign	y[1:0]=l2;




	assign	t5[7:4]=x;
	assign	t5[3:0]=y;
		
        //Inverse Isomorphic mapping to GF(2^8)
	assign	t6[7]=t5[7]^t5[6]^t5[5]^t5[1];
	assign	t6[6]=t5[6]^t5[2];
	assign	t6[5]=t5[6]^t5[5]^t5[1];
	assign	t6[4]=t5[6]^t5[5]^t5[4]^t5[2]^t5[1];
	assign	t6[3]=t5[5]^t5[4]^t5[3]^t5[2]^t5[1];
	assign	t6[2]=t5[7]^t5[4]^t5[3]^t5[2]^t5[1];
	assign	t6[1]=t5[5]^t5[4];
	assign	t6[0]=t5[6]^t5[5]^t5[4]^t5[2]^t5[0];

	
		
	//Affine Transformation
	assign  out[7]=t6[7]^t6[6]^t6[5]^t6[4]^t6[3];
	assign	out[6]=t6[6]^t6[5]^t6[4]^t6[3]^t6[2]^1'b1;
	assign	out[5]=t6[5]^t6[4]^t6[3]^t6[2]^t6[1]^1'b1;
	assign	out[4]=t6[4]^t6[3]^t6[2]^t6[1]^t6[0];
	assign	out[3]=t6[7]^t6[3]^t6[2]^t6[1]^t6[0];
	assign	out[2]=t6[7]^t6[6]^t6[2]^t6[1]^t6[0];
	assign	out[1]=t6[7]^t6[6]^t6[5]^t6[1]^t6[0]^1'b1;
	assign	out[0]=t6[7]^t6[6]^t6[5]^t6[4]^t6[0]^1'b1;

	endmodule