<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Cinematica Inversa>>

  <\session|maxima|default>
    <\textput>
      <strong|Cinematica Inversa 2DOF>
    </textput>
  </session>

  <\session|maxima|default>
    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      dueDof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]]];
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      assume(L[1]\<gtr\>0,L[2]\<gtr\>0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|L<rsub|1>\<gtr\>0,L<rsub|2>\<gtr\>0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      diretta2Dof:rename(DH(dueDof),1);
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|-c<rsub|1>*s<rsub|2>-s<rsub|1>*c<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      d:submatrix(4,diretta2Dof,1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>>>|<row|<cell|L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      matchdeclare(ww,lambda([x],is(x=s)),www,lambda([x],is(x=c)),qq,integerp)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-bf|done>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      defrule(r7,ww[qq]^(2)+www[qq]^2,1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><with|math-font-family|rm|r7>:<math-up|www><rsub|<math-up|qq>><rsup|2>+<math-up|ww><rsub|<math-up|qq>><rsup|2>\<rightarrow\>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      b:matrix([x],[y],[z])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      [eq[1],eq[2],eq[3]]:map("=",[d[1,1],d[2,1],
      d[3,1]],[b[1,1],b[2,1],b[3,1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>=x,L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>=y,0=z|]>>>
    </unfolded-io>

    <\textput>
      <strong|Spazio Operativo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      opsp:expand(eq[1]^2+eq[2]^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >>s<rsub|1><rsup|2>*L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+c<rsub|1><rsup|2>*L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+s<rsub|1><rsup|2>*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+c<rsub|1><rsup|2>*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*s<rsub|1><rsup|2>*L<rsub|2>*c<rsub|2>+2*L<rsub|1>*c<rsub|1><rsup|2>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>*s<rsub|1><rsup|2>+L<rsub|1><rsup|2>*c<rsub|1><rsup|2>=y<rsup|2>+x<rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      opsp:facsum(opsp,L[1],L[2],x,y)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*L<rsub|2><rsup|2>*<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>+2*L<rsub|1>*<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>*<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>|)>=y<rsup|2>+x<rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      opsp:applyb1(opsp,r7)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>=y<rsup|2>+x<rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      C[2]:map(rhs,solve(opsp,c[2]))[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      assume(C[2]\<less\>=1 and C[2]\<gtr\>=-1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|L<rsub|1>*L<rsub|2>>\<leq\>2,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|L<rsub|1>*L<rsub|2>>\<geq\>-2|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      S[2,p]:sqrt(1-C[2]^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><sqrt|1-<frac|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S[2,m]:-S[2,p]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>-<sqrt|1-<frac|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      Q[2,p]:atan2(S[2,p],C[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      ><with|font-family|rm|atan2>><around*|(|<sqrt|1-<frac|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      Q[2,m]:atan2(S[2,m],C[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>-<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>,<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      eq[1]:facsum(expand(eq[1]),c[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>c<rsub|1>*<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>-s<rsub|1>*L<rsub|2>*s<rsub|2>=x>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq[2]:facsum(expand(eq[2]),s[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>c<rsub|1>*L<rsub|2>*s<rsub|2>+s<rsub|1>*<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>=y>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      solve([eq[1],eq[2]],[c[1],s[1]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|c<rsub|1>=<frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>,s<rsub|1>=-<frac|-L<rsub|2>*c<rsub|2>*y-L<rsub|1>*y+L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      [C[1],SS[1]]:map(rhs,solve([eq[1],eq[2]],[c[1],s[1]])[1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|<frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>,-<frac|-L<rsub|2>*c<rsub|2>*y-L<rsub|1>*y+L<rsub|2>*s<rsub|2>*x|L<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      [C[1],SS[1]]:facsum(applyb1(facsum([C[1],SS[1]],L[1],L[2]),r7),x,y)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<frac|L<rsub|2>*s<rsub|2>*y+<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*x|2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,<frac|<around*|(|L<rsub|2>*c<rsub|2>+L<rsub|1>|)>*y-L<rsub|2>*s<rsub|2>*x|2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      [C[1],SS[1]]:psubst([L[2]*c[2]+L[1]=A,

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ L[2]*s[2]*y=B*y,
      L[2]*s[2]*x=B*x, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ applyb1(facsum(expand((L[2]*c[2]+L[1])^2+(L[2]*s[2])^2),L[2]),r7)=A^2+B^2],[C[1],SS[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|<frac|B*y+A*x|B<rsup|2>+A<rsup|2>>,<frac|A*y-B*x|B<rsup|2>+A<rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      Q[1,o]:atan2(SS[1],C[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      ><with|font-family|rm|atan2>><around*|(|<frac|A*y-B*x|B<rsup|2>+A<rsup|2>>,<frac|B*y+A*x|B<rsup|2>+A<rsup|2>>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|input>
      \;
    </input>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>