<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<doc-data|<doc-title|Robot Antropomorfo - Cinematica
  Inversa>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>>>

  Calcolare la cinematica inversa del Robot Antropomorfo utilizzando il
  comando Maxima eliminate().

  Passi da eseguire:

  <\itemize>
    <item>Eliminare iterativamente tutte le variabili di giunto tranne una;

    <item>Se necessario applicare le equazioni di identità trigonometrica per
    ricavare il seno o coseno;

    <item>Fattorizzare il risultato ottenuto dal comando eliminate();

    <item>Sostituire i fattori costanti (indipendenti dalle variabili di
    giunto e indipendenti dal punto terminale) con delle variabili ausiliarie
    per permettere a maxima di effettuare i conti in caso di espressioni
    troppo complesse;

    <item>Considerare solamente i fattori che dipendono unicamente dall'unica
    variabile non cancellata e dal punto terminale;

    <item>Utilizzare il comando solve() per calcolare le variabili di giunto
    che si stanno cercando;

    <item>Ripetere il procedimento del passo 1 fino al calcolo di tutte le
    variabili di giunto

    <item>Verificare le soluzioni ottenute controllando che sia soddisfatta
    l'equazione: <math|s<rsup|2>+c<rsup|2>=1>
  </itemize>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      antrop:[[q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,D<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      antrop:[[q[1],1,%pi/2,0],[q[2],0,0,1],[q[3],0,0,1]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<around*|[|q<rsub|1>,1,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,1|]>,<around*|[|q<rsub|3>,0,0,1|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      dr:rename(DH(antrop),1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|-c<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>>>|<row|<cell|s<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|-s<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>>>|<row|<cell|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>>|<cell|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>>|<cell|0>|<cell|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>+s<rsub|2>+1>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq:flatten([getEq(dr),c[1]^2+s[1]^2-1,c[2]^2+s[2]^2-1,c[3]^2+s[3]^2-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|x-c<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>=0,y-s<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>=0,z-c<rsub|2>*s<rsub|3>-s<rsub|2>*c<rsub|3>-s<rsub|2>-1=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1,s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Equazioni per calcolare la cinematica inversa:

      <center|<math|<choice|<tformat|<table|<row|<cell|x-c<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0>>|<row|<cell|y-s<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0>>|<row|<cell|z-D<rsub|3>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>+D<rsub|2>*s<rsub|2>+L<rsub|1>=0>>|<row|<cell|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>|<row|<cell|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>|<row|<cell|s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      eq:psubst([y=1,z=1],

      \ \ \ \ \ \ \ eq)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|x-c<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>=0,1-s<rsub|1>*<around*|(|-s<rsub|2>*s<rsub|3>+c<rsub|2>*c<rsub|3>+c<rsub|2>|)>=0,-c<rsub|2>*s<rsub|3>-s<rsub|2>*c<rsub|3>-s<rsub|2>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1,s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      eq1:factor(expand(eliminate([eq[1],eq[2],eq[4]],[c[1],s[1]]))[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>-c<rsub|2>|)><rsup|2>*<around*|(|x<rsup|2>-s<rsub|2><rsup|2>*s<rsub|3><rsup|2>+2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>+2*c<rsub|2>*s<rsub|2>*s<rsub|3>-c<rsub|2><rsup|2>*c<rsub|3><rsup|2>-2*c<rsub|2><rsup|2>*c<rsub|3>-c<rsub|2><rsup|2>+1|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      p:part(eq1,1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>-c<rsub|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      p2:part(eq1,2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>x<rsup|2>-s<rsub|2><rsup|2>*s<rsub|3><rsup|2>+2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>+2*c<rsub|2>*s<rsub|2>*s<rsub|3>-c<rsub|2><rsup|2>*c<rsub|3><rsup|2>-2*c<rsub|2><rsup|2>*c<rsub|3>-c<rsub|2><rsup|2>+1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eq2:eliminate([p2,eq[3],eq[5],eq[6]],[c[2],s[2],s[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|18446744073709551616*<around*|(|c<rsub|3>+1|)><rsup|32>*<around*|(|c<rsub|3><rsup|2>+2*c<rsub|3>+1|)><rsup|64>*<around*|(|<around*|(|3*c<rsub|3>-5|)>*x<rsup|4>+<around*|(|-4*c<rsub|3><rsup|2>+14*c<rsub|3>+2|)>*x<rsup|2>-4*c<rsub|3><rsup|3>-16*c<rsub|3><rsup|2>-c<rsub|3>+3|)><rsup|32>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      part(eq2[1],1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>18446744073709551616>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      part(eq2[1],2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|(|c<rsub|3>+1|)><rsup|32>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      part(eq2[1],3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|(|c<rsub|3><rsup|2>+2*c<rsub|3>+1|)><rsup|64>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      p3:collectterms(expand(part(part(eq2[1],4),1)),c[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>c<rsub|3>*<around*|(|3*x<rsup|4>+14*x<rsup|2>-1|)>-5*x<rsup|4>+2*x<rsup|2>+c<rsub|3><rsup|2>*<around*|(|-4*x<rsup|2>-16|)>-4*c<rsub|3><rsup|3>+3>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      C3:map(rhs,solve(part(eq2[1],4),c[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|-<frac|<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+3*x<rsup|2>+7|4>,<frac|<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-3*x<rsup|2>-7|4>,<frac|x<rsup|2>-1|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      S3:factor([solve(subst(c[3]=C3[1],eq[6]),s[3]),solve(subst(c[3]=C3[2],eq[6]),s[3]),solve(subst(c[3]=C3[3],eq[6]),s[3])])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<around*|[|s<rsub|3>=-<frac|\<mathi\>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+62*x<rsup|2>+53>|2<rsup|<frac|3|2>>>,s<rsub|3>=<frac|\<mathi\>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+62*x<rsup|2>+53>|2<rsup|<frac|3|2>>>|]>,<around*|[|s<rsub|3>=-<frac|<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|2<rsup|<frac|3|2>>>,s<rsub|3>=<frac|<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|2<rsup|<frac|3|2>>>|]>,<around*|[|s<rsub|3>=-<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>,s<rsub|3>=<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      pop(S3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|s<rsub|3>=-<frac|\<mathi\>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+62*x<rsup|2>+53>|2<rsup|<frac|3|2>>>,s<rsub|3>=<frac|\<mathi\>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+62*x<rsup|2>+53>|2<rsup|<frac|3|2>>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      [S311,S312]:map(rhs,S3[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|-<frac|<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|2<rsup|<frac|3|2>>>,<frac|<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|2<rsup|<frac|3|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      [S321,S322]:map(rhs,S3[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|-<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>,<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>|]>>>
    </unfolded-io>

    <\textput>
      Verifico quali soluzioni in <math|s<rsub|3>> sono ammissibili:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      eq3:eliminate([p2,eq[3],eq[5]],[c[2],s[2]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|(|c<rsub|3><rsup|2>+2*c<rsub|3>+1|)><rsup|2>*<around*|(|s<rsub|3><rsup|4>+<around*|(|2*c<rsub|3><rsup|2>+4*c<rsub|3>+2|)>*s<rsub|3><rsup|2>+c<rsub|3><rsup|4>+4*c<rsub|3><rsup|3>+6*c<rsub|3><rsup|2>+4*c<rsub|3>+1|)><rsup|2>*<around*|(|<around*|(|4*s<rsub|3><rsup|2>+c<rsub|3><rsup|2>+2*c<rsub|3>+1|)>*x<rsup|4>+<around*|(|-4*s<rsub|3><rsup|4>+<around*|(|-6*c<rsub|3><rsup|2>-12*c<rsub|3>+2|)>*s<rsub|3><rsup|2>-2*c<rsub|3><rsup|4>-8*c<rsub|3><rsup|3>-10*c<rsub|3><rsup|2>-4*c<rsub|3>|)>*x<rsup|2>+<around*|(|c<rsub|3><rsup|2>+2*c<rsub|3>-3|)>*s<rsub|3><rsup|4>+<around*|(|2*c<rsub|3><rsup|4>+8*c<rsub|3><rsup|3>+6*c<rsub|3><rsup|2>-4*c<rsub|3>|)>*s<rsub|3><rsup|2>+c<rsub|3><rsup|6>+6*c<rsub|3><rsup|5>+13*c<rsub|3><rsup|4>+12*c<rsub|3><rsup|3>+4*c<rsub|3><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      expand(psubst([c[3]=C3[2],s[3]=S311],eq3))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      expand(psubst([c[3]=C3[2],s[3]=S312],eq3))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      expand(psubst([c[3]=C3[3],s[3]=S321],eq3))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      expand(psubst([c[3]=C3[3],s[3]=S322],eq3))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      q[3]:rootscontract([atan2(S311,C3[2]),atan2(S312,C3[2]),atan2(S321,C3[3]),atan2(S322,C3[3])])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|-<math-up|atan2><around*|(|<sqrt|<frac|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53|8>>,<frac|<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-3*x<rsup|2>-7|4>|)>,<math-up|atan2><around*|(|<sqrt|<frac|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53|8>>,<frac|<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-3*x<rsup|2>-7|4>|)>,-<math-up|atan2><around*|(|<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>,<frac|x<rsup|2>-1|2>|)>,<math-up|atan2><around*|(|<frac|<sqrt|-x<rsup|4>+2*x<rsup|2>+3>|2>,<frac|x<rsup|2>-1|2>|)>|]>>>
    </unfolded-io>

    <\textput>
      Ora abbiamo calcolato <math|q<rsub|3>>. Procediamo con il calcolo di
      <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>94) >
    <|unfolded-io>
      eq4:(rootscontract(factor(eliminate([p2,eq[6]],[s[3],c[3]]))))[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o94>)
      >><frac|c<rsub|2>*<around*|(|x<rsup|6>+3*x<rsup|4>+3*x<rsup|2>+1|)><rsup|<frac|1|4>>+<sqrt|<sqrt|x<rsup|2>+1>*<around*|(|-s<rsub|2><rsup|2>*x<rsup|2>+s<rsub|2><rsup|4>-s<rsub|2><rsup|2>|)>+2*c<rsub|2>*s<rsub|2><rsup|2>*x<rsup|2>+2*c<rsub|2>*s<rsub|2><rsup|2>>-c<rsub|2><rsup|2>*<around*|(|x<rsup|2>+1|)><rsup|<frac|1|4>>|<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>*<around*|(|x<rsup|2>+1|)><rsup|<frac|1|4>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>95) >
    <|unfolded-io>
      solve([eq4,eq[5]],[c[2],s[2]])
    <|unfolded-io>
      \;

      PQUOTIENT: Quotient by a polynomial of higher degree (case 1)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>96) >
    <|unfolded-io>
      eq4
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o96>)
      >><frac|c<rsub|2>*<around*|(|x<rsup|6>+3*x<rsup|4>+3*x<rsup|2>+1|)><rsup|<frac|1|4>>+<sqrt|<sqrt|x<rsup|2>+1>*<around*|(|-s<rsub|2><rsup|2>*x<rsup|2>+s<rsub|2><rsup|4>-s<rsub|2><rsup|2>|)>+2*c<rsub|2>*s<rsub|2><rsup|2>*x<rsup|2>+2*c<rsub|2>*s<rsub|2><rsup|2>>-c<rsub|2><rsup|2>*<around*|(|x<rsup|2>+1|)><rsup|<frac|1|4>>|<around*|(|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>|)>*<around*|(|x<rsup|2>+1|)><rsup|<frac|1|4>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>97) >
    <|unfolded-io>
      eq[5]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o97>)
      >>s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>113) >
    <|unfolded-io>
      C2:solve([collectterms(psubst([s[3]=S311,c[3]=C3[2]],p2),c[2])],[c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o113>)
      >><around*|[|c<rsub|2>=-<frac|<around*|(|2<rsup|<frac|7|2>>*s<rsub|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+3*2<rsup|<frac|7|2>>*s<rsub|2>*x<rsup|2>+3*2<rsup|<frac|7|2>>*s<rsub|2>|)>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>+<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<around*|(|<around*|(|-3*<sqrt|2>*x<rsup|2>-3*<sqrt|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*<sqrt|2>*x<rsup|4>-25*2<rsup|<frac|3|2>>*x<rsup|2>-41*<sqrt|2>|)>|512*x<rsup|2>+512>,c<rsub|2>=-<frac|<around*|(|2<rsup|<frac|7|2>>*s<rsub|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+3*2<rsup|<frac|7|2>>*s<rsub|2>*x<rsup|2>+3*2<rsup|<frac|7|2>>*s<rsub|2>|)>*<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>+<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<around*|(|<around*|(|3*<sqrt|2>*x<rsup|2>+3*<sqrt|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*<sqrt|2>*x<rsup|4>+25*2<rsup|<frac|3|2>>*x<rsup|2>+41*<sqrt|2>|)>|512*x<rsup|2>+512>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>123) >
    <|unfolded-io>
      S2:rootscontract(solve(subst(C2[1],eq[5]),s[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o123>)
      >><around*|[|s<rsub|2>=<frac|<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|x<rsup|2>+1>*<around*|(|3*2<rsup|<frac|9|2>>*x<rsup|2>+3*2<rsup|<frac|9|2>>|)>-<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|3*x<rsup|2>+3|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+50*x<rsup|2>+41|)>|2048*x<rsup|2>+2048>,s<rsub|2>=<frac|<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>+<sqrt|x<rsup|2>+1>*<around*|(|-3*2<rsup|<frac|9|2>>*x<rsup|2>-3*2<rsup|<frac|9|2>>|)>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|3*x<rsup|2>+3|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+50*x<rsup|2>+41|)>|2048*x<rsup|2>+2048>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>128) >
    <|unfolded-io>
      S221:rootscontract(solve(subst(C2[2],eq[5]),s[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o128>)
      >><around*|[|s<rsub|2>=-<frac|<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>+<sqrt|x<rsup|2>+1>*<around*|(|-3*2<rsup|<frac|9|2>>*x<rsup|2>-3*2<rsup|<frac|9|2>>|)>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|3*x<rsup|2>+3|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+50*x<rsup|2>+41|)>|2048*x<rsup|2>+2048>,s<rsub|2>=-<frac|<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|x<rsup|2>+1>*<around*|(|3*2<rsup|<frac|9|2>>*x<rsup|2>+3*2<rsup|<frac|9|2>>|)>-<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|3*x<rsup|2>+3|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|4>+50*x<rsup|2>+41|)>|2048*x<rsup|2>+2048>|]>>>
    </unfolded-io>

    <\folded-io>
      <with|color|red|(<with|math-font-family|rm|%i>126) >
    <|folded-io>
      expand(psubst([C2[1],S2[1]],p2))$
    <|folded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o126>)
      >>-<frac|9*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|17*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|17*2<rsup|<frac|13|2>>*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|25*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|25*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|6>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*x<rsup|6>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|99*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|99*2<rsup|<frac|13|2>>*s<rsub|2>*s<rsub|3>*x<rsup|4>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*x<rsup|4>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|147*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|75*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|147*2<rsup|<frac|13|2>>*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|75*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|171*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|171*2<rsup|<frac|11|2>>*s<rsub|2>*s<rsub|3>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|6*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|6*s<rsub|3><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|18*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|100*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|82*s<rsub|3><rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|9*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|9*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|9*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|6>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|75*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|75*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|123*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|123*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|27*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*x<rsup|6>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|27*2<rsup|<frac|5|2>>*s<rsub|3>*x<rsup|6>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|51*2<rsup|<frac|7|2>>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|75*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|51*2<rsup|<frac|7|2>>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|75*2<rsup|<frac|5|2>>*s<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|75*2<rsup|<frac|7|2>>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|123*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|75*2<rsup|<frac|7|2>>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|123*2<rsup|<frac|5|2>>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|123*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|123*2<rsup|<frac|5|2>>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|81*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*x<rsup|8>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|81*2<rsup|<frac|5|2>>*s<rsub|3>*x<rsup|8>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|225*2<rsup|<frac|9|2>>*c<rsub|3>*s<rsub|3>*x<rsup|6>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|225*2<rsup|<frac|9|2>>*s<rsub|3>*x<rsup|6>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|497*2<rsup|<frac|9|2>>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|369*2<rsup|<frac|7|2>>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|497*2<rsup|<frac|9|2>>*s<rsub|3>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|369*2<rsup|<frac|7|2>>*s<rsub|3>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|769*2<rsup|<frac|9|2>>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|769*2<rsup|<frac|9|2>>*s<rsub|3>*x<rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1169*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1169*2<rsup|<frac|5|2>>*s<rsub|3>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|54*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+372*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+446*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-162*x<rsup|6>-1854*x<rsup|4>-5398*x<rsup|2>-3706>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|2<rsup|<frac|9|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|2<rsup|<frac|9|2>>*s<rsub|2>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|3*2<rsup|<frac|9|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|3*2<rsup|<frac|9|2>>*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|3*2<rsup|<frac|9|2>>*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|3*2<rsup|<frac|9|2>>*s<rsub|2>*s<rsub|3>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|1536*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|1536*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|1536*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|1536*s<rsub|2>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|4608*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|4608*s<rsub|2>*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9216*s<rsub|2>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9216*s<rsub|2>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|4608*s<rsub|2>*c<rsub|3>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|4608*s<rsub|2>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|576*s<rsub|2>*c<rsub|3><rsup|2>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|1152*s<rsub|2>*c<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|576*s<rsub|2>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|2176*s<rsub|2>*c<rsub|3><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|4352*s<rsub|2>*c<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|2176*s<rsub|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|1600*s<rsub|2>*c<rsub|3><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|3200*s<rsub|2>*c<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|1600*s<rsub|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|1728*s<rsub|2>*c<rsub|3><rsup|2>*x<rsup|6>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|3456*s<rsub|2>*c<rsub|3>*x<rsup|6>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|1728*s<rsub|2>*x<rsup|6>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|14400*s<rsub|2>*c<rsub|3><rsup|2>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|28800*s<rsub|2>*c<rsub|3>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|14400*s<rsub|2>*x<rsup|4>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|23616*s<rsub|2>*c<rsub|3><rsup|2>*x<rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|47232*s<rsub|2>*c<rsub|3>*x<rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|23616*s<rsub|2>*x<rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|10944*s<rsub|2>*c<rsub|3><rsup|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|21888*s<rsub|2>*c<rsub|3>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|10944*s<rsub|2>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+7*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|3*2<rsup|<frac|3|2>>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|3*2<rsup|<frac|3|2>>*s<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|3*2<rsup|<frac|3|2>>*c<rsub|3>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|3*2<rsup|<frac|3|2>>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9*2<rsup|<frac|3|2>>*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9*2<rsup|<frac|3|2>>*s<rsub|3>*x<rsup|4>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|25*2<rsup|<frac|5|2>>*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|25*2<rsup|<frac|5|2>>*s<rsub|3>*x<rsup|2>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|41*2<rsup|<frac|3|2>>*c<rsub|3>*s<rsub|3>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|41*2<rsup|<frac|3|2>>*s<rsub|3>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|576*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|576*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1152*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1152*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|576*c<rsub|3>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|576*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1728*c<rsub|3>*s<rsub|3>*x<rsup|6>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|1728*s<rsub|3>*x<rsup|6>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|11328*c<rsub|3>*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|11328*s<rsub|3>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|17472*c<rsub|3>*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|17472*s<rsub|3>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|7872*c<rsub|3>*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>+<frac|7872*s<rsub|3>*<sqrt|x<rsup|2>+1>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<sqrt|-3*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+13*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>|1048576*x<rsup|4>+2097152*x<rsup|2>+1048576>-<frac|9*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|15*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|39*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|6>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|3*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|27*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|3*2<rsup|<frac|13|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|21*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|21*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*<sqrt|x<rsup|2>+1>*<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|27648*s<rsub|3><rsup|2>*x<rsup|8>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|61440*s<rsub|3><rsup|2>*x<rsup|6>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|636928*s<rsub|3><rsup|2>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|1347584*s<rsub|3><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|676864*s<rsub|3><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|82944*s<rsub|3><rsup|2>*x<rsup|10>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|562176*s<rsub|3><rsup|2>*x<rsup|8>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|1550336*s<rsub|3><rsup|2>*x<rsup|6>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|2107392*s<rsub|3><rsup|2>*x<rsup|4>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|1397760*s<rsub|3><rsup|2>*x<rsup|2>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>+<frac|361472*s<rsub|3><rsup|2>|4194304*x<rsup|4>+8388608*x<rsup|2>+4194304>-<frac|6144*c<rsub|3><rsup|2>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|12288*c<rsub|3>*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|6144*x<rsup|4>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|32768*s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|12288*c<rsub|3><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|65536*s<rsub|2><rsup|2>*c<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|24576*c<rsub|3>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|32768*s<rsub|2><rsup|2>*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|12288*x<rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|32768*s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|6144*c<rsub|3><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|65536*s<rsub|2><rsup|2>*c<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|12288*c<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|32768*s<rsub|2><rsup|2>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|6144*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|18432*c<rsub|3><rsup|2>*x<rsup|6>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|36864*c<rsub|3>*x<rsup|6>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|18432*x<rsup|6>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|163840*s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|120832*c<rsub|3><rsup|2>*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|327680*s<rsub|2><rsup|2>*c<rsub|3>*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|241664*c<rsub|3>*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|163840*s<rsub|2><rsup|2>*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|120832*x<rsup|4>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|327680*s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|186368*c<rsub|3><rsup|2>*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|655360*s<rsub|2><rsup|2>*c<rsub|3>*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|372736*c<rsub|3>*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|327680*s<rsub|2><rsup|2>*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|186368*x<rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|163840*s<rsub|2><rsup|2>*c<rsub|3><rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|83968*c<rsub|3><rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|327680*s<rsub|2><rsup|2>*c<rsub|3>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|167936*c<rsub|3>|262144*x<rsup|4>+524288*x<rsup|2>+262144>+<frac|163840*s<rsub|2><rsup|2>|262144*x<rsup|4>+524288*x<rsup|2>+262144>-<frac|83968|262144*x<rsup|4>+524288*x<rsup|2>+262144>+x<rsup|2>+1>>
    </folded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>130) >
    <|unfolded-io>
      fullratsimp(expand(psubst([C2[2],S221[1]],p2)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o130>)
      >><frac|<sqrt|<around*|(|3*x<rsup|2>+7|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-62*x<rsup|2>-53>*<around*|(|<around*|(|<around*|(|-13824*s<rsub|2>*c<rsub|3><rsup|2>-27648*s<rsub|2>*c<rsub|3>-13824*s<rsub|2>|)>*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|<around*|(|-4608*s<rsub|2>*c<rsub|3><rsup|2>-9216*s<rsub|2>*c<rsub|3>-4608*s<rsub|2>|)>*x<rsup|4>+<around*|(|-17408*s<rsub|2>*c<rsub|3><rsup|2>-34816*s<rsub|2>*c<rsub|3>-17408*s<rsub|2>|)>*x<rsup|2>-12800*s<rsub|2>*c<rsub|3><rsup|2>-25600*s<rsub|2>*c<rsub|3>-12800*s<rsub|2>|)>+<around*|(|-115200*s<rsub|2>*c<rsub|3><rsup|2>-230400*s<rsub|2>*c<rsub|3>-115200*s<rsub|2>|)>*x<rsup|4>+<around*|(|-188928*s<rsub|2>*c<rsub|3><rsup|2>-377856*s<rsub|2>*c<rsub|3>-188928*s<rsub|2>|)>*x<rsup|2>-87552*s<rsub|2>*c<rsub|3><rsup|2>-175104*s<rsub|2>*c<rsub|3>-87552*s<rsub|2>|)>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>+<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<around*|(|<around*|(|2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>+2<rsup|<frac|11|2>>*s<rsub|2>|)>*s<rsub|3>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+<around*|(|3*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>+3*2<rsup|<frac|11|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|2>+<around*|(|3*2<rsup|<frac|11|2>>*s<rsub|2>*c<rsub|3>+3*2<rsup|<frac|11|2>>*s<rsub|2>|)>*s<rsub|3>|)>+<sqrt|x<rsup|2>+1>*<around*|(|<around*|(|-3072*s<rsub|2>*c<rsub|3>-3072*s<rsub|2>|)>*s<rsub|3>*x<rsup|2>+<around*|(|-3072*s<rsub|2>*c<rsub|3>-3072*s<rsub|2>|)>*s<rsub|3>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+<sqrt|x<rsup|2>+1>*<around*|(|<around*|(|-9216*s<rsub|2>*c<rsub|3>-9216*s<rsub|2>|)>*s<rsub|3>*x<rsup|4>+<around*|(|-18432*s<rsub|2>*c<rsub|3>-18432*s<rsub|2>|)>*s<rsub|3>*x<rsup|2>+<around*|(|-9216*s<rsub|2>*c<rsub|3>-9216*s<rsub|2>|)>*s<rsub|3>|)>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|27*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+27*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|<around*|(|9*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+9*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|4>+<around*|(|17*2<rsup|<frac|15|2>>*s<rsub|2>*c<rsub|3>+17*2<rsup|<frac|15|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|2>+<around*|(|25*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+25*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>|)>+<around*|(|225*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+225*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|4>+<around*|(|369*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+369*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>*x<rsup|2>+<around*|(|171*2<rsup|<frac|13|2>>*s<rsub|2>*c<rsub|3>+171*2<rsup|<frac|13|2>>*s<rsub|2>|)>*s<rsub|3>|)>|)>+<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<around*|(|81*2<rsup|<frac|7|2>>*c<rsub|3>+81*2<rsup|<frac|7|2>>|)>*s<rsub|3>*x<rsup|8>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|<around*|(|27*2<rsup|<frac|7|2>>*c<rsub|3>+27*2<rsup|<frac|7|2>>|)>*s<rsub|3>*x<rsup|6>+<around*|(|177*2<rsup|<frac|7|2>>*c<rsub|3>+177*2<rsup|<frac|7|2>>|)>*s<rsub|3>*x<rsup|4>+<around*|(|273*2<rsup|<frac|7|2>>*c<rsub|3>+273*2<rsup|<frac|7|2>>|)>*s<rsub|3>*x<rsup|2>+<around*|(|123*2<rsup|<frac|7|2>>*c<rsub|3>+123*2<rsup|<frac|7|2>>|)>*s<rsub|3>|)>+<around*|(|225*2<rsup|<frac|11|2>>*c<rsub|3>+225*2<rsup|<frac|11|2>>|)>*s<rsub|3>*x<rsup|6>+<around*|(|1363*2<rsup|<frac|9|2>>*c<rsub|3>+1363*2<rsup|<frac|9|2>>|)>*s<rsub|3>*x<rsup|4>+<around*|(|769*2<rsup|<frac|11|2>>*c<rsub|3>+769*2<rsup|<frac|11|2>>|)>*s<rsub|3>*x<rsup|2>+<around*|(|1169*2<rsup|<frac|7|2>>*c<rsub|3>+1169*2<rsup|<frac|7|2>>|)>*s<rsub|3>|)>*<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>+<sqrt|<around*|(|13-3*x<rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*x<rsup|4>-2*x<rsup|2>+7>*<around*|(|<sqrt|-162*x<rsup|6>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|54*x<rsup|4>+372*x<rsup|2>+446|)>-1854*x<rsup|4>-5398*x<rsup|2>-3706>*<around*|(|<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<around*|(|<around*|(|-3*s<rsub|3><rsup|2>*x<rsup|2>-3*s<rsub|3><rsup|2>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>-9*s<rsub|3><rsup|2>*x<rsup|4>-50*s<rsub|3><rsup|2>*x<rsup|2>-41*s<rsub|3><rsup|2>|)>+<sqrt|x<rsup|2>+1>*<around*|(|27*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|6>+177*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|4>+273*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|2>+123*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>|)>+<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|9*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|4>+9*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|2>+9*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>|)>|)>+<sqrt|-3*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+9*x<rsup|2>+41>*<around*|(|<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<around*|(|<around*|(|<around*|(|3*2<rsup|<frac|5|2>>*c<rsub|3>+3*2<rsup|<frac|5|2>>|)>*s<rsub|3>*x<rsup|2>+<around*|(|3*2<rsup|<frac|5|2>>*c<rsub|3>+3*2<rsup|<frac|5|2>>|)>*s<rsub|3>|)>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>+<around*|(|9*2<rsup|<frac|5|2>>*c<rsub|3>+9*2<rsup|<frac|5|2>>|)>*s<rsub|3>*x<rsup|4>+<around*|(|25*2<rsup|<frac|7|2>>*c<rsub|3>+25*2<rsup|<frac|7|2>>|)>*s<rsub|3>*x<rsup|2>+<around*|(|41*2<rsup|<frac|5|2>>*c<rsub|3>+41*2<rsup|<frac|5|2>>|)>*s<rsub|3>|)>+<sqrt|x<rsup|2>+1>*<around*|(|<around*|(|-3456*c<rsub|3>-3456|)>*s<rsub|3>*x<rsup|6>+<around*|(|-22656*c<rsub|3>-22656|)>*s<rsub|3>*x<rsup|4>+<around*|(|-34944*c<rsub|3>-34944|)>*s<rsub|3>*x<rsup|2>+<around*|(|-15744*c<rsub|3>-15744|)>*s<rsub|3>|)>+<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|<around*|(|-1152*c<rsub|3>-1152|)>*s<rsub|3>*x<rsup|4>+<around*|(|-2304*c<rsub|3>-2304|)>*s<rsub|3>*x<rsup|2>+<around*|(|-1152*c<rsub|3>-1152|)>*s<rsub|3>|)>|)>|)>+41472*s<rsub|3><rsup|2>*x<rsup|10>+<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|13824*s<rsub|3><rsup|2>*x<rsup|8>+30720*s<rsub|3><rsup|2>*x<rsup|6>+<around*|(|-318464*s<rsub|3><rsup|2>-49152*c<rsub|3><rsup|2>-98304*c<rsub|3>-49152|)>*x<rsup|4>+<around*|(|-673792*s<rsub|3><rsup|2>+<around*|(|-262144*s<rsub|2><rsup|2>-98304|)>*c<rsub|3><rsup|2>+<around*|(|-524288*s<rsub|2><rsup|2>-196608|)>*c<rsub|3>-262144*s<rsub|2><rsup|2>-98304|)>*x<rsup|2>-338432*s<rsub|3><rsup|2>+<around*|(|-262144*s<rsub|2><rsup|2>-49152|)>*c<rsub|3><rsup|2>+<around*|(|-524288*s<rsub|2><rsup|2>-98304|)>*c<rsub|3>-262144*s<rsub|2><rsup|2>-49152|)>+281088*s<rsub|3><rsup|2>*x<rsup|8>+<sqrt|4608*x<rsup|6>+46592*x<rsup|4>+79360*x<rsup|2>+37376>*<around*|(|<sqrt|x<rsup|2>+1>*<around*|(|-27*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|6>-33*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|4>+15*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|2>+21*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>|)>+<sqrt|x<rsup|2>+1>*<sqrt|9*x<rsup|4>+82*x<rsup|2>+73>*<around*|(|-9*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>*x<rsup|4>+15*2<rsup|<frac|11|2>>*s<rsub|3><rsup|2>*x<rsup|2>+39*2<rsup|<frac|9|2>>*s<rsub|3><rsup|2>|)>|)>+<around*|(|775168*s<rsub|3><rsup|2>-147456*c<rsub|3><rsup|2>-294912*c<rsub|3>+1949696|)>*x<rsup|6>+<around*|(|1053696*s<rsub|3><rsup|2>+<around*|(|1310720*s<rsub|2><rsup|2>-966656|)>*c<rsub|3><rsup|2>+<around*|(|2621440*s<rsub|2><rsup|2>-1933312|)>*c<rsub|3>+1310720*s<rsub|2><rsup|2>+5324800|)>*x<rsup|4>+<around*|(|698880*s<rsub|3><rsup|2>+<around*|(|2621440*s<rsub|2><rsup|2>-1490944|)>*c<rsub|3><rsup|2>+<around*|(|5242880*s<rsub|2><rsup|2>-2981888|)>*c<rsub|3>+2621440*s<rsub|2><rsup|2>+4800512|)>*x<rsup|2>+180736*s<rsub|3><rsup|2>+<around*|(|1310720*s<rsub|2><rsup|2>-671744|)>*c<rsub|3><rsup|2>+<around*|(|2621440*s<rsub|2><rsup|2>-1343488|)>*c<rsub|3>+1310720*s<rsub|2><rsup|2>+1425408|2097152*x<rsup|4>+4194304*x<rsup|2>+2097152>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>131) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>