<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|Robot Cartesiano>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      cart:[[0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dh:rename(DH(cart),0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      flatten(solve(getEq(dh),[q[1],q[2],q[3]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|q<rsub|1>=Z,q<rsub|2>=Y,q<rsub|3>=X|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
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