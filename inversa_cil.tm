<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|><with|font-series|bold|Robot Cilindrico>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      cil:[[q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,0|]>,<around*|[|0,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dh:rename(DH(cil),0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:flatten([getEq(dh),c[1]^2+s[1]^2-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|X+s<rsub|1>*q<rsub|3>=0,Y-c<rsub|1>*q<rsub|3>=0,Z-q<rsub|2>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Eliminiamo le variabili trigonometriche e troviamo un espressione in
      <math|q<rsub|3>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      p:eliminate([eq[1],eq[2],eq[4]],[c[1],s[1]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>q<rsub|3><rsup|2>*<around*|(|Y<rsup|2>+X<rsup|2>-q<rsub|3><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      q3:map(rhs,solve(part(p,2),q[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|-<sqrt|Y<rsup|2>+X<rsup|2>>,<sqrt|Y<rsup|2>+X<rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      <math|q<rsub|2>> è univocamente determinato da:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      q2:map(rhs,solve(eq[3],q[2]))[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>Z-L<rsub|1>>>
    </unfolded-io>

    <\textput>
      Sostituiamo i valori di <math|q<rsub|2>> e <math|q<rsub|3>> per
      determinare espressioni nella sola variabile <math|q<rsub|1>> e
      risolviamo.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      eqq:psubst([q[2]=q2,q[3]=q3[1]],eq)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|X-s<rsub|1>*<sqrt|Y<rsup|2>+X<rsup|2>>=0,c<rsub|1>*<sqrt|Y<rsup|2>+X<rsup|2>>+Y=0,0=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      eqq2:psubst([q[2]=q2,q[3]=q3[2]],eq)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|s<rsub|1>*<sqrt|Y<rsup|2>+X<rsup|2>>+X=0,Y-c<rsub|1>*<sqrt|Y<rsup|2>+X<rsup|2>>=0,0=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      [s11,c11]:map(rhs,flatten(solve(eqq,[s[1],c[1]])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,-<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      [s12,c12]:map(rhs,flatten(solve(eqq2,[s[1],c[1]])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|-<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      q1:[atan2(s11,c11),atan2(s12,c12)]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<math-up|atan2><around*|(|<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,-<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|)>,-<math-up|atan2><around*|(|<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Complessivamente, abbiamo la seguente coppia di soluzioni che dipendono
      dal valore che fissiamo in <math|q<rsub|3>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      sol1:[q1[1],q2,q3[1]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|<math-up|atan2><around*|(|<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,-<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|)>,Z-L<rsub|1>,-<sqrt|Y<rsup|2>+X<rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      sol2:[q1[2],q2,q3[2]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|-<math-up|atan2><around*|(|<frac|X|<sqrt|Y<rsup|2>+X<rsup|2>>>,<frac|Y|<sqrt|Y<rsup|2>+X<rsup|2>>>|)>,Z-L<rsub|1>,<sqrt|Y<rsup|2>+X<rsup|2>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
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