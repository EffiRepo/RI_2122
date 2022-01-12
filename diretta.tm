<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      \;
    </input>

    <\input|Maxima] >
      \;
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      Av(v, theta, d):=block(<next-line>[exp, S, dv, row,
      T],<next-line>S:S(v),<next-line>exp:expLaplace(S,
      theta),<next-line>row:matrix([0,0,0,1]),<next-line>dv:d*v,<next-line>T:addcol(exp,
      dv),<next-line>T:addrow(T,row),<next-line>return(trigsimp(trigrat(trigreduce(trigexpand(T)))))<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      Avz(theta,d):=block(<next-line>[z, Av],<next-line>z:matrix([0],[0],[1]),<next-line>Av:Av(z,theta,d),<next-line>return(Av)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      Avx(alpha,a):=block(<next-line>[x,Av],<next-line>x:matrix([1],[0],[0]),<next-line>Av:Av(x,alpha,a),<next-line>return(Av)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      Qij(thetai,di,alphai,ai):=block(<next-line>[Avz,Avx,Q],<next-line>Avz:Avz(thetai,di),<next-line>Avx:Avx(alphai,ai),<next-line>Q:Avz.Avx,<next-line>return(Q)<next-line>)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      Q01:Qij(q[1],0,0,L[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      size(Q01)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|4,4|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Q01:ident(3)Qij(0,q1,-%pi/2,0).Qij(-%pi/2, q2, -%pi/2, 0)
    <|unfolded-io>
      \;

      incorrect syntax: Qij is not an infix operator

      Q01:ident(3)Qij(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ ^
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Q01[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|cos <around*|(|q<rsub|1>|)>,-sin
      <around*|(|q<rsub|1>|)>,0,L<rsub|1>*cos <around*|(|q<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      DH(M):=block([dim,Q:ident(4),Qtemp:ident(4)],

      \ \ \ \ \ \ \ \ \ \ \ \ \ dim:size(M),

      \ \ \ \ \ \ \ \ \ \ \ \ \ Q:Q.Qij(M[1][1],M[1][2],M[1][3],M[1][4]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru dim[1]-1 do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print(Q),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Qtemp:Qij(M[i+1][1],M[i+1][2],M[i+1][3],M[i+1][4]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print(Qtemp),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if (M[i][1]#0 and M[i+1][1]#0) and

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (M[i][3]=0 and M[i+1][3]=0) then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ print(Q),print(Qtemp),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Q:expand(trigreduce(Q.Qtemp))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else(Q:Q.Qtemp)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(Q)

      \ \ \ \ \ \ \ \ \ \ \ \ \ )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><math-up|DH><around*|(|M|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|dim>,Q:<math-up|ident><around*|(|4|)>,<math-up|Qtemp>:<math-up|ident><around*|(|4|)>|]>,<math-up|dim>:<math-up|size><around*|(|M|)>,Q:Q\<cdot\><math-up|Qij><around*|(|<around*|(|M<rsub|1>|)><rsub|1>,<around*|(|M<rsub|1>|)><rsub|2>,<around*|(|M<rsub|1>|)><rsub|3>,<around*|(|M<rsub|1>|)><rsub|4>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|dim><rsub|1>-1<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|print><around*|(|Q|)>,<math-up|Qtemp>:<math-up|Qij><around*|(|<around*|(|M<rsub|i+1>|)><rsub|1>,<around*|(|M<rsub|i+1>|)><rsub|2>,<around*|(|M<rsub|i+1>|)><rsub|3>,<around*|(|M<rsub|i+1>|)><rsub|4>|)>,<math-up|print><around*|(|<math-up|Qtemp>|)>,<math-bf|if><space|0.27em><around*|(|M<rsub|i>|)><rsub|1>\<neq\>0\<wedge\><around*|(|M<rsub|i+1>|)><rsub|1>\<neq\>0\<wedge\><around*|(|<around*|(|M<rsub|i>|)><rsub|3>=0\<wedge\><around*|(|M<rsub|i+1>|)><rsub|3>=0|)><space|0.27em><math-bf|then><space|0.27em><around*|(|<math-up|print><around*|(|Q|)>,<math-up|print><around*|(|<math-up|Qtemp>|)>,Q:<math-up|expand><around*|(|<math-up|trigreduce><around*|(|Q\<cdot\><math-up|Qtemp>|)>|)>|)><space|0.27em><math-bf|else><space|0.27em>Q:Q\<cdot\><math-up|Qtemp>|)>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    <\textput>
      <strong|2 DOF Planare>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      M:[[q[1],0,0,L[1]],[q[2],0,0,L[2]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      DH(M)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>|)>>|<cell|-sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>|)>>|<cell|cos <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      \;

      \ <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>|)>>|<cell|-sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>|)>>|<cell|cos <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot 3DOF>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      M:[[q[1],0,0,L[1]],[q[2],0,0,L[2]],[q[3],0,0,L[3]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,L<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      DH(M)
    <|unfolded-io>
      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>|)>>|<cell|-sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>|)>>|<cell|cos <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      \;

      \ <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>|)>>|<cell|-sin
      <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>|)>>|<cell|cos <around*|(|q<rsub|2>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|3>|)>>|<cell|-sin
      <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|L<rsub|3>*cos
      <around*|(|q<rsub|3>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|3>|)>>|<cell|cos <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|L<rsub|3>*sin
      <around*|(|q<rsub|3>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|3>|)>>|<cell|-sin
      <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|L<rsub|3>*cos
      <around*|(|q<rsub|3>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|3>|)>>|<cell|cos <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|L<rsub|3>*sin
      <around*|(|q<rsub|3>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|3>*cos
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>+L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|3>*sin
      <around*|(|q<rsub|3>+q<rsub|2>+q<rsub|1>|)>+L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      exprbreak(M)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|q<rsub|1>,0,0,L<rsub|1>,q<rsub|2>,0,0,L<rsub|2>,q<rsub|3>,0,0,L<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      part(L[2]*cos (q[2]+q[1]),2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >>cos <around*|(|q<rsub|2>+q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      operatorp(cos(a),cos)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      matchdeclare(a,lambda([x],is(x=cos)),b,symbolp,l,integerp)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      defrule(r1,a(b[l]),c[l])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><with|math-font-family|rm|r1>:a<around*|(|b<rsub|l>|)>\<rightarrow\>c<rsub|l>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      matchdeclare(d,lambda([x],is(x=sin)),f,symbolp,g,integerp)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      defrule(r2,d(f[l]),s[l])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|r2>:d<around*|(|f<rsub|l>|)>\<rightarrow\>s<rsub|l>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      r1(cos(theta[1]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      r2(sin(theta[1]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      matchdeclare(dd,lambda([x],is(x=sin)),sa,symbolp,z,symbolp,ss,integerp,zz,integerp)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      defrule(r3,dd(sa[ss]+z[zz]),s[ss,zz])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<verbatim|d><verbatim|e><verbatim|f><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|:><verbatim|
      >>z<rsub|<math-up|zz>><text|<verbatim|
      ><verbatim|w><verbatim|i><verbatim|l><verbatim|l><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|e><verbatim|d><verbatim|
      ><verbatim|u><verbatim|n><verbatim|i><verbatim|q><verbatim|u><verbatim|e><verbatim|l><verbatim|y><verbatim|
      ><verbatim|s><verbatim|i><verbatim|n><verbatim|c><verbatim|e><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|-><verbatim|p><verbatim|a><verbatim|r><verbatim|t><verbatim|s><verbatim|
      ><verbatim|w><verbatim|o><verbatim|u><verbatim|l><verbatim|d><verbatim|
      ><verbatim|o><verbatim|t><verbatim|h><verbatim|e><verbatim|r><verbatim|w><verbatim|i><verbatim|s><verbatim|e><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|a><verbatim|m><verbatim|b><verbatim|i><verbatim|g><verbatim|u><verbatim|o><verbatim|u><verbatim|s><verbatim|.>>>>

      \;

      \ <math|<with|math-display|true|<text|<verbatim|d><verbatim|e><verbatim|f><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|:><verbatim|
      >><math-up|sa><rsub|<math-up|ss>><text|<verbatim|
      ><verbatim|w><verbatim|i><verbatim|l><verbatim|l><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|e><verbatim|d><verbatim|
      ><verbatim|u><verbatim|n><verbatim|i><verbatim|q><verbatim|u><verbatim|e><verbatim|l><verbatim|y><verbatim|
      ><verbatim|s><verbatim|i><verbatim|n><verbatim|c><verbatim|e><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|-><verbatim|p><verbatim|a><verbatim|r><verbatim|t><verbatim|s><verbatim|
      ><verbatim|w><verbatim|o><verbatim|u><verbatim|l><verbatim|d><verbatim|
      ><verbatim|o><verbatim|t><verbatim|h><verbatim|e><verbatim|r><verbatim|w><verbatim|i><verbatim|s><verbatim|e><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|a><verbatim|m><verbatim|b><verbatim|i><verbatim|g><verbatim|u><verbatim|o><verbatim|u><verbatim|s><verbatim|.>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><with|math-font-family|rm|r3>:<math-up|dd><around*|(|z<rsub|<math-up|zz>>+<math-up|sa><rsub|<math-up|ss>>|)>\<rightarrow\>s<rsub|<math-up|ss>,<math-up|zz>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      r3(sin(theta[1]+theta[2]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>s<rsub|2,1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      matchdeclare(ddd,lambda([x],is(x=cos)),saa,symbolp,zzz,symbolp,sss,integerp,zzzz,integerp)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      defrule(r4,ddd(saa[sss]+z[zzzz]),cos(saa[sss])*cos(z[zzzz]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<verbatim|d><verbatim|e><verbatim|f><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|:><verbatim|
      >>z<rsub|<math-up|zzzz>><text|<verbatim|
      ><verbatim|w><verbatim|i><verbatim|l><verbatim|l><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|e><verbatim|d><verbatim|
      ><verbatim|u><verbatim|n><verbatim|i><verbatim|q><verbatim|u><verbatim|e><verbatim|l><verbatim|y><verbatim|
      ><verbatim|s><verbatim|i><verbatim|n><verbatim|c><verbatim|e><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|-><verbatim|p><verbatim|a><verbatim|r><verbatim|t><verbatim|s><verbatim|
      ><verbatim|w><verbatim|o><verbatim|u><verbatim|l><verbatim|d><verbatim|
      ><verbatim|o><verbatim|t><verbatim|h><verbatim|e><verbatim|r><verbatim|w><verbatim|i><verbatim|s><verbatim|e><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|a><verbatim|m><verbatim|b><verbatim|i><verbatim|g><verbatim|u><verbatim|o><verbatim|u><verbatim|s><verbatim|.>>>>

      \;

      \ <math|<with|math-display|true|<text|<verbatim|d><verbatim|e><verbatim|f><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|:><verbatim|
      >><math-up|saa><rsub|<math-up|sss>><text|<verbatim|
      ><verbatim|w><verbatim|i><verbatim|l><verbatim|l><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|m><verbatim|a><verbatim|t><verbatim|c><verbatim|h><verbatim|e><verbatim|d><verbatim|
      ><verbatim|u><verbatim|n><verbatim|i><verbatim|q><verbatim|u><verbatim|e><verbatim|l><verbatim|y><verbatim|
      ><verbatim|s><verbatim|i><verbatim|n><verbatim|c><verbatim|e><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|-><verbatim|p><verbatim|a><verbatim|r><verbatim|t><verbatim|s><verbatim|
      ><verbatim|w><verbatim|o><verbatim|u><verbatim|l><verbatim|d><verbatim|
      ><verbatim|o><verbatim|t><verbatim|h><verbatim|e><verbatim|r><verbatim|w><verbatim|i><verbatim|s><verbatim|e><verbatim|
      ><verbatim|b><verbatim|e><verbatim|
      ><verbatim|a><verbatim|m><verbatim|b><verbatim|i><verbatim|g><verbatim|u><verbatim|o><verbatim|u><verbatim|s><verbatim|.>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><with|math-font-family|rm|r4>:<math-up|ddd><around*|(|z<rsub|<math-up|zzzz>>+<math-up|saa><rsub|<math-up|sss>>|)>\<rightarrow\>cos
      <around*|(|<math-up|saa><rsub|<math-up|sss>>|)>*cos
      <around*|(|z<rsub|<math-up|zzzz>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      r4(cos(theta[1]+theta[2]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >>cos <around*|(|\<vartheta\><rsub|1>|)>*cos
      <around*|(|\<vartheta\><rsub|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      applyb1(cos(theta[1]+theta[2]),r4,r1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >>c<rsub|1>*c<rsub|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      printprops(a)
    <|unfolded-io>
      \;

      printprops: requires two arguments.

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      a:cos(theta[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>cos <around*|(|\<vartheta\><rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      a:applyb1(a,r1,r2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>c<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      b:sin(theta[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>sin <around*|(|\<vartheta\><rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      b:applyb1(b,r1,r2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>s<rsub|1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      a^2+b^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>s<rsub|1><rsup|2>+c<rsub|1><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      matchdeclare()
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>