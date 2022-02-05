<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Cinematica Inversa>>

  <\session|maxima|default>
    <\textput>
      <strong|Robot Sferico primo tipo>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      sfer:[[q[1],L[1],%pi/2,0],[q[2],0,%pi/2,L[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,<frac|\<pi\>|2>,L<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dr:rename(DH(sfer),1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|2>>|<cell|0>|<cell|-c<rsub|2>>|<cell|-c<rsub|2>*q<rsub|3>+L<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:getEq(dr)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|x-c<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>*c<rsub|2>=0,y-s<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>*c<rsub|2>=0,z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq:flatten([eq,s[1]^[2]+c[1]^2-1,s[2]^[2]+c[2]^2-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|x-c<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>*c<rsub|2>=0,y-s<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>*c<rsub|2>=0,z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      <center|<choice|<tformat|<table|<row|<cell|<math|z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0>>>|<row|<cell|<math|y-s<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|x-c<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>>>>>
    </textput>

    <\textput>
      Rimuovo variabili trigonometrice di <math|c<rsub|1>,s<rsub|1>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      eqq:eliminate([eq[1],eq[2],eq[4]],[c[1],s[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>|]>>>
    </unfolded-io>

    <\textput>
      <center|<choice|<tformat|<table|<row|<cell|<math|<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>>>>|<row|<cell|<math|z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0>>>|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      eq1:flatten([eq[3],eqq,eq[5]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0,<around*|(|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*q<rsub|3><rsup|2>-2*L<rsub|2>*c<rsub|2>*s<rsub|2>*q<rsub|3>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Per trovare <math|q<rsub|3>> elimino le variabili trigonometriche per
      <math|q<rsub|2>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      p:factor(eliminate(eq1,[c[2],s[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|q<rsub|3><rsup|8>*<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)><rsup|4>*<around*|(|z<rsup|2>-2*L<rsub|1>*z-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>|]>>>
    </unfolded-io>

    <center|<math|q<rsub|3><rsup|8>*<around*|(|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>|)><rsup|4>*<around*|(|z<rsup|2>-2*L<rsub|1>*z-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|2>>>

    <\textput>
      <center|>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      [q31,q32]:map(rhs,solve(part(p[1],4),q[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      Ora che abbiamo trovato <math|q<rsub|3>>, possiamo procedere al calcolo
      di <math|q<rsub|2>>,assumendo nota <math|q<rsub|3>:>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eq2:factor(eliminate(eq1,[q[3]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1,-<around*|(|s<rsub|2>*z-L<rsub|2>*s<rsub|2><rsup|2>-L<rsub|1>*s<rsub|2>-L<rsub|2>*c<rsub|2><rsup|2>|)><rsup|2>*<around*|(|s<rsub|2><rsup|2>*z<rsup|2>-2*L<rsub|2>*s<rsub|2><rsup|3>*z-2*L<rsub|1>*s<rsub|2><rsup|2>*z-2*L<rsub|2>*c<rsub|2><rsup|2>*s<rsub|2>*z-c<rsub|2><rsup|2>*y<rsup|2>-c<rsub|2><rsup|2>*x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|4>+2*L<rsub|1>*L<rsub|2>*s<rsub|2><rsup|3>+2*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|1><rsup|2>*s<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2><rsup|2>*s<rsub|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|4>|)>|]>>>
    </unfolded-io>

    <\textput>
      <center|<choice|<tformat|<table|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>|<row|<cell|<math|-<around*|(|s<rsub|2>*z-L<rsub|2>*s<rsub|2><rsup|2>-L<rsub|1>*s<rsub|2>-L<rsub|2>*c<rsub|2><rsup|2>|)><rsup|2>*<around*|(|s<rsub|2><rsup|2>*z<rsup|2>-2*L<rsub|2>*s<rsub|2><rsup|3>*z-2*L<rsub|1>*s<rsub|2><rsup|2>*z-2*L<rsub|2>*c<rsub|2><rsup|2>*s<rsub|2>*z-c<rsub|2><rsup|2>*y<rsup|2>-c<rsub|2><rsup|2>*x<rsup|2>+L<rsub|2><rsup|2>*s<rsub|2><rsup|4>+2*L<rsub|1>*L<rsub|2>*s<rsub|2><rsup|3>+2*L<rsub|2><rsup|2>*c<rsub|2><rsup|2>*s<rsub|2><rsup|2>+L<rsub|1><rsup|2>*s<rsub|2><rsup|2>+2*L<rsub|1>*L<rsub|2>*c<rsub|2><rsup|2>*s<rsub|2>+L<rsub|2><rsup|2>*c<rsub|2><rsup|4>|)>=0>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      [c21,s21,c22,s22,c23,s23]:map(rhs,flatten(solve([eq1[1],eq1[2]],[c[2],s[2]])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|-<frac|q<rsub|3>*z+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,-<frac|-L<rsub|2>*z+q<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|-q<rsub|3>*z+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*z+q<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,-<frac|q<rsub|3>*z-L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*z-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      Le soluzioni valide per <math|q<rsub|2>> devono rispettare l'identità
      trigonometrica (eq2[1]) e per verificarlo sostituiamo il valore di
      <math|q<rsub|3>> appena trovato:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      verifica:factor(psubst(q[3]=q31,[c21,s21,c22,s22,c23,s23]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<around*|(|z-L<rsub|1>|)>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|L<rsub|2>*<around*|(|z-L<rsub|1>|)>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      Verifica <math|c<rsub|21>,s<rsub|21>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      factor(expand(psubst([c[2]=verifica[1],s[2]=verifica[2]],eq2[1])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >>0>>
    </unfolded-io>

    <\textput>
      Verifica <math|c<rsub|22>,s<rsub|22>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      factor(expand(psubst([c[2]=verifica[3],s[2]=verifica[4]],eq2[1])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>0>>
    </unfolded-io>

    <\textput>
      Terza coppia di soluzioni <math|c<rsub|2>=-<frac|q<rsub|3>*z-L<rsub|1>*q<rsub|3>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,s<rsub|2>=<frac|L<rsub|2>*z-L<rsub|1>*L<rsub|2>|q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>>
      non è da considerare.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      factor(expand(psubst([c[2]=verifica[5],s[2]=verifica[6]],eq2[1])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >>-<frac|y<rsup|2>+x<rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>>>
    </unfolded-io>

    <\textput>
      La verifica per la seconda soluzione di <math|q<rsub|3>> porta allo
      stesso risultato.

      Le soluzioni di <math|q<rsub|2>> sono due per <math|-q<rsub|3>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      q2trig:factor(psubst(q[3]=q31,[c21,s21,c22,s22]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      q211:factor(atan2(q2trig[2],q2trig[1]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      ><with|font-family|rm|atan2>><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<around*|(|z-L<rsub|1>|)>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      q212:factor(atan2(q2trig[4],q2trig[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<around*|(|z-L<rsub|1>|)>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|)>>>
    </unfolded-io>

    <\textput>
      Soluzioni:

      <center|<math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|211>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|212>>>>>>>>
    </textput>

    <\textput>
      Le soluzioni di <math|q<rsub|2>> sono due per <math|q<rsub|3>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      q2trig1:factor(psubst(q[3]=q32,[c21,s21,c22,s22]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|-<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|z*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|1>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      q221:factor(atan2(q2trig1[2],q2trig1[1]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>-<math-up|atan2><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*z+L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|<around*|(|z-L<rsub|1>|)>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      q222:factor(atan2(q2trig1[4],q2trig1[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      ><with|font-family|rm|atan2>><around*|(|<frac|<sqrt|y<rsup|2>+x<rsup|2>>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>+L<rsub|2>*z-L<rsub|1>*L<rsub|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>,-<frac|<around*|(|z-L<rsub|1>|)>*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>-L<rsub|2>*<sqrt|y<rsup|2>+x<rsup|2>>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>+L<rsub|1><rsup|2>>|)>>>
    </unfolded-io>

    <\textput>
      Soluzioni:

      <center|<math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|211>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|212>>>>>>>,<math|<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|221>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|222>>>>>>>>
    </textput>

    <\textput>
      Noto <math|q<rsub|3>,q<rsub|2>> possiamo calcolare <math|q<rsub|1>>:
    </textput>

    <\textput>
      <center|<choice|<tformat|<table|<row|<cell|<math|z+c<rsub|2>*q<rsub|3>-L<rsub|2>*s<rsub|2>-L<rsub|1>=0>>>|<row|<cell|<math|y-s<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|x-c<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>>>>>
    </textput>

    <\textput>
      \;
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      eq3:eliminate(eq,[c[2],s[2],q[3]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><around*|[|<around*|(|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1|)><rsup|8>,L<rsub|2><rsup|8>*<around*|(|s<rsub|1>*x-c<rsub|1>*y|)><rsup|8>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      [c11,s11,c12,s12]:map(rhs,flatten(solve(eq3,[c[1],s[1]])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|-<frac|x|<sqrt|y<rsup|2>+x<rsup|2>>>,-<frac|y|<sqrt|y<rsup|2>+x<rsup|2>>>,<frac|x|<sqrt|y<rsup|2>+x<rsup|2>>>,<frac|y|<sqrt|y<rsup|2>+x<rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      q11:atan2(s11,c11)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >>-<math-up|atan2><around*|(|<frac|y|<sqrt|y<rsup|2>+x<rsup|2>>>,-<frac|x|<sqrt|y<rsup|2>+x<rsup|2>>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      q12:atan2(s12,c12)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      ><with|font-family|rm|atan2>><around*|(|<frac|y|<sqrt|y<rsup|2>+x<rsup|2>>>,<frac|x|<sqrt|y<rsup|2>+x<rsup|2>>>|)>>>
    </unfolded-io>

    <\textput>
      Infine, le soluzioni trovate sono le seguenti:

      <center|<math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|211>>>|<row|<cell|q<rsub|11>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|212>>>|<row|<cell|q<rsub|12>>>>>>>,<math|<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|221>>>|<row|<cell|q<rsub|11>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|222>>>|<row|<cell|q<rsub|12>>>>>>>>
    </textput>

    Per verifica possiamo sostituire i valori delle variabili simboliche ed
    ottenere il valore delle variabili di giunto da inserire nella cinematica
    diretta del robot.

    Ipotizziamo un robot con <math|L<rsub|1>=2,L<rsub|2>=3> che deve
    raggiungere un punto <math|<matrix|<tformat|<table|<row|<cell|x>>|<row|<cell|y>>|<row|<cell|z>>>>>=><matrix|<tformat|<table|<row|<cell|2>>|<row|<cell|2>>|<row|<cell|1>>>>>

    1) Verifica di <math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|211>>>|<row|<cell|q<rsub|11>>>>>>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      verifica:psubst([L[1]=2,L[2]=3,x=2,y=2,z=1],[q31,q211,q11])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><around*|[|0,arctan <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>-\<pi\>,-<frac|3*\<pi\>|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      sferV:[[verifica[3],2,%pi/2,0],[verifica[2],0,%pi/2,3],[0,0,0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|<around*|[|-<frac|3*\<pi\>|4>,2,<frac|\<pi\>|2>,0|]>,<around*|[|arctan
      <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>-\<pi\>,0,<frac|\<pi\>|2>,3|]>,<around*|[|0,0,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      DH(sferV)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2|3>>|<cell|-<frac|1|<sqrt|2>>>|<cell|<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|<frac|2|3>>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|-<frac|1|3>>|<cell|0>|<cell|<frac|2<rsup|<frac|3|2>>|3>>|<cell|1>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      2) Verifica di <math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|q<rsub|212>>>|<row|<cell|q<rsub|12>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      verifica:psubst([L[1]=2,L[2]=3,x=2,y=2,z=1],[q31,q212,q12])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><around*|[|0,-arctan <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>,<frac|\<pi\>|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      sferV:[[verifica[3],2,%pi/2,0],[verifica[2],0,%pi/2,3],[0,0,0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><around*|[|<around*|[|<frac|\<pi\>|4>,2,<frac|\<pi\>|2>,0|]>,<around*|[|-arctan
      <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>,0,<frac|\<pi\>|2>,3|]>,<around*|[|0,0,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      DH(sferV)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2|3>>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|<frac|2|3>>|<cell|-<frac|1|<sqrt|2>>>|<cell|-<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|-<frac|1|3>>|<cell|0>|<cell|-<frac|2<rsup|<frac|3|2>>|3>>|<cell|1>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      3)Verifica <math|<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|221>>>|<row|<cell|q<rsub|11>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      verifica:psubst([L[1]=2,L[2]=3,x=2,y=2,z=1],[q32,q221,q11])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><around*|[|0,arctan <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>-\<pi\>,-<frac|3*\<pi\>|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      sferV:[[verifica[3],2,%pi/2,0],[verifica[2],0,%pi/2,3],[0,0,0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><around*|[|<around*|[|-<frac|3*\<pi\>|4>,2,<frac|\<pi\>|2>,0|]>,<around*|[|arctan
      <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>-\<pi\>,0,<frac|\<pi\>|2>,3|]>,<around*|[|0,0,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      DH(sferV)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2|3>>|<cell|-<frac|1|<sqrt|2>>>|<cell|<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|<frac|2|3>>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|-<frac|1|3>>|<cell|0>|<cell|<frac|2<rsup|<frac|3|2>>|3>>|<cell|1>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\textput>
      4)Verifica <math|<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|q<rsub|222>>>|<row|<cell|q<rsub|12>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      verifica:psubst([L[1]=2,L[2]=3,x=2,y=2,z=1],[q32,q222,q12])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><around*|[|0,-arctan <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>,<frac|\<pi\>|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      sferV:[[verifica[3],2,%pi/2,0],[verifica[2],0,%pi/2,3],[0,0,0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >><around*|[|<around*|[|<frac|\<pi\>|4>,2,<frac|\<pi\>|2>,0|]>,<around*|[|-arctan
      <around*|(|<frac|1|2<rsup|<frac|3|2>>>|)>,0,<frac|\<pi\>|2>,3|]>,<around*|[|0,0,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      DH(sferV)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2|3>>|<cell|<frac|1|<sqrt|2>>>|<cell|-<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|<frac|2|3>>|<cell|-<frac|1|<sqrt|2>>>|<cell|-<frac|1|3*<sqrt|2>>>|<cell|2>>|<row|<cell|-<frac|1|3>>|<cell|0>|<cell|-<frac|2<rsup|<frac|3|2>>|3>>|<cell|1>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a2>
    <associate|page-width|auto>
  </collection>
</initial>