<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|Robot Sferico di Stanford>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      stanf:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dh:rename(DH(stanf),0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:flatten([getEq(dh),c[1]^2+s[1]^2-1,c[2]^2+s[2]^2-1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|X-c<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>=0,Y-s<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>=0,Z-c<rsub|2>*q<rsub|3>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Eliminiamo variabili trigonometriche
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      p:eliminate(eq,[c[1],s[1],s[2],c[2]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>q<rsub|3><rsup|288>*<around*|(|-Z<rsup|2>+2*L<rsub|1>*Z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>|)><rsup|48>*<around*|(|-Z<rsup|2>+2*L<rsub|1>*Z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|48>*<around*|(|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|48>>>
    </unfolded-io>

    <\textput>
      Seleziono il fattore che dipende da <math|X,Y,Z> contemporaneamente. Le
      altre sono soluzioni singolari.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      p:part(p,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|(|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|48>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      p:part(p,1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\textput>
      Risolvo per determinare <math|q<rsub|3>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      q3:map(rhs,solve(p,q[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|-<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      Con <math|q<rsub|3>> noto, eliminiamolo insieme alle variabili in
      <math|q<rsub|1>> per determinare una soluzione in <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      eqq:(eliminate(eq,[c[1],s[1],q[3]])[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>s<rsub|2><rsup|4>*<around*|(|Z-L<rsub|1>|)><rsup|4>*<around*|(|s<rsub|2><rsup|2>*<around*|(|-Z<rsup|2>+2*L<rsub|1>*Z-L<rsub|1><rsup|2>|)>+c<rsub|2><rsup|2>*Y<rsup|2>+c<rsub|2><rsup|2>*X<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>*<around*|(|s<rsub|2><rsup|2>*<around*|(|Z<rsup|2>-2*L<rsub|1>*Z+L<rsub|1><rsup|2>|)>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\textput>
      Selezioniamo il terzo fattore poiché dipende da \ <math|X,Y,Z>
      contemporaneamente
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eqq:part(eqq,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|(|s<rsub|2><rsup|2>*<around*|(|-Z<rsup|2>+2*L<rsub|1>*Z-L<rsub|1><rsup|2>|)>+c<rsub|2><rsup|2>*Y<rsup|2>+c<rsub|2><rsup|2>*X<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\textput>
      Risolviamo per determinare le soluzioni in <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      sol2:flatten(solve([eqq,eq[5]],[c[2],s[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|c<rsub|2>=-<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=-<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=-<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=-<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\textput>
      In particolare, osserviamo che per ogni valore di <math|c<rsub|2>>
      abbiamo due possibili valori di <math|s<rsub|2>>, pertanto ricostruiamo
      <math|q<rsub|2>> come segue
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      [c21,c22]:map(rhs,[sol2[1],sol2[5]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|-<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      [s211,s212]:map(rhs,[sol2[2],sol2[4]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|-<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      [s221,s222]:map(rhs,[sol2[6],sol2[8]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|-<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      q21: [atan2(s211,c21),atan2(s212,c21)]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|-<math-up|atan2><around*|(|<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,-<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>,<math-up|atan2><around*|(|<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,-<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      q22: [atan2(s221,c22),atan2(s222,c22)]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|-<math-up|atan2><around*|(|<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>,<math-up|atan2><around*|(|<sqrt|<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|Z-L<rsub|1>|<sqrt|Z<rsup|2>-2*L<rsub|1>*Z+Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
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