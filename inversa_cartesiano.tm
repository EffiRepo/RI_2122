<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<doc-data|<doc-title|Robot Cartesiano - Cinematica
  Inversa>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>>>

  Calcolare la cinematica inversa del Robot Cartesiano utilizzando il comando
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