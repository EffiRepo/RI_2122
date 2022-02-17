<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\input|Procedura per il calcolo della cinematica diretta >
      \;
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      Av(v, theta, d):=block([exp, S, dv, row, T],

      S:S(v),

      exp:expLaplace(S, theta),

      row:matrix([0,0,0,1]),

      dv:d*v,

      T:addcol(exp, dv),

      T:addrow(T,row),

      return(trigsimp(trigrat(trigreduce(trigexpand(T)))))

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|input>
      Avz(theta,d):=block(

      \ \ \ \ [z, Av],

      \ \ \ \ z:matrix([0],[0],[1]),

      \ \ \ \ Av:Av(z,theta,d),

      \ \ \ \ return(Av)

      \ \ \ \ )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|input>
      Avx(alpha,a):=block(<next-line>[x,Av],<next-line>x:matrix([1],[0],[0]),<next-line>Av:Av(x,alpha,a),<next-line>return(Av)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      Qij(thetai,di,alphai,ai):=block(<next-line>[Avz,Avx,Q],<next-line>Avz:Avz(thetai,di),<next-line>Avx:Avx(alphai,ai),<next-line>Q:Avz.Avx,<next-line>return(Q)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      DH(M):=block(

      [dim, Q:ident(4), Qlist:[], idx:1, i:1, term, term1,Qm:[]],

      <nbsp> <nbsp> dim:size(M),

      \ \ \ \ /*Calcolo matrici di trasformazione*/

      <nbsp> <nbsp> for i:1 thru dim[1] do(

      <nbsp> <nbsp> Qlist:append(Qlist,[Qij(M[i][1],M[i][2],M[i][3],M[i][4])])

      <nbsp> <nbsp> ),

      <nbsp> <nbsp> while not emptyp(Qlist) do(

      <nbsp> <nbsp> <nbsp> <nbsp> if i=dim[1] then(

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> idx:-1

      <nbsp> <nbsp> <nbsp> <nbsp> ),

      <nbsp> <nbsp> <nbsp> <nbsp> if (M[i][3]=0 or M[i][3] = %pi) and
      i#dim[1] then(

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> term:pop(Qlist),

      \ \ \ \ \ \ \ \ \ \ \ \ if i=1 then Qm:append(Qm,[term]),

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> if emptyp(Qlist) then(

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp>
      Q:trigreduce(Q.term)

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> )

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> else(

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp>
      term1:pop(Qlist),

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp>
      Q:Q.trigreduce(term.term1),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ i:i+2

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> )

      <nbsp> <nbsp> <nbsp> <nbsp> )else(

      <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp> <nbsp>
      Q:Q.pop(Qlist),i:i+1

      <nbsp> <nbsp> <nbsp> <nbsp> ),

      <nbsp> <nbsp> <nbsp> <nbsp> Qm:append(Qm,[Q])

      <nbsp> <nbsp> ),

      <nbsp> <nbsp> return([Q,Qm])

      )$
    </input>

    <\textput>
      <strong|2 DOF Planare>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      dueDof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      rename(DH(dueDof)[1],0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|21>>|<cell|-s<rsub|21>>|<cell|0>|<cell|L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|21>>|<cell|c<rsub|21>>|<cell|0>|<cell|L<rsub|2>*s<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      DH(dueDof)[2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <strong|Robot 3DOF RRR>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      treDof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]],[q[3],0,0,L[3]]];
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,L<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      rename(DH(treDof)[1],0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>>|<cell|-c<rsub|3>*s<rsub|21>-s<rsub|3>*c<rsub|21>>|<cell|0>|<cell|-L<rsub|3>*s<rsub|3>*s<rsub|21>+L<rsub|3>*c<rsub|3>*c<rsub|21>+L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>>|<cell|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>>|<cell|0>|<cell|L<rsub|3>*c<rsub|3>*s<rsub|21>+L<rsub|2>*s<rsub|21>+L<rsub|3>*s<rsub|3>*c<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      DH(treDof)[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>*cos <around*|(|q<rsub|3>|)>-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*sin
      <around*|(|q<rsub|3>|)>>|<cell|-cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>*sin <around*|(|q<rsub|3>|)>-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|-L<rsub|3>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*sin
      <around*|(|q<rsub|3>|)>+L<rsub|3>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>|)>+L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>*sin <around*|(|q<rsub|3>|)>+sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>|)>>|<cell|cos <around*|(|q<rsub|2>+q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>|)>-sin <around*|(|q<rsub|2>+q<rsub|1>|)>*sin
      <around*|(|q<rsub|3>|)>>|<cell|0>|<cell|L<rsub|3>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>*sin
      <around*|(|q<rsub|3>|)>+L<rsub|3>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*cos
      <around*|(|q<rsub|3>|)>+L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cartesiano>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      cart:[[0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      rename(DH(cart)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      DH(cart)[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cilindrico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      cil:[[q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,0|]>,<around*|[|0,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      rename(DH(cil)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot SCARA>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      scara:[[q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,D<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      rename(DH(scara)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|21>>|<cell|-s<rsub|21>>|<cell|0>|<cell|D<rsub|2>*c<rsub|21>+D<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|21>>|<cell|c<rsub|21>>|<cell|0>|<cell|D<rsub|2>*s<rsub|21>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      DH(scara)[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|D<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+D<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Sferico (di primo tipo)>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      sfer:[[q[1],L[1],%pi/2,0],[q[2],0,%pi/2,L[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,<frac|\<pi\>|2>,L<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      rename(DH(sfer)[1],0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Sferico (di secondo tipo) - Stanford>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      stanf:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      stanf1:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[-%pi/2,q[3],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      rename(DH(stanf)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      rename(DH(stanf1)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|-c<rsub|1>>|<cell|s<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|0>|<cell|-s<rsub|2>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Antropomorfo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      antrop:[[q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,D<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      rename(DH(antrop)[1],0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|32>>|<cell|-c<rsub|1>*s<rsub|32>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*<around*|(|D<rsub|3>*c<rsub|32>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|s<rsub|1>*c<rsub|32>>|<cell|-s<rsub|1>*s<rsub|32>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*<around*|(|D<rsub|3>*c<rsub|32>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|s<rsub|32>>|<cell|c<rsub|32>>|<cell|0>|<cell|D<rsub|3>*s<rsub|32>+D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Polso Sferico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      polsferico:[[q[1],0,-%pi/2,0],[q[2],0,%pi/2,0],[q[3],L[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><around*|[|<around*|[|q<rsub|1>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|3>,L<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      rename(DH(polsferico)[1],0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>*c<rsub|3>-s<rsub|1>*s<rsub|3>>|<cell|-c<rsub|1>*c<rsub|2>*s<rsub|3>-s<rsub|1>*c<rsub|3>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|c<rsub|1>*s<rsub|3>+s<rsub|1>*c<rsub|2>*c<rsub|3>>|<cell|c<rsub|1>*c<rsub|3>-s<rsub|1>*c<rsub|2>*s<rsub|3>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|-s<rsub|2>*c<rsub|3>>|<cell|s<rsub|2>*s<rsub|3>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*L<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|PUMA>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      puma:[[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0],

      \ \ \ \ \ [q[4],L[4],-%pi/2,0],

      \ \ \ \ \ [q[5],0,%pi/2,0],

      \ \ \ \ \ [q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|4>,L<rsub|4>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      expand(rename(DH(puma)[1],0))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><matrix|<tformat|<table|<row|<cell|-c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|32>-c<rsub|1>*s<rsub|4>*s<rsub|6>*c<rsub|32>+c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>*c<rsub|32>-s<rsub|1>*c<rsub|4>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|32>-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>*c<rsub|32>-c<rsub|1>*s<rsub|4>*c<rsub|6>*c<rsub|32>+s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|32>+c<rsub|1>*L<rsub|4>*s<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|-s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|6>*c<rsub|32>+s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>*c<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|32>-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>*c<rsub|32>-s<rsub|1>*s<rsub|4>*c<rsub|6>*c<rsub|32>-c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|32>+s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|32>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|32>+s<rsub|1>*L<rsub|4>*s<rsub|32>+s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|32>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|4>*s<rsub|6>*s<rsub|32>-c<rsub|4>*c<rsub|5>*c<rsub|6>*s<rsub|32>-s<rsub|5>*c<rsub|6>*c<rsub|32>>|<cell|c<rsub|4>*c<rsub|5>*s<rsub|6>*s<rsub|32>+s<rsub|4>*c<rsub|6>*s<rsub|32>+s<rsub|5>*s<rsub|6>*c<rsub|32>>|<cell|c<rsub|5>*c<rsub|32>-c<rsub|4>*s<rsub|5>*s<rsub|32>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|32>+c<rsub|5>*L<rsub|6>*c<rsub|32>+L<rsub|4>*c<rsub|32>-D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Standford Completo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      standfordC:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[-%pi/2,q[3],0,0],[q[4],0,-%pi/2,0],[q[5],0,%pi/2,0],[q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|3>,0,0|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      expand(rename(DH(standfordC)[1],0))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><matrix|<tformat|<table|<row|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|2>*s<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|4>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|c<rsub|1>*s<rsub|4>*s<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|4>*s<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*s<rsub|2>*s<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>-c<rsub|1>*c<rsub|4>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|6>-c<rsub|2>*s<rsub|5>*c<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|2>*s<rsub|5>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|2>*c<rsub|5>-s<rsub|2>*s<rsub|4>*s<rsub|5>>|<cell|-s<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|2>*c<rsub|5>*L<rsub|6>+c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Tre DoF Rotoidale + Polso Sferico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      tredofPolso:[[q[1],0,0,L[1]],[q[2],0,0,L[2]],[q[3],0,%pi/2,L[3]],[q[4],0,-%pi/2,0],[q[5],0,%pi/2,0],[q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,L<rsub|3>|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>59) >
    <|unfolded-io>
      DHtredofPolso:rename(DH(tredofPolso)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o59>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|6>*<around*|(|c<rsub|4>*c<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>+s<rsub|5>*<around*|(|-c<rsub|3>*s<rsub|21>-s<rsub|3>*c<rsub|21>|)>|)>-s<rsub|4>*s<rsub|6>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>>|<cell|-s<rsub|6>*<around*|(|c<rsub|4>*c<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>+s<rsub|5>*<around*|(|-c<rsub|3>*s<rsub|21>-s<rsub|3>*c<rsub|21>|)>|)>-s<rsub|4>*c<rsub|6>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>>|<cell|c<rsub|4>*s<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>-c<rsub|5>*<around*|(|-c<rsub|3>*s<rsub|21>-s<rsub|3>*c<rsub|21>|)>>|<cell|L<rsub|6>*<around*|(|c<rsub|4>*s<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>-c<rsub|5>*<around*|(|-c<rsub|3>*s<rsub|21>-s<rsub|3>*c<rsub|21>|)>|)>-L<rsub|3>*s<rsub|3>*s<rsub|21>+L<rsub|3>*c<rsub|3>*c<rsub|21>+L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|6>*<around*|(|s<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>+c<rsub|4>*c<rsub|5>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>|)>-s<rsub|4>*s<rsub|6>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>>|<cell|-s<rsub|6>*<around*|(|s<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>+c<rsub|4>*c<rsub|5>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>|)>-s<rsub|4>*c<rsub|6>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>>|<cell|c<rsub|4>*s<rsub|5>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>-c<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>>|<cell|L<rsub|6>*<around*|(|c<rsub|4>*s<rsub|5>*<around*|(|c<rsub|3>*s<rsub|21>+s<rsub|3>*c<rsub|21>|)>-c<rsub|5>*<around*|(|c<rsub|3>*c<rsub|21>-s<rsub|3>*s<rsub|21>|)>|)>+L<rsub|3>*c<rsub|3>*s<rsub|21>+L<rsub|2>*s<rsub|21>+L<rsub|3>*s<rsub|3>*c<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>|<cell|s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Cartesiano+Polso Sferico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>60) >
    <|unfolded-io>
      cartPolso:[[0,q[1],-(%pi/2),0],[-(%pi/2),q[2],-(%pi/2),0],[0,q[3],0,0],[q[4],0,-(%pi/2),0],[q[5],0,(%pi/2),0],[q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o60>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>61) >
    <|unfolded-io>
      DHcartPolso:rename(DH(cartPolso)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o61>)
      >><matrix|<tformat|<table|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>|<cell|c<rsub|5>*L<rsub|6>+q<rsub|3>>>|<row|<cell|-c<rsub|4>*s<rsub|6>-s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|4>*s<rsub|5>>|<cell|q<rsub|2>-s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>+q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cilindrico+Polso>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>66) >
    <|unfolded-io>
      cilPolso:[[q[1],0,0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0],[q[4],0,-%pi/2,0],[q[5],0,%pi/2,0],[q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o66>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,0|]>,<around*|[|0,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>67) >
    <|unfolded-io>
      DHcilPolso:rename(DH(cilPolso)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o67>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|s<rsub|1>*s<rsub|5>+c<rsub|1>*c<rsub|4>*c<rsub|5>|)>*c<rsub|6>-c<rsub|1>*s<rsub|4>*s<rsub|6>>|<cell|-<around*|(|s<rsub|1>*s<rsub|5>+c<rsub|1>*c<rsub|4>*c<rsub|5>|)>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|4>*s<rsub|5>-s<rsub|1>*c<rsub|5>>|<cell|<around*|(|c<rsub|1>*c<rsub|4>*s<rsub|5>-s<rsub|1>*c<rsub|5>|)>*L<rsub|6>-s<rsub|1>*q<rsub|3>>>|<row|<cell|<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>-c<rsub|1>*s<rsub|5>|)>*c<rsub|6>-s<rsub|1>*s<rsub|4>*s<rsub|6>>|<cell|-<around*|(|s<rsub|1>*c<rsub|4>*c<rsub|5>-c<rsub|1>*s<rsub|5>|)>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|5>>|<cell|<around*|(|s<rsub|1>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|5>|)>*L<rsub|6>+c<rsub|1>*q<rsub|3>>>|<row|<cell|-c<rsub|4>*s<rsub|6>-s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|4>*s<rsub|5>>|<cell|q<rsub|2>-s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Robot Scara + Polso>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>68) >
    <|input>
      \;
    </input>
  </session>

  \;

  <math|>

  \;
</body>

<\initial>
  <\collection>
    <associate|info-flag|none>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a0>
    <associate|page-width|auto>
  </collection>
</initial>