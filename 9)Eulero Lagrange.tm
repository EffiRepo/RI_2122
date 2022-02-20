<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Equazioni di Eulero Lagrange>>

  <\session|maxima|default>
    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      euleroLagrange(DH,M,F,u,Trsz):=block(

      [T,U,l,dFdq,dldq,dldv,dtdldv,eq:[],solEL:[],a,v,q],

      /*T:energiacinetica,U:energiapotenzialegravitazionale*/

      /*F:attritostatico,dLdq:derivatadiLrispettoq*/

      /*dLddq:derivatadiLrispettoaqpunto,e:energia*/

      /*q:variabilidigiunto*/

      /*EL:equazionieulerolagrange*/

      [T,U]:energia(DH,M,Trsz,0),

      l:T-U,

      dof:size(DH)[1],

      for i:1 thru dof do(

      dldv:diff(l,v[i]),

      dldq:diff(l,q[i]),

      dFdv:diff(F,v[i]),

      dtdldv:derivate(dldv),

      eq:append(eq,dtdldv-dldq+dFdv-u[i]),

      solEL:append(solEL,solve(eq[i],a[i]))

      ),

      return(rename([eq,solEL],0))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      DH:[matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),

      matrix([0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,L[3]]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,%pi/2,D[2]],[0,q[3],0,0]),

      matrix([q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|D<rsub|3>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      Trsz:[matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),

      matrix([0,L[1]/2,0],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,0,-L[1]/2],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([-D[1]/2,0,-L[1]/2],[-D[2]/2,0,0],[0,0,L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[0,0,-L[3]/2]),

      matrix([0,L[1]/2,0],[0,-L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[-D[3]/2,0,0])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|L<rsub|1>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>|2>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|D<rsub|1>|2>>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|-<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|D<rsub|3>|2>>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      dueDof:DH[1]

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      Mdd:[M[1],M[2]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|M<rsub|1>,M<rsub|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      udd:matrix([u[1]],[u[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Fdd:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      dd:euleroLagrange(dueDof,Mdd,Fdd,udd,Trsz[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|z<rsub|2>+L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>+L<rsub|1><rsup|2>*M<rsub|2>+z<rsub|1>+<frac|L<rsub|1><rsup|2>*M<rsub|1>|4>|)>+a<rsub|2>*<around*|(|z<rsub|2>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>-L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>|)>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|1>*<around*|(|z<rsub|2>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+a<rsub|2>*<around*|(|z<rsub|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+D<rsub|2>*v<rsub|2>-u<rsub|2>+<frac|L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*s<rsub|2>|2>|]>,<around*|[|a<rsub|1>=<frac|-4*a<rsub|2>*z<rsub|2>+s<rsub|2>*<around*|(|2*L<rsub|1>*L<rsub|2>*M<rsub|2>*v<rsub|2><rsup|2>+4*L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*v<rsub|2>|)>-2*L<rsub|1>*L<rsub|2>*M<rsub|2>*a<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>*M<rsub|2>*a<rsub|2>-4*D<rsub|1>*v<rsub|1>+4*u<rsub|1>|4*z<rsub|2>+4*L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+<around*|(|L<rsub|2><rsup|2>+4*L<rsub|1><rsup|2>|)>*M<rsub|2>+4*z<rsub|1>+L<rsub|1><rsup|2>*M<rsub|1>>,a<rsub|2>=-<frac|4*a<rsub|1>*z<rsub|2>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>+2*L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*s<rsub|2>+2*L<rsub|1>*a<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+a<rsub|1>*L<rsub|2><rsup|2>*M<rsub|2>|4*z<rsub|2>+L<rsub|2><rsup|2>*M<rsub|2>>|]>|]>>>
    </unfolded-io>

    <\textput>
      Robot Cartesiano
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      cartes:DH[2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Mcart:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      ucart:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Fcart:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      cart:euleroLagrange(cartes,Mcart,Fcart,ucart,Trsz[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|M<rsub|3>+M<rsub|2>+M<rsub|1>|)>-10*M<rsub|3>-10*M<rsub|2>+D<rsub|1>*v<rsub|1>-u<rsub|1>-10*M<rsub|1>,a<rsub|2>*<around*|(|M<rsub|3>+M<rsub|2>|)>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>,M<rsub|3>*a<rsub|3>-u<rsub|3>|]>,<around*|[|a<rsub|1>=<frac|10*M<rsub|3>+10*M<rsub|2>-D<rsub|1>*v<rsub|1>+u<rsub|1>+10*M<rsub|1>|M<rsub|3>+M<rsub|2>+M<rsub|1>>,a<rsub|2>=-<frac|v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>|M<rsub|3>+M<rsub|2>>,a<rsub|3>=<frac|u<rsub|3>|M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      Robot Cilindrico
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      cilin:DH[3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      Mc:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      uc:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      Fc:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      cil:euleroLagrange(cilin,Mc,Fc,uc,Trsz[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|y<rsub|3>+M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>+y<rsub|2>+z<rsub|1>|)>+<around*|(|2*v<rsub|1>*M<rsub|3>*q<rsub|3>-v<rsub|1>*L<rsub|3>*M<rsub|3>|)>*v<rsub|3>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|2>*<around*|(|M<rsub|3>+M<rsub|2>|)>-10*M<rsub|3>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>-10*M<rsub|2>,-u<rsub|3>-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3>+M<rsub|3>*a<rsub|3>+<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>|2>|]>,<around*|[|a<rsub|1>=-<frac|<around*|(|8*v<rsub|1>*M<rsub|3>*q<rsub|3>-4*v<rsub|1>*L<rsub|3>*M<rsub|3>|)>*v<rsub|3>+4*D<rsub|1>*v<rsub|1>-4*u<rsub|1>|4*y<rsub|3>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+4*y<rsub|2>+4*z<rsub|1>>,a<rsub|2>=<frac|10*M<rsub|3>-v<rsub|2>*D<rsub|3>-D<rsub|2>*v<rsub|2>+u<rsub|2>+10*M<rsub|2>|M<rsub|3>+M<rsub|2>>,a<rsub|3>=<frac|2*u<rsub|3>+2*v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>|2*M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      SCARA
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      scara:DH[4]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      Ms:[M[1],M[2],M[3]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      us:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      Fs:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      scar:euleroLagrange(scara,Ms,Fs,us,Trsz[4])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|z<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*M<rsub|3>+z<rsub|2>+D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>+D<rsub|1><rsup|2>*M<rsub|2>+z<rsub|1>+<frac|D<rsub|1><rsup|2>*M<rsub|1>|4>|)>+a<rsub|2>*<around*|(|z<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+z<rsub|2>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-D<rsub|1>*s<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>-2*D<rsub|1>*v<rsub|1>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2>*M<rsub|3>-2*D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*M<rsub|3>-<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>-D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>|)>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|1>*<around*|(|z<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+z<rsub|2>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+a<rsub|2>*<around*|(|z<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+z<rsub|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-D<rsub|1>*v<rsub|1>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*M<rsub|3>-<frac|D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>|2>|)>+D<rsub|1>*v<rsub|1>*s<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*v<rsub|1><rsup|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2>*M<rsub|3>+D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2>*M<rsub|3>+v<rsub|2>*D<rsub|3>+<frac|D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>+D<rsub|2>*v<rsub|2>-u<rsub|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*s<rsub|2>|2>,-u<rsub|3>+M<rsub|3>*a<rsub|3>-10*M<rsub|3>|]>,<around*|[|a<rsub|1>=<frac|-4*a<rsub|2>*z<rsub|3>+s<rsub|2>*<around*|(|<around*|(|<around*|(|4*D<rsub|1>*v<rsub|2><rsup|2>+8*D<rsub|1>*v<rsub|1>*v<rsub|2>|)>*L<rsub|3>+4*D<rsub|1>*D<rsub|2>*v<rsub|2><rsup|2>+8*D<rsub|1>*v<rsub|1>*D<rsub|2>*v<rsub|2>|)>*M<rsub|3>+2*D<rsub|1>*D<rsub|2>*M<rsub|2>*v<rsub|2><rsup|2>+4*D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*v<rsub|2>|)>+c<rsub|2>*<around*|(|<around*|(|-4*D<rsub|1>*a<rsub|2>*L<rsub|3>-4*D<rsub|1>*D<rsub|2>*a<rsub|2>|)>*M<rsub|3>-2*D<rsub|1>*D<rsub|2>*M<rsub|2>*a<rsub|2>|)>+<around*|(|-4*a<rsub|2>*L<rsub|3><rsup|2>-8*D<rsub|2>*a<rsub|2>*L<rsub|3>-4*D<rsub|2><rsup|2>*a<rsub|2>|)>*M<rsub|3>-4*a<rsub|2>*z<rsub|2>-D<rsub|2><rsup|2>*M<rsub|2>*a<rsub|2>-4*D<rsub|1>*v<rsub|1>+4*u<rsub|1>|4*z<rsub|3>+c<rsub|2>*<around*|(|<around*|(|8*D<rsub|1>*L<rsub|3>+8*D<rsub|1>*D<rsub|2>|)>*M<rsub|3>+4*D<rsub|1>*D<rsub|2>*M<rsub|2>|)>+<around*|(|4*L<rsub|3><rsup|2>+8*D<rsub|2>*L<rsub|3>+4*D<rsub|2><rsup|2>+4*D<rsub|1><rsup|2>|)>*M<rsub|3>+4*z<rsub|2>+<around*|(|D<rsub|2><rsup|2>+4*D<rsub|1><rsup|2>|)>*M<rsub|2>+4*z<rsub|1>+D<rsub|1><rsup|2>*M<rsub|1>>,a<rsub|2>=-<frac|4*a<rsub|1>*z<rsub|3>+s<rsub|2>*<around*|(|<around*|(|4*D<rsub|1>*v<rsub|1><rsup|2>*L<rsub|3>+4*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>|)>*M<rsub|3>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>|)>+c<rsub|2>*<around*|(|<around*|(|4*D<rsub|1>*a<rsub|1>*L<rsub|3>+4*D<rsub|1>*a<rsub|1>*D<rsub|2>|)>*M<rsub|3>+2*D<rsub|1>*a<rsub|1>*D<rsub|2>*M<rsub|2>|)>+<around*|(|4*a<rsub|1>*L<rsub|3><rsup|2>+8*a<rsub|1>*D<rsub|2>*L<rsub|3>+4*a<rsub|1>*D<rsub|2><rsup|2>|)>*M<rsub|3>+4*v<rsub|2>*D<rsub|3>+4*a<rsub|1>*z<rsub|2>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>+a<rsub|1>*D<rsub|2><rsup|2>*M<rsub|2>|4*z<rsub|3>+<around*|(|4*L<rsub|3><rsup|2>+8*D<rsub|2>*L<rsub|3>+4*D<rsub|2><rsup|2>|)>*M<rsub|3>+4*z<rsub|2>+D<rsub|2><rsup|2>*M<rsub|2>>,a<rsub|3>=<frac|u<rsub|3>+10*M<rsub|3>|M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      \;
    </input>
  </session>

  \;

  <nbsp>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>