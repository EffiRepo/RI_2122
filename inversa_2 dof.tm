<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<doc-data|<doc-title|Robot 2DOF Cinematica
  Inversa>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>>>

  Calcolare la cinematica inversa del robot 2DOF RR utilizzando il comando
  Maxima eliminate().

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
    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      assume(L[1]\<gtr\>0,L[2]\<gtr\>0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|L<rsub|1>\<gtr\>0,L<rsub|2>\<gtr\>0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      duedof:[[q[1],0,0,L[1]],[q[2],0,0,L[2]]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,L<rsub|2>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      dh:rename(DH(duedof),1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|-c<rsub|1>*s<rsub|2>-s<rsub|1>*c<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<around*|[|<matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|-s<rsub|1>>|<cell|0>|<cell|L<rsub|1>*c<rsub|1>>>|<row|<cell|s<rsub|1>>|<cell|c<rsub|1>>|<cell|0>|<cell|L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|-c<rsub|1>*s<rsub|2>-s<rsub|1>*c<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+L<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|0>|<cell|L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+L<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      getEq(M):=block(

      [X,Y,Z,dim:size(M),eq],

      eq:[0,0,0], \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

      if matrixp(M) and dim = [4,4] then(

      \ \ eq[1]:X-M[1,4]=0,

      \ \ eq[2]:Y-M[2,4]=0,

      \ \ eq[3]:Z-M[3,4]=0

      ) else (

      \ \ error("insert DH matrix")

      ),

      \ \ return(eq)

      )$
    </input>

    <\textput>
      Prendo equazioni dalla cinematica diretta
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      eq:flatten([getEq(dh[1]),c[1]^2+s[1]^2-1=0,c[2]^2+s[2]^2-1=0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|X-L<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>-L<rsub|1>*c<rsub|1>=0,Y-L<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>-L<rsub|1>*s<rsub|1>=0,Z=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0|]>>>
    </unfolded-io>

    <\textput>
      Elimino una variabile trigonometrica
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      res:eliminate([eq[1],eq[2],eq[5],eq[4]],[s[1],c[1],s[2]])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>L<rsub|2><rsup|8>*<around*|(|2*L<rsub|1>*L<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|4>*<around*|(|c<rsub|2><rsup|2>-1|)><rsup|4>*<around*|(|Y<rsup|2>+X<rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|4>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      part(res,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|(|Y<rsup|2>+X<rsup|2>-2*L<rsub|1>*L<rsub|2>*c<rsub|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|4>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      C2:solve(part(res,4),[c[2]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|c<rsub|2>=<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      C2:map(rhs,C2)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      S2:sqrt(1-C2^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>>>
    </unfolded-io>

    <\textput>
      <math|q<rsub|2>> è ora noto:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      q2:[atan2(S2,C2),atan2(-S2,C2)]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>,-<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|2>|4*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|2*L<rsub|1>*L<rsub|2>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Calcoliamo <math|q<rsub|1>> assumendo di conoscere <math|q<rsub|2>>,
      quindi eliminiamo anche le variabili trigonometriche appena calcolate.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      eqq:facsum(ratsimp(expand(subst([s[2]=S2,c[2]=C2],[eq[1],eq[2],eq[5]]))),[s[1],c[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|<frac|s<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>-c<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)>+2*L<rsub|1>*X|2*L<rsub|1>>=0,-<frac|c<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>+s<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)>-2*L<rsub|1>*Y|2*L<rsub|1>>=0,0=0|]>>>
    </unfolded-io>

    <\textput>
      Osservo che le equazioni risultanti dipendono da entrambe le variabili
      trigonometriche in <math|q<rsub|1>>, quindi risolvo contemporaneamente.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      ss:map(rhs,flatten(solve([eqq[1],eqq[2]],[s[1],c[1]])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|-<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>-Y<rsup|3>+<around*|(|-X<rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)>*Y|2*L<rsub|1>*Y<rsup|2>+2*L<rsub|1>*X<rsup|2>>,<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>+X*Y<rsup|2>+X<rsup|3>+<around*|(|L<rsub|1><rsup|2>-L<rsub|2><rsup|2>|)>*X|2*L<rsub|1>*Y<rsup|2>+2*L<rsub|1>*X<rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      qq1:atan2(ss[1],ss[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >>-<math-up|atan2><around*|(|<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>-Y<rsup|3>+<around*|(|-X<rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)>*Y|2*L<rsub|1>*Y<rsup|2>+2*L<rsub|1>*X<rsup|2>>,<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*L<rsub|2><rsup|2>+2*L<rsub|1><rsup|2>|)>*X<rsup|2>-L<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*L<rsub|2><rsup|2>-L<rsub|1><rsup|4>>+X*Y<rsup|2>+X<rsup|3>+<around*|(|L<rsub|1><rsup|2>-L<rsub|2><rsup|2>|)>*X|2*L<rsub|1>*Y<rsup|2>+2*L<rsub|1>*X<rsup|2>>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
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