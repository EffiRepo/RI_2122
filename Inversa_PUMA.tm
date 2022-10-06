<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<doc-data|<doc-title|Robot PUMA - Cinematica
  Inversa>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>>>

  Calcolare la cinematica inversa del Robot PUMA utilizzando il comando
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
    <\output>
      \;
    </output>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      puma:[[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0],

      \ \ \ \ \ [q[4],L[4],-%pi/2,0],

      \ \ \ \ \ [q[5],0,%pi/2,0],

      \ \ \ \ \ [q[6],L[6],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|4>,L<rsub|4>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dr:expand(rename(DH(puma),1))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+c<rsub|1>*c<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|c<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>>|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|2>*c<rsub|3>*L<rsub|4>-D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:flatten([getEq(dr),s[1]^2+c[1]^2-1=0,s[2]^2+c[2]^2-1=0,s[3]^2+c[3]^2-1=0,s[4]^2+c[4]^2-1=0,s[5]^2+c[5]^2-1=0,s[6]^2+c[6]^2-1=0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|x+s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-c<rsub|1>*D<rsub|2>*c<rsub|2>=0,y-c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-s<rsub|1>*D<rsub|2>*c<rsub|2>=0,z+c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|2>*c<rsub|3>*L<rsub|4>+D<rsub|2>*s<rsub|2>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0,s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0,s<rsub|4><rsup|2>+c<rsub|4><rsup|2>-1=0,s<rsub|5><rsup|2>+c<rsub|5><rsup|2>-1=0,s<rsub|6><rsup|2>+c<rsub|6><rsup|2>-1=0|]>>>
    </unfolded-io>

    <\textput>
      <choice|<tformat|<table|<row|<cell|<math|x+s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-c<rsub|1>*D<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|y-c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-s<rsub|1>*D<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|z+c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|2>*c<rsub|3>*L<rsub|4>+D<rsub|2>*s<rsub|2>-L<rsub|1>=0>>>|<row|<cell|<math|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|4><rsup|2>+c<rsub|4><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|5><rsup|2>+c<rsub|5><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|6><rsup|2>+c<rsub|6><rsup|2>-1=0>>>>>>
    </textput>

    <\textput>
      <center|>
    </textput>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>