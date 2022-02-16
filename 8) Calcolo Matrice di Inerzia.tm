<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Matrice Inerzia Corpi Rigidi>>

  <\session|maxima|default>
    <\textput>
      \;
    </textput>

    <\textput>
      Coordnate del punto da integrare
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      p:matrix([x],[y],[z])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>>>
    </unfolded-io>

    <\textput>
      1.<strong|Parallelepipedo> Lati A,B,C\ 

      Consideriamo che il punto p si trovi al centro dell'oggetto.

      Estremi di integrazione
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      a:[-A/2,A/2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|-<frac|A|2>,<frac|A|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      b:[-B/2,B/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|-<frac|B|2>,<frac|B|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      c:[-C/2,C/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|-<frac|C|2>,<frac|C|2>|]>>>
    </unfolded-io>

    <\textput>
      Densit� del parallelepipedo
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      rhoP:M/(A*B*C)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><frac|M|A*B*C>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      parallelepipedo(p,a,b,c):=block(

      \ \ \ \ \ \ [s,sTs,II],

      \ \ \ \ \ \ s:S(p),

      \ \ \ \ \ \ sTs:transpose(s).s,

      \ \ \ \ \ \ II:factor(expand(integrate(integrate(integrate(sTs,x,a[1],a[2]),y,b[1],b[2]),z,c[1],c[2]))),

      \ \ \ \ \ \ return(II)

      \ \ \ \ \ \ 

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><math-up|parallelepipedo><around*|(|p,a,b,c|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|s,<math-up|sTs>,<math-up|II>|]>,s:S<around*|(|p|)>,<math-up|sTs>:<math-up|transpose><around*|(|s|)>\<cdot\>s,<math-up|II>:<math-up|factor><around*|(|<math-up|expand><around*|(|<math-up|integrate><around*|(|<math-up|integrate><around*|(|<math-up|integrate><around*|(|<math-up|sTs>,x,a<rsub|1>,a<rsub|2>|)>,y,b<rsub|1>,b<rsub|2>|)>,z,c<rsub|1>,c<rsub|2>|)>|)>|)>,<math-up|return><around*|(|<math-up|II>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      rhoP*parallelepipedo(p,a,b,c)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|C<rsup|2>+B<rsup|2>|)>*M|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|<around*|(|C<rsup|2>+A<rsup|2>|)>*M|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|<around*|(|B<rsup|2>+A<rsup|2>|)>*M|12>>>>>>>>
    </unfolded-io>

    <\textput>
      1.1 <strong|Parallelepipedo cavo con tappi>

      La cavit� � un secondo parallelepipedo posizionato al centro del primo,
      di lati <math|A<rsub|v t>,B<rsub|v t>,C<rsub|v t>> in cui:

      <\itemize>
        <item><math|A<rsub|v t>\<less\>A>;

        <item><math|B<rsub|v t>\<less\>B>;

        <item><math|C<rsub|v t>\<less\>C>.
      </itemize>

      \ 
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      avt:[-(A[vt])/2,(A[vt])/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|-<frac|A<rsub|<math-up|vt>>|2>,<frac|A<rsub|<math-up|vt>>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      bvt:[-(B[vt])/2,(B[vt])/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|-<frac|B<rsub|<math-up|vt>>|2>,<frac|B<rsub|<math-up|vt>>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      cvt:[-(C[vt])/2,(C[vt])/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|-<frac|C<rsub|<math-up|vt>>|2>,<frac|C<rsub|<math-up|vt>>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      rhovt:M/((A*B*C)-(A[vt]*B[vt]*C[vt]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><frac|M|A*B*C-A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      paraCavoT(p,a,b,c,avt,bvt,cvt):=block(

      [IIcavo,II,cavo,s,sTs],

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:transpose(s).s,

      II:factor(expand(integrate(integrate(integrate(

      sTs,x,a[1],a[2]),y,b[1],b[2]),z,c[1],c[2]))),

      cavo:factor(expand(integrate(integrate(integrate(

      sTs,x,avt[1],avt[2]),y,bvt[1],bvt[2]),z,cvt[1],cvt[2]))),

      IIcavo:(II-cavo),

      return(IIcavo)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      Ic:factor(expand(rhovt*paraCavoT(p,a,b,c,avt,bvt,cvt)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>><rsup|3>+A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>><rsup|3>*C<rsub|<math-up|vt>>-A*B*C<rsup|3>-A*B<rsup|3>*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>><rsup|3>+A<rsub|<math-up|vt>><rsup|3>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C<rsup|3>-A<rsup|3>*B*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>><rsup|3>*C<rsub|<math-up|vt>>+A<rsub|<math-up|vt>><rsup|3>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B<rsup|3>*C-A<rsup|3>*B*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>>>>>>>
    </unfolded-io>

    <\textput>
      <\center>
        <math|<matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>><rsup|3>+A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>><rsup|3>*C<rsub|<math-up|vt>>-A*B*C<rsup|3>-A*B<rsup|3>*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>><rsup|3>+A<rsub|<math-up|vt>><rsup|3>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C<rsup|3>-A<rsup|3>*B*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>><rsup|3>*C<rsub|<math-up|vt>>+A<rsub|<math-up|vt>><rsup|3>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B<rsup|3>*C-A<rsup|3>*B*C|)>|12*<around*|(|A<rsub|<math-up|vt>>*B<rsub|<math-up|vt>>*C<rsub|<math-up|vt>>-A*B*C|)>>>>>>>>

        \;
      </center>
    </textput>

    1.2 <strong|Parallelepipedo cavo senza tappi>

    La cavit� � un secondo parallelepipedo posizionato al centro del primo,
    di lati <math|A<rsub|v>,B<rsub|v>,C<rsub|v>> dove
    <math|A<rsub|v>=A,B<rsub|v>\<less\>B,C<rsub|v>\<less\>C>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      av:[-A/2,A/2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|-<frac|A|2>,<frac|A|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      bv:[-B[v]/2,B[v]/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|-<frac|B<rsub|v>|2>,<frac|B<rsub|v>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      cv:[-C[v]/2,C[v]/2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|-<frac|C<rsub|v>|2>,<frac|C<rsub|v>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      rhov:M/(A*B*C-A*B[v]*C[v])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><frac|M|A*B*C-A*B<rsub|v>*C<rsub|v>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|input>
      paraCavo(p,a,b,c,bv,cv):=block(

      [IIcavoT,II,cavoT,s,sTs],

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:transpose(s).s,

      II:factor(expand(integrate(integrate(integrate(

      sTs,x,a[1],a[2]),y,b[1],b[2]),z,c[1],c[2]))),

      cavoT:factor(expand(integrate(integrate(integrate(

      sTs,x,a[1],a[2]),y,bv[1],bv[2]),z,cv[1],cv[2]))),

      IIcavoT:(II-cavoT),

      return(IIcavoT)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      Ic:factor(expand(rhov*paraCavo(p,a,b,c,bv,cv)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|B<rsub|v>*C<rsub|v><rsup|3>+B<rsub|v><rsup|3>*C<rsub|v>-B*C<rsup|3>-B<rsup|3>*C|)>|12*<around*|(|B<rsub|v>*C<rsub|v>-B*C|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|B<rsub|v>*C<rsub|v><rsup|3>+A<rsup|2>*B<rsub|v>*C<rsub|v>-B*C<rsup|3>-A<rsup|2>*B*C|)>|12*<around*|(|B<rsub|v>*C<rsub|v>-B*C|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|B<rsub|v><rsup|3>*C<rsub|v>+A<rsup|2>*B<rsub|v>*C<rsub|v>-B<rsup|3>*C-A<rsup|2>*B*C|)>|12*<around*|(|B<rsub|v>*C<rsub|v>-B*C|)>>>>>>>>>
    </unfolded-io>

    <\textput>
      2. <strong|Cilindro> raggio R e altezza H

      Per calcolare gli integrali, si effettua il cambiamento di coordinate
      da cartesiane a cilindriche:

      <center|<math|<choice|<tformat|<table|<row|<cell|x=\<rho\>cos<around*|(|\<theta\>|)><space|1em>\<rho\>\<in\><around*|[|0,R|]>>>|<row|<cell|y=\<rho\>sin<around*|(|\<theta\>|)><space|1em>\<theta\>\<in\><around*|[|0,2\<pi\>|]>>>|<row|<cell|z=h<space|4em>h\<in\><around*|[|0,H|]>>>>>>>>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      assume(R\<gtr\>0)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|input>
      rhoC:[0,R]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|input>
      hC:[0,H]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      dens:M/(%pi*R^2*H)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><frac|M|\<pi\>*H*R<rsup|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      cilindro(rhoC,hC):=block(

      [I,s,sTs,p,x,y,z,J,thetaC],

      thetaC:[0,2*%pi],

      x:rho*cos(theta),

      y:rho*sin(theta),

      z:h,

      p:matrix([x],[y],[z]),

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:transpose(s).s,

      J:abs(trigsimp(determinant(

      addcol(diff(p,rho),diff(p,theta),diff(p,h))))),

      I:integrate(integrate(integrate(

      J*sTs,theta,thetaC[1],thetaC[2]),rho,rhoC[1],rhoC[2]),h,hC[1],hC[2]),

      return(I)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      factor(dens*cilindro(rhoC,hC))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*R<rsup|2>+4*H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*R<rsup|2>+4*H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*R<rsup|2>|2>>>>>>>>
    </unfolded-io>

    <\textput>
      2.1 <strong|Cilindro Cavo con Tappi>

      La cavit� � un secondo cilindro posizionato al centro del primo, di
      raggio <math|R<rsub|v t>> e altezza <math|H<rsub|v t>>. In particolare:

      <\itemize>
        <item><math|R<rsub|v t>\<less\>R>

        <item><math|H<rsub|v t>\<less\>H>
      </itemize>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      assume(R[vt]\<gtr\>0)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|input>
      rhoCvt:[0,R[vt]]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|input>
      hCvt:[0,H[vt]]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      densvt:M/((%pi*R^2*H)-(%pi*R[vt]^2*H[vt]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><frac|M|\<pi\>*H*R<rsup|2>-\<pi\>*H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|input>
      cilindroVT(rhoC,hC,rhoCvt,hCvt):=block(

      [I,cavo,Icavo,s,sTs,p,x,y,z,J,thetaC],

      thetaC:[0,2*%pi],

      x:rho*cos(theta),

      y:rho*sin(theta),

      z:h,

      p:matrix([x],[y],[z]),

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:transpose(s).s,

      J:abs(trigsimp(determinant(

      addcol(diff(p,rho),diff(p,theta),diff(p,h))))),

      I:integrate(integrate(integrate(

      J*sTs,theta,thetaC[1],thetaC[2]),rho,rhoC[1],rhoC[2]),h,hC[1],hC[2]),

      cavo:integrate(integrate(integrate(

      J*sTs,theta,thetaC[1],thetaC[2]),

      rho,rhoCvt[1],rhoCvt[2]),h,hCvt[1],hCvt[2]),

      Icavo:I-cavo,

      return(Icavo)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      factor(densvt*cilindroVT(rhoC,hC,rhoCvt,hCvt))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|4>+4*H<rsub|<math-up|vt>><rsup|3>*R<rsub|<math-up|vt>><rsup|2>-3*H*R<rsup|4>-4*H<rsup|3>*R<rsup|2>|)>|12*<around*|(|H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|2>-H*R<rsup|2>|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|4>+4*H<rsub|<math-up|vt>><rsup|3>*R<rsub|<math-up|vt>><rsup|2>-3*H*R<rsup|4>-4*H<rsup|3>*R<rsup|2>|)>|12*<around*|(|H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|2>-H*R<rsup|2>|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|4>-H*R<rsup|4>|)>|2*<around*|(|H<rsub|<math-up|vt>>*R<rsub|<math-up|vt>><rsup|2>-H*R<rsup|2>|)>>>>>>>>>
    </unfolded-io>

    <\textput>
      2.2 <strong|Cilindro Cavo senza Tappi>

      La cavit� � un secondo cilindro posizionato al centro del primo di
      raggio <math|R<rsub|v>> e altezza <math|H<rsub|v>>. In particolare:

      <\itemize>
        <item><math|R<rsub|v>\<less\>R>

        <item><math|H<rsub|v>=H>
      </itemize>

      Per eseguire il calcolo dell'integrale usiamo sempre lo stesso
      cambiamento di coordinate
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|input>
      assume(R[v]\<gtr\>0)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|input>
      rhoCv:[0,R[v]]$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|input>
      hCv:[0,H]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      densv:M/((%pi*R^2*H)-(%pi*R[v]^2*H))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><frac|M|\<pi\>*H*R<rsup|2>-\<pi\>*H*R<rsub|v><rsup|2>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|input>
      cilindroV(rhoC,hC,rhoCv):=block(

      [I,cavo,Icavo,s,sTs,p,x,y,z,J,thetaC],

      thetaC:[0,2*%pi],

      x:rho*cos(theta),

      y:rho*sin(theta),

      z:h,

      p:matrix([x],[y],[z]),

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:transpose(s).s,

      J:abs(trigsimp(determinant(

      addcol(diff(p,rho),diff(p,theta),diff(p,h))))),

      I:integrate(integrate(integrate(

      J*sTs,theta,thetaC[1],thetaC[2]),rho,rhoC[1],rhoC[2]),h,hC[1],hC[2]),

      cavo:integrate(integrate(integrate(

      J*sTs,theta,thetaC[1],thetaC[2]),

      rho,rhoCv[1],rhoCv[2]),h,hC[1],hC[2]),

      Icavo:I-cavo,

      return(Icavo)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      factor(densv*cilindroV(rhoC,hC,rhoCv))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><matrix|<tformat|<table|<row|<cell|<frac|M*<around*|(|3*R<rsub|v><rsup|2>+3*R<rsup|2>+4*H<rsup|2>|)>|12>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|M*<around*|(|3*R<rsub|v><rsup|2>+3*R<rsup|2>+4*H<rsup|2>|)>|12>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|M*<around*|(|R<rsub|v><rsup|2>+R<rsup|2>|)>|2>>>>>>>>
    </unfolded-io>

    <\textput>
      3. <strong|Sfera di raggio <math|R>>

      Per il calcolo dell'integrale usiamo le coordinate sferiche:

      <\equation*>
        <choice|<tformat|<table|<row|<cell|x=\<rho\>sin<around*|(|\<phi\>|)>cos<around*|(|\<theta\>|)>>>|<row|<cell|y=\<rho\>sin<around*|(|\<phi\>|)>sin<around*|(|\<theta\>|)>>>|<row|<cell|z=\<rho\>cos<around*|(|\<phi\>|)>>>>>>\<longrightarrow\>\<theta\>\<in\><around*|[|0;2\<pi\>|]>,\<rho\>\<in\><around*|[|-<frac|R|2>,<frac|R|2>|]>,\<phi\>\<in\><around*|[|0;2\<pi\>|]>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|input>
      rhoS:[0,R]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      densS:M/(4/3*%pi*R^3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><frac|3*M|4*\<pi\>*R<rsup|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|input>
      sfera(rhoS):=block(

      [I,s,sTs,p,x,y,z,J,thetaS,phiS],

      thetaS:[0,2*%pi],phiS:[0,%pi],

      x:rho*cos(theta)*sin(phi),

      y:rho*sin(theta)*sin(phi),

      z:rho*cos(phi),

      p:matrix([x],[y],[z]),

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:trigsimp(transpose(s).s),

      J:abs(trigsimp(determinant(

      addcol(diff(p,rho),diff(p,theta),diff(p,phi))))),

      assume(sin(phi)\<gtr\>0),

      I:integrate(integrate(integrate(

      J*sTs,theta,thetaS[1],thetaS[2]),

      rho,rhoS[1],rhoS[2]),phi,phiS[1],phiS[2]),

      return(I)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      densS*sfera(rhoS)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*M*R<rsup|2>|5>>>>>>>>
    </unfolded-io>

    <\textput>
      3.1 <strong|Sfera Cava di raggio <math|R>>

      La cavit� � formata da una seconda sfera di raggio <math|R<rsub|v>>
      tale che <math|R<rsub|v>\<less\>0>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|input>
      rv:[0,R[v]]$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      densSv:M/(4/3*%pi*R^3-4/3*%pi*R[v]^3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><frac|M|<frac|4*\<pi\>*R<rsup|3>|3>-<frac|4*\<pi\>*R<rsub|v><rsup|3>|3>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|input>
      sferaV(rhoS,rv):=block(

      [I,cavo,Icavo,s,sTs,p,x,y,z,J,thetaS,phiS],

      thetaS:[0,2*%pi],phiS:[0,%pi],

      x:rho*cos(theta)*sin(phi),

      y:rho*sin(theta)*sin(phi),

      z:rho*cos(phi),

      p:matrix([x],[y],[z]),

      s:matrix([0,-p[3][1],p[2][1]],

      [p[3][1],0,-p[1][1]],

      [-p[2][1],p[1][1],0]),

      sTs:trigsimp(transpose(s).s),

      J:abs(trigsimp(determinant(

      addcol(diff(p,rho),diff(p,theta),diff(p,phi))))),

      assume(sin(phi)\<gtr\>0),

      I:integrate(integrate(integrate(

      J*sTs,theta,thetaS[1],thetaS[2]),

      rho,rhoS[1],rhoS[2]),phi,phiS[1],phiS[2]),

      cavo:integrate(integrate(integrate(

      J*sTs,theta,thetaS[1],thetaS[2]),

      rho,rv[1],rv[2]),phi,phiS[1],phiS[2]),

      Icavo:I-cavo,

      return(Icavo)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      factor(densSv*sferaV(rhoS,rv))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*M*<around*|(|R<rsub|v><rsup|4>+R*R<rsub|v><rsup|3>+R<rsup|2>*R<rsub|v><rsup|2>+R<rsup|3>*R<rsub|v>+R<rsup|4>|)>|5*<around*|(|R<rsub|v><rsup|2>+R*R<rsub|v>+R<rsup|2>|)>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|2*M*<around*|(|R<rsub|v><rsup|4>+R*R<rsub|v><rsup|3>+R<rsup|2>*R<rsub|v><rsup|2>+R<rsup|3>*R<rsub|v>+R<rsup|4>|)>|5*<around*|(|R<rsub|v><rsup|2>+R*R<rsub|v>+R<rsup|2>|)>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|2*M*<around*|(|R<rsub|v><rsup|4>+R*R<rsub|v><rsup|3>+R<rsup|2>*R<rsub|v><rsup|2>+R<rsup|3>*R<rsub|v>+R<rsup|4>|)>|5*<around*|(|R<rsub|v><rsup|2>+R*R<rsub|v>+R<rsup|2>|)>>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>