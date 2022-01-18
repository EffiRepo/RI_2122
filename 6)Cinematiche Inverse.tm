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
      diretta2Dof:rename(DH(dueDof));
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|21>>|<cell|-s<rsub|21>>|<cell|0>|<cell|L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|21>>|<cell|c<rsub|21>>|<cell|0>|<cell|L<rsub|2>*s<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      d:submatrix(4,diretta2Dof,1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|L<rsub|2>*c<rsub|21>+L<rsub|1>*c<rsub|1>>>|<row|<cell|L<rsub|2>*s<rsub|21>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
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