<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\input|Procedura per il calcolo della cinematica diretta >
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
      DH(M):=block([dim,Q:ident(4),Qlist:[],idx:1,i:1,term,term1],

      \ \ \ \ \ \ \ \ \ \ \ \ \ dim:size(M),

      \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Qlist:append(Qlist,[Qij(M[i][1],M[i][2],M[i][3],M[i][4])])

      \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ while not emptyp(Qlist) do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if i=dim[1] then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ idx:-1

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if (M[i][1]#0 and M[i+idx][1]#0) and

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (M[i][3]=0 and M[i+idx][3]=0)then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ term:pop(Qlist),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if emptyp(Qlist) then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Q:trigreduce(Q.term)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )else(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ term1:pop(Qlist),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Q:Q.trigreduce(term.term1)),i:i+2

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else(Q:Q.pop(Qlist),i:i+1)

      \ \ \ \ \ \ \ \ \ \ \ \ \ ),return(Q)

      \ \ \ \ \ \ \ \ \ \ \ \ \ )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-up|DH><around*|(|M|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|dim>,Q:<math-up|ident><around*|(|4|)>,<math-up|Qlist>:<around*|[||]>,<math-up|idx>:1,i:1,<math-up|term>,<with|math-font-family|rm|term1>|]>,<math-up|dim>:<math-up|size><around*|(|M|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|dim><rsub|1><space|0.27em><math-bf|do><space|0.27em><math-up|Qlist>:<math-up|append><around*|(|<math-up|Qlist>,<around*|[|<math-up|Qij><around*|(|<around*|(|M<rsub|i>|)><rsub|1>,<around*|(|M<rsub|i>|)><rsub|2>,<around*|(|M<rsub|i>|)><rsub|3>,<around*|(|M<rsub|i>|)><rsub|4>|)>|]>|)>,<math-bf|while><space|0.27em>\<neg\><math-up|emptyp><around*|(|<math-up|Qlist>|)><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em>i=<math-up|dim><rsub|1><space|0.27em><math-bf|then><space|0.27em><math-up|idx>:-1,<math-bf|if><space|0.27em><around*|(|M<rsub|i>|)><rsub|1>\<neq\>0\<wedge\><around*|(|M<rsub|i+<math-up|idx>>|)><rsub|1>\<neq\>0\<wedge\><around*|(|<around*|(|M<rsub|i>|)><rsub|3>=0\<wedge\><around*|(|M<rsub|i+<math-up|idx>>|)><rsub|3>=0|)><space|0.27em><math-bf|then><space|0.27em><around*|(|<math-up|term>:<math-up|pop><around*|(|<math-up|Qlist>|)>,<math-bf|if><space|0.27em><math-up|emptyp><around*|(|<math-up|Qlist>|)><space|0.27em><math-bf|then><space|0.27em>Q:<math-up|trigreduce><around*|(|Q\<cdot\><math-up|term>|)><space|0.27em><math-bf|else><space|0.27em><around*|(|<with|math-font-family|rm|term1>:<math-up|pop><around*|(|<math-up|Qlist>|)>,Q:Q\<cdot\><math-up|trigreduce><around*|(|<math-up|term>\<cdot\><with|math-font-family|rm|term1>|)>|)>,i:i+2|)><space|0.27em><math-bf|else><space|0.27em><around*|(|Q:Q\<cdot\><math-up|pop><around*|(|<math-up|Qlist>|)>,i:i+1|)>|)>,<math-up|return><around*|(|Q|)>|)>>>
    </unfolded-io>

    <\textput>
      <strong|2 DOF Planare>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      dueDof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      rename(DH(dueDof))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|21>>|<cell|-s<rsub|21>>|<cell|0>|<cell|L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|21>>|<cell|c<rsub|21>>|<cell|0>|<cell|L<rsub|2>*s<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot 3DOF>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      treDof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]],[q[3],0,0,L[3]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,L<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      rename(DH(treDof))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|123>>|<cell|-s<rsub|123>>|<cell|0>|<cell|L<rsub|3>*c<rsub|123>+L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|123>>|<cell|c<rsub|123>>|<cell|0>|<cell|L<rsub|3>*s<rsub|123>+L<rsub|2>*s<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cartesiano>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      cart:[[0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      rename(DH(cart))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cilindrico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      cil:[[q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,0|]>,<around*|[|0,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      rename(DH(cil))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot SCARA>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      scara:[[q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,D<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      rename(DH(scara))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|21>>|<cell|-s<rsub|21>>|<cell|0>|<cell|D<rsub|2>*c<rsub|21>+D<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|21>>|<cell|c<rsub|21>>|<cell|0>|<cell|D<rsub|2>*s<rsub|21>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Sferico (di primo tipo)>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      sfer:[[q[1],L[1],%pi/2,0],[q[2],0,%pi/2,L[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,<frac|\<pi\>|2>,L<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      rename(DH(sfer))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Sferico (di secondo tipo) - Stanford>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      stanf:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      stanf1:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[-%pi/2,q[3],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      rename(DH(stanf))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      rename(DH(stanf1))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|-c<rsub|1>>|<cell|s<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|0>|<cell|-s<rsub|2>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Antropomorfo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      antrop:[[q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,D<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      rename(DH(antrop))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|32>>|<cell|-c<rsub|1>*s<rsub|32>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*<around*|(|D<rsub|3>*c<rsub|32>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|s<rsub|1>*c<rsub|32>>|<cell|-s<rsub|1>*s<rsub|32>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*<around*|(|D<rsub|3>*c<rsub|32>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|s<rsub|32>>|<cell|c<rsub|32>>|<cell|0>|<cell|D<rsub|3>*s<rsub|32>+D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Polso Sferico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      polsferico:[[q[1],0,-%pi/2,0],[q[2],0,%pi/2,0],[q[3],L[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|<around*|[|q<rsub|1>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|3>,L<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      rename(DH(polsferico))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>*c<rsub|3>-s<rsub|1>*s<rsub|3>>|<cell|-c<rsub|1>*c<rsub|2>*s<rsub|3>-s<rsub|1>*c<rsub|3>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|c<rsub|1>*s<rsub|3>+s<rsub|1>*c<rsub|2>*c<rsub|3>>|<cell|c<rsub|1>*c<rsub|3>-s<rsub|1>*c<rsub|2>*s<rsub|3>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*L<rsub|3>>>|<row|<cell|-s<rsub|2>*c<rsub|3>>|<cell|s<rsub|2>*s<rsub|3>>|<cell|c<rsub|2>>|<cell|c<rsub|2>*L<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|PUMA>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      puma:[[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0],

      \ \ \ \ \ [q[4],L[4],-%pi/2,0],

      \ \ \ \ \ [q[5],0,%pi/2,0],

      \ \ \ \ \ [q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|4>,L<rsub|4>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>