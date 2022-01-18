<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\input|Procedura per il calcolo della cinematica diretta >
      \;
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
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
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      Avz(theta,d):=block(

      \ \ \ \ [z, Av],

      \ \ \ \ z:matrix([0],[0],[1]),

      \ \ \ \ Av:Av(z,theta,d),

      \ \ \ \ return(Av)

      \ \ \ \ )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      Avx(alpha,a):=block(<next-line>[x,Av],<next-line>x:matrix([1],[0],[0]),<next-line>Av:Av(x,alpha,a),<next-line>return(Av)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Qij(thetai,di,alphai,ai):=block(<next-line>[Avz,Avx,Q],<next-line>Avz:Avz(thetai,di),<next-line>Avx:Avx(alphai,ai),<next-line>Q:Avz.Avx,<next-line>return(Q)<next-line>)$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
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

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if M[i][3]=0 and i#dim[1] then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ term:pop(Qlist),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if emptyp(Qlist) then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Q:trigreduce(Q.term)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )else(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ term1:pop(Qlist),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Q:Q.trigreduce(term.term1)),i:i+1

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else(Q:Q.pop(Qlist),i:i+1)

      \ \ \ \ \ \ \ \ \ \ \ \ \ ),return(Q)

      \ \ \ \ \ \ \ \ \ \ \ \ \ )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><math-up|DH><around*|(|M|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|dim>,Q:<math-up|ident><around*|(|4|)>,<math-up|Qlist>:<around*|[||]>,<math-up|idx>:1,i:1,<math-up|term>,<with|math-font-family|rm|term1>|]>,<math-up|dim>:<math-up|size><around*|(|M|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|dim><rsub|1><space|0.27em><math-bf|do><space|0.27em><math-up|Qlist>:<math-up|append><around*|(|<math-up|Qlist>,<around*|[|<math-up|Qij><around*|(|<around*|(|M<rsub|i>|)><rsub|1>,<around*|(|M<rsub|i>|)><rsub|2>,<around*|(|M<rsub|i>|)><rsub|3>,<around*|(|M<rsub|i>|)><rsub|4>|)>|]>|)>,<math-bf|while><space|0.27em>\<neg\><math-up|emptyp><around*|(|<math-up|Qlist>|)><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em>i=<math-up|dim><rsub|1><space|0.27em><math-bf|then><space|0.27em><math-up|idx>:-1,<math-bf|if><space|0.27em><around*|(|M<rsub|i>|)><rsub|3>=0\<wedge\>i\<neq\><math-up|dim><rsub|1><space|0.27em><math-bf|then><space|0.27em><around*|(|<math-up|term>:<math-up|pop><around*|(|<math-up|Qlist>|)>,<math-bf|if><space|0.27em><math-up|emptyp><around*|(|<math-up|Qlist>|)><space|0.27em><math-bf|then><space|0.27em>Q:<math-up|trigreduce><around*|(|Q\<cdot\><math-up|term>|)><space|0.27em><math-bf|else><space|0.27em><around*|(|<with|math-font-family|rm|term1>:<math-up|pop><around*|(|<math-up|Qlist>|)>,Q:Q\<cdot\><math-up|trigreduce><around*|(|<math-up|term>\<cdot\><with|math-font-family|rm|term1>|)>|)>,i:i+1|)><space|0.27em><math-bf|else><space|0.27em><around*|(|Q:Q\<cdot\><math-up|pop><around*|(|<math-up|Qlist>|)>,i:i+1|)>|)>,<math-up|return><around*|(|Q|)>|)>>>
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
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
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
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,L<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      rename(DH(treDof))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
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
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      puma:[[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0],

      \ \ \ \ \ [q[4],L[4],-%pi/2,0],

      \ \ \ \ \ [q[5],0,%pi/2,0],

      \ \ \ \ \ [q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|4>,L<rsub|4>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      expand(rename(DH(puma)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|-c<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|32>-c<rsub|1>*s<rsub|4>*s<rsub|6>*c<rsub|32>+c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>*c<rsub|32>-s<rsub|1>*c<rsub|4>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|32>-c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>*c<rsub|32>-c<rsub|1>*s<rsub|4>*c<rsub|6>*c<rsub|32>+s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|5>*s<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|c<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|32>+c<rsub|1>*L<rsub|4>*s<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|-s<rsub|1>*s<rsub|5>*c<rsub|6>*s<rsub|32>-s<rsub|1>*s<rsub|4>*s<rsub|6>*c<rsub|32>+s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>*c<rsub|32>+c<rsub|1>*c<rsub|4>*s<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*s<rsub|5>*s<rsub|6>*s<rsub|32>-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>*c<rsub|32>-s<rsub|1>*s<rsub|4>*c<rsub|6>*c<rsub|32>-c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|5>*s<rsub|32>+s<rsub|1>*c<rsub|4>*s<rsub|5>*c<rsub|32>+c<rsub|1>*s<rsub|4>*s<rsub|5>>|<cell|s<rsub|1>*c<rsub|5>*L<rsub|6>*s<rsub|32>+s<rsub|1>*L<rsub|4>*s<rsub|32>+s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>*c<rsub|32>+c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|4>*s<rsub|6>*s<rsub|32>-c<rsub|4>*c<rsub|5>*c<rsub|6>*s<rsub|32>-s<rsub|5>*c<rsub|6>*c<rsub|32>>|<cell|c<rsub|4>*c<rsub|5>*s<rsub|6>*s<rsub|32>+s<rsub|4>*c<rsub|6>*s<rsub|32>+s<rsub|5>*s<rsub|6>*c<rsub|32>>|<cell|c<rsub|5>*c<rsub|32>-c<rsub|4>*s<rsub|5>*s<rsub|32>>|<cell|-c<rsub|4>*s<rsub|5>*L<rsub|6>*s<rsub|32>+c<rsub|5>*L<rsub|6>*c<rsub|32>+L<rsub|4>*c<rsub|32>-D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Standford Completo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      standfordC:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[-%pi/2,q[3],0,0],[q[4],0,-%pi/2,0],[q[5],0,%pi/2,0],[q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|3>,0,0|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      expand(rename(DH(standfordC)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><matrix|<tformat|<table|<row|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|4>*s<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|2>*s<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|4>*s<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|c<rsub|1>*s<rsub|4>*s<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|4>*s<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*s<rsub|2>*s<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>-c<rsub|1>*c<rsub|4>*s<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|5>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>*c<rsub|4>*s<rsub|6>-c<rsub|2>*s<rsub|5>*c<rsub|6>-s<rsub|2>*s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|2>*s<rsub|5>*s<rsub|6>+s<rsub|2>*s<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|2>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|2>*c<rsub|5>-s<rsub|2>*s<rsub|4>*s<rsub|5>>|<cell|-s<rsub|2>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|2>*c<rsub|5>*L<rsub|6>+c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Cartesiano+Polso Sferico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      cartPolso:dh
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><math-up|dh>>>
    </unfolded-io>

    <\textput>
      <\equation*>
        d<rsub|36>=
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      disaccoppiamento(Q36):=block(<next-line>[d0, d1, R36, d36, sist,
      tdx],<next-line>d0:matrix([a0],[b0],[c0]),d1:matrix([a1],[b1],[c1]),<next-line>R36:ident(3),<next-line>for
      i:1 thru 3 do(<next-line>for j:1 thru 3
      do(<next-line>R36[i][j]:Q36[i][j]<next-line>)<next-line>),<next-line>d36:matrix([Q36[1][4]],[Q36[2][4]],[Q36[3][4]]),<next-line>tdx:R36.d1,<next-line>sist:[d36[1][1]=tdx[1][1],<next-line>d36[2][1]=tdx[2][1],<next-line>d36[3][1]=tdx[3][1]],<next-line>d1:map(rhs,
      solve(sist, [a1,b1,c1])[1]),<next-line>d1:matrix([d1[1]],[d1[2]],[d1[3]]),<next-line>if(d1#zeromatrix(3,1))
      then (<next-line>d0:zeromatrix(3,1),<next-line>print(d[0],"=",d0,
      d[1],"=",d1),<next-line>print("La struttura portante è disaccoppiata
      dal polso"),<next-line>return(true)<next-line>)else(<next-line>print("La
      struttura portante non è disaccoppiata dal
      polso"),<next-line>return(false)))$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|unfolded-io>
      cartPolso:[[0,q[1],-(%pi/2),0],[-(%pi/2),q[2],-(%pi/2),0],[0,q[3],0,0],[q[4],0,-(%pi/2),0],[q[5],0,(%pi/2),0],[q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o48>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>,<around*|[|q<rsub|4>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      DHcartPolso:rename(DH(cartPolso))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><matrix|<tformat|<table|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>|<cell|c<rsub|5>*L<rsub|6>+q<rsub|3>>>|<row|<cell|-c<rsub|4>*s<rsub|6>-s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|4>*s<rsub|5>>|<cell|q<rsub|2>-s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>+q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      <strong|Robot Cilindrico+Polso>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      QQQ:[[q[4],L[4],%pi/2,0],[q[5],0,-%pi/2,0],[q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<around*|[|q<rsub|4>,L<rsub|4>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      sfrrr:DH(QQQ)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|-cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>|<cell|-L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>+sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>|<cell|-L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>|<cell|-sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|cos
      <around*|(|q<rsub|5>|)>>|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|4>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      trigsimp(disaccoppiamento(sfrrr))
    <|unfolded-io>
      <math|<with|math-display|true|d<rsub|0><text|=
      ><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>d<rsub|1><text|=
      ><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>|<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*sin
      <around*|(|q<rsub|6>|)><rsup|2>+<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*cos
      <around*|(|q<rsub|6>|)><rsup|2>>>>|<row|<cell|-<frac|L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>|<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*sin
      <around*|(|q<rsub|6>|)><rsup|2>+<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*cos
      <around*|(|q<rsub|6>|)><rsup|2>>>>|<row|<cell|<frac|L<rsub|6>*sin
      <around*|(|q<rsub|5>|)><rsup|2>+L<rsub|6>*cos
      <around*|(|q<rsub|5>|)><rsup|2>+L<rsub|4>*cos
      <around*|(|q<rsub|5>|)>|sin <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|La struttura portante è
      disaccoppiata dal polso >>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      aaa:matrix([((L[4]*sin (q[5])*cos (q[6]))/((sin (q[5])^2+cos
      (q[5])^2)*sin (q[6])^2+(sin (q[5])^2+cos (q[5])^2)*cos (q[6])^2))],
      [-((L[4]*sin (q[5])*sin (q[6]))/((sin (q[5])^2+cos (q[5])^2)*sin
      (q[6])^2+(sin (q[5])^2+cos (q[5])^2)*cos (q[6])^2))], [((L[6]*sin
      (q[5])^2+L[6]*cos (q[5])^2+L[4]*cos (q[5]))/(sin (q[5])^2+cos
      (q[5])^2))])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>|<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*sin
      <around*|(|q<rsub|6>|)><rsup|2>+<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*cos
      <around*|(|q<rsub|6>|)><rsup|2>>>>|<row|<cell|-<frac|L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>|<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*sin
      <around*|(|q<rsub|6>|)><rsup|2>+<around*|(|sin
      <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>|)>*cos
      <around*|(|q<rsub|6>|)><rsup|2>>>>|<row|<cell|<frac|L<rsub|6>*sin
      <around*|(|q<rsub|5>|)><rsup|2>+L<rsub|6>*cos
      <around*|(|q<rsub|5>|)><rsup|2>+L<rsub|4>*cos
      <around*|(|q<rsub|5>|)>|sin <around*|(|q<rsub|5>|)><rsup|2>+cos
      <around*|(|q<rsub|5>|)><rsup|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      trigsimp(aaa)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><matrix|<tformat|<table|<row|<cell|L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>>|<row|<cell|-L<rsub|4>*sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>>>|<row|<cell|L<rsub|4>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|6>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      R36:submatrix(4,sfrrr,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|-cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|6>|)>+sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>|<cell|cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|-sin <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|sin <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|-sin <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|5>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      d36:submatrix(4,sfrrr,1,2,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|-L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|-L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      d0:matrix([a[0]],[b[0]],[c[0]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|a<rsub|0>>>|<row|<cell|b<rsub|0>>>|<row|<cell|c<rsub|0>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      d1:matrix([a[1]],[b[1]],[c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|a<rsub|1>>>|<row|<cell|b<rsub|1>>>|<row|<cell|c<rsub|1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      rss:rename(R36.d1+d0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|b<rsub|1>*<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>+a<rsub|1>*<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>-c<rsub|1>*c<rsub|4>*s<rsub|5>+a<rsub|0>>>|<row|<cell|b<rsub|1>*<around*|(|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>|)>+a<rsub|1>*<around*|(|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>|)>-c<rsub|1>*s<rsub|4>*s<rsub|5>+b<rsub|0>>>|<row|<cell|-b<rsub|1>*s<rsub|5>*s<rsub|6>+a<rsub|1>*s<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|5>+c<rsub|0>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      b[1]*(-c[4]*c[5]*s[6]-s[4]*c[6])+a[1]*(c[4]*c[5]*c[6]-s[4]*s[6])-c[1]*c[4]*s[5]+a[0]=-rename(L[6]*cos
      (q[4])*sin (q[5]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>b<rsub|1>*<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>+a<rsub|1>*<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>-c<rsub|1>*c<rsub|4>*s<rsub|5>+a<rsub|0>=-c<rsub|4>*s<rsub|5>*L<rsub|6>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      is(psubst([a[1]=0,b[1]=0,c[1]=L[6],c[0]=L[4],a[0]=0,b[0]=0],R36.d1+d0)=d36)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      trigsimp(R36)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|-cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|6>|)>+sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>|<cell|cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|-sin <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|sin <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|-sin <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|5>|)>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
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
    <associate|page-medium|paper>
  </collection>
</initial>