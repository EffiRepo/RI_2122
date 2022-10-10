<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<doc-data|<doc-title|Equazioni di Eulero
  Lagrange>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>>>

  Scrivere una procedura che dati in ingresso la tabella di
  Denavit-Hartenberg, le masse,gli attriti,le forze esterne e le informazioni
  utili al posizionamento dei baricentri dei corpi rigidi, calcoli le
  equazioni di Eulero-Lagrange.

  Le equazioni di Eulero-Lagrange si basano sul principio di
  Hamilton(principio di minimizzazione) in cui, note le espressioni
  dell'energia cinetica e potenziale, si calcolano le equazioni del moto e
  quindi permette di simulare il comportamento del sistema.

  Sia:

  <\equation*>
    T\<assign\>energia cinetica,U\<assign\>energia potenziale
  </equation*>

  Si definisce l'<with|font-series|bold|azione> come
  <math|<big|int><rsub|t<rsub|i>><rsup|t<rsub|f>>\<cal-L\>\<partial\>t> in
  cui <math|\<cal-L\>\<assign\>Lagrangiana=T-U>.

  Supponiamo di voler passare da <math|q<around*|(|t<rsub|i>|)>\<rightarrow\>q<around*|(|t<rsub|f>|)>>:

  Si possono percorrere innumerevoli traiettorie, tuttavia si dimostra che la
  traiettoria a costo minimo in <math|<around*|(|t<rsub|i>,t<rsub|f>|)>>
  coincide con <math|q<rsup|<wide|\<ast\>|\<dot\>>><around*|(|t|)>,cioè un
  punto di stazionarietà dell<rprime|'>integrale d<rprime|'>azione.>

  <with|font-series|bold|N.B.:>

  - Si definisce <with|font-series|bold|punto stazionario> un punto
  <math|f<around*|(|x|)>> t.c. <math|<frac|\<partial\>f|\<partial\>x>=0>.

  Inoltre ,effettuando lo sviluppo di Taylor della fuzione
  <math|y=f<around*|(|x|)>> che congiunge i punti dell'ipotesi.Si definisce
  <math|la variazione f<around*|(|x|)>-f<around*|(|x<rsub|0>|)>=\<partial\>y=J<around*|(|x<rsub|0>|)><around*|(|x-x<rsub|0>|)>>+<text-dots>
  in cui <math|<around*|(|x-x<rsub|0>|)>=\<partial\>x>. Quindi:

  <\equation*>
    \<partial\>y=J<around*|(|x|)>\<partial\>x
  </equation*>

  Si definisce un <with|font-series|bold|punto <math|x<rsup|\<ast\>> >di
  stazionarietà> se <math|\<partial\>y=0 \<forall\>\<partial\>x>.

  In altre parole, un punto è di stazionarietà se considerata una variazione
  nel codominio della funzione, ottengo una variazione nulla del dominio:

  <\equation*>
    J<around*|(|x<rsup|\<ast\>>|)>=0
  </equation*>

  Il principio di Hamilton afferma che il sistema si muove in maniera tale
  che:

  <\equation*>
    \<partial\>J=0<space|2em>\<forall\>q
  </equation*>

  Da cui si ottengono le equazioni di Eulero-Lagrange.Esse tengono conto del
  tipo di sistema che si sta considerando:

  -<strong|Sistemi conservativi(assenza di forze esterne e forze d'attrito):>

  <\equation*>
    <frac|\<mathd\>|dt><frac|\<partial\>L|\<partial\><wide|q|\<dot\>>>-<frac|\<partial\>L|\<partial\>q>=0
  </equation*>

  -<with|font-series|bold|Sistemi non conservativi(presenza di forze
  esterne):>

  <\equation*>
    <frac|\<mathd\>|dt><frac|\<partial\>L|\<partial\><wide|q|\<dot\>>>-<frac|\<partial\>L|\<partial\>q>=u<rsup|T>
  </equation*>

  Il vettore <math|u<rsup|T> >rappresenta le forze esterne agenti lungo la
  direzione di <math|q>.

  In generale, per ottenere l'equazione di un qualsiasi moto, occorre
  considerare anche la presenza delle forze di attrito. Si ottiene:

  <\equation*>
    <frac|\<mathd\>|dt><frac|\<partial\>L|\<partial\><wide|q|\<dot\>>>-<frac|\<partial\>L|\<partial\>q>+<frac|\<partial\>\<bbb-F\>|\<partial\><wide|q|\<dot\>>>=u<rsup|T>
  </equation*>

  In cui <math|\<bbb-F\>=<frac|1|2><wide|q|\<dot\>><rsup|T>*F*<wide|q|\<dot\>>>,
  <math|F\<succeq\>0>.

  <\session|maxima|default>
    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      euleroLagrange(tab,M,F,u,Trsz):=block(

      [T,U,l,dFdq,dldq,dldv,dtdldv,eq:[],solEL:[],a:[a[1],a[2],a[3],a[4],a[5],a[6]],v,q],

      /*T:energiacinetica,U:energiapotenzialegravitazionale*/

      /*F:attritostatico,dLdq:derivatadiLrispettoq*/

      /*dLddq:derivatadiLrispettoaqpunto,e:energia*/

      /*q:variabilidigiunto*/

      /*EL:equazionieulerolagrange*/

      [T,U]:energia(tab,M,Trsz,2),

      l:T-U,

      dof:size(tab)[1],

      for i:1 thru dof do(

      dldv:dev(l,v[i]),

      dldq:dev(l,q[i]),

      dFdv:dev(F,v[i]),

      dtdldv:dev(dldv,t),

      eq:flatten(append(eq,[dtdldv-dldq+dFdv-u[i,1]])),

      solEL:flatten(append(solEL,[factor(ratsimp(solve(eq[i],a[i])))]))

      ),

      return(rename([eq,solEL],0))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      DH:[matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),

      matrix([0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,L[3]]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,%pi/2,D[2]],[0,q[3],0,0]),

      matrix([q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|D<rsub|3>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      Trsz:[matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),

      matrix([0,L[1]/2,0],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,0,-L[1]/2],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([-D[1]/2,0,-L[1]/2],[-D[2]/2,0,0],[0,0,L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[0,0,-L[3]/2]),

      matrix([0,L[1]/2,0],[0,-L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[-D[3]/2,0,0])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|L<rsub|1>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>|2>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|D<rsub|1>|2>>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|-<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|D<rsub|3>|2>>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|2 DOF>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      dueDof:DH[1]

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      Mdd:[M[1],M[2]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|[|M<rsub|1>,M<rsub|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      udd:matrix([u[1]],[u[2]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      Fdd:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      dd:euleroLagrange(dueDof,Mdd,Fdd,udd,Trsz[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|z1>>+L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>+L<rsub|1><rsup|2>*M<rsub|2>+<frac|L<rsub|1><rsup|2>*M<rsub|1>|4>|)>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>-L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>|)>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|1>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+D<rsub|2>*v<rsub|2>-u<rsub|2>+<frac|L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*s<rsub|2>|2>|]>,<around*|[|a<rsub|1>=-<frac|4*a<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>-2*L<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2><rsup|2>-4*L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>+2*L<rsub|1>*L<rsub|2>*M<rsub|2>*a<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>*M<rsub|2>*a<rsub|2>+4*D<rsub|1>*v<rsub|1>-4*u<rsub|1>|4*I<rsub|<with|math-font-family|rm|z2>>+4*I<rsub|<with|math-font-family|rm|z1>>+4*L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+L<rsub|2><rsup|2>*M<rsub|2>+4*L<rsub|1><rsup|2>*M<rsub|2>+L<rsub|1><rsup|2>*M<rsub|1>>,a<rsub|2>=-<frac|4*a<rsub|1>*I<rsub|<with|math-font-family|rm|z2>>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>+2*L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*s<rsub|2>+2*L<rsub|1>*a<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+a<rsub|1>*L<rsub|2><rsup|2>*M<rsub|2>|4*I<rsub|<with|math-font-family|rm|z2>>+L<rsub|2><rsup|2>*M<rsub|2>>|]>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Cartesiano>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      cartes:DH[2]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Mcart:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      ucart:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Fcart:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      cart:euleroLagrange(cartes,Mcart,Fcart,ucart,Trsz[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|M<rsub|3>+M<rsub|2>+M<rsub|1>|)>-10*M<rsub|3>-10*M<rsub|2>+D<rsub|1>*v<rsub|1>-u<rsub|1>-10*M<rsub|1>,a<rsub|2>*<around*|(|M<rsub|3>+M<rsub|2>|)>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>,M<rsub|3>*a<rsub|3>-u<rsub|3>|]>,<around*|[|a<rsub|1>=<frac|10*M<rsub|3>+10*M<rsub|2>-D<rsub|1>*v<rsub|1>+u<rsub|1>+10*M<rsub|1>|M<rsub|3>+M<rsub|2>+M<rsub|1>>,a<rsub|2>=-<frac|v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>|M<rsub|3>+M<rsub|2>>,a<rsub|3>=<frac|u<rsub|3>|M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Cilindrico>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      cilin:DH[3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      Mc:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      uc:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      Fc:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      cil:euleroLagrange(cilin,Mc,Fc,uc,Trsz[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|I<rsub|<with|math-font-family|rm|z1>>+I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>|)>+<around*|(|2*v<rsub|1>*M<rsub|3>*q<rsub|3>-v<rsub|1>*L<rsub|3>*M<rsub|3>|)>*v<rsub|3>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|2>*<around*|(|M<rsub|3>+M<rsub|2>|)>-10*M<rsub|3>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>-10*M<rsub|2>,-u<rsub|3>-v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3>+M<rsub|3>*a<rsub|3>+<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>|2>|]>,<around*|[|a<rsub|1>=-<frac|4*<around*|(|2*v<rsub|1>*M<rsub|3>*q<rsub|3>*v<rsub|3>-v<rsub|1>*L<rsub|3>*M<rsub|3>*v<rsub|3>+D<rsub|1>*v<rsub|1>-u<rsub|1>|)>|4*I<rsub|<with|math-font-family|rm|z1>>+4*I<rsub|<with|math-font-family|rm|y3>>+4*I<rsub|<with|math-font-family|rm|y2>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>>,a<rsub|2>=<frac|10*M<rsub|3>-v<rsub|2>*D<rsub|3>-D<rsub|2>*v<rsub|2>+u<rsub|2>+10*M<rsub|2>|M<rsub|3>+M<rsub|2>>,a<rsub|3>=<frac|2*u<rsub|3>+2*v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>|2*M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|SCARA>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      scara:DH[4]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      Ms:[M[1],M[2],M[3]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      us:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      Fs:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      scar:euleroLagrange(scara,Ms,Fs,us,Trsz[4])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|<around*|[|a<rsub|1>*<around*|(|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|z1>>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*M<rsub|3>+D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>+D<rsub|1><rsup|2>*M<rsub|2>+<frac|D<rsub|1><rsup|2>*M<rsub|1>|4>|)>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-D<rsub|1>*s<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>-2*D<rsub|1>*v<rsub|1>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2>*M<rsub|3>-2*D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*M<rsub|3>-<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>-D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>|)>+D<rsub|1>*v<rsub|1>-u<rsub|1>,a<rsub|1>*<around*|(|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2>*<around*|(|-D<rsub|1>*v<rsub|1>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*M<rsub|3>-<frac|D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>|2>|)>+D<rsub|1>*v<rsub|1>*s<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*v<rsub|1><rsup|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2>*M<rsub|3>+D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2>*M<rsub|3>+v<rsub|2>*D<rsub|3>+<frac|D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>|2>+D<rsub|2>*v<rsub|2>-u<rsub|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*s<rsub|2>|2>,-u<rsub|3>+M<rsub|3>*a<rsub|3>-10*M<rsub|3>|]>,<around*|[|a<rsub|1>=-<frac|4*a<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+4*a<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>+4*a<rsub|2>*L<rsub|3><rsup|2>*M<rsub|3>-4*D<rsub|1>*s<rsub|2>*v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>-8*D<rsub|1>*v<rsub|1>*s<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|1>*a<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>+8*D<rsub|2>*a<rsub|2>*L<rsub|3>*M<rsub|3>-4*D<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2><rsup|2>*M<rsub|3>-8*D<rsub|1>*v<rsub|1>*D<rsub|2>*s<rsub|2>*v<rsub|2>*M<rsub|3>+4*D<rsub|1>*D<rsub|2>*a<rsub|2>*c<rsub|2>*M<rsub|3>+4*D<rsub|2><rsup|2>*a<rsub|2>*M<rsub|3>-2*D<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2><rsup|2>-4*D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*s<rsub|2>*v<rsub|2>+2*D<rsub|1>*D<rsub|2>*M<rsub|2>*a<rsub|2>*c<rsub|2>+D<rsub|2><rsup|2>*M<rsub|2>*a<rsub|2>+4*D<rsub|1>*v<rsub|1>-4*u<rsub|1>|4*I<rsub|<with|math-font-family|rm|z3>>+4*I<rsub|<with|math-font-family|rm|z2>>+4*I<rsub|<with|math-font-family|rm|z1>>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+8*D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+4*D<rsub|1><rsup|2>*M<rsub|3>+4*D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+D<rsub|2><rsup|2>*M<rsub|2>+4*D<rsub|1><rsup|2>*M<rsub|2>+D<rsub|1><rsup|2>*M<rsub|1>>,a<rsub|2>=-<frac|4*a<rsub|1>*I<rsub|<with|math-font-family|rm|z3>>+4*a<rsub|1>*I<rsub|<with|math-font-family|rm|z2>>+4*a<rsub|1>*L<rsub|3><rsup|2>*M<rsub|3>+4*D<rsub|1>*v<rsub|1><rsup|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|1>*a<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+8*a<rsub|1>*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2>*M<rsub|3>+4*D<rsub|1>*a<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+4*a<rsub|1>*D<rsub|2><rsup|2>*M<rsub|3>+4*v<rsub|2>*D<rsub|3>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>+2*D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*s<rsub|2>+2*D<rsub|1>*a<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+a<rsub|1>*D<rsub|2><rsup|2>*M<rsub|2>|4*I<rsub|<with|math-font-family|rm|z3>>+4*I<rsub|<with|math-font-family|rm|z2>>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>>,a<rsub|3>=<frac|u<rsub|3>+10*M<rsub|3>|M<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Sferico (di primo tipo)>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      sferI:DH[5]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      M:[m[1],m[2],m[3]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|m<rsub|1>,m<rsub|2>,m<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      uI:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      F:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      elSfer:euleroLagrange(sferI,M,F,uI,Trsz[5])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><around*|[|<around*|[|v<rsub|2>*<around*|(|-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>-2*v<rsub|1>*D<rsub|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+2*v<rsub|1>*D<rsub|2>*c<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+<frac|v<rsub|1>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>|2>+v<rsub|1>*D<rsub|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-v<rsub|1>*D<rsub|2>*c<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-2*v<rsub|1>*D<rsub|2><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>-<frac|v<rsub|1>*D<rsub|2><rsup|2>*c<rsub|2>*m<rsub|2>*s<rsub|2>|2>|)>+a<rsub|1>*<around*|(|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|y1>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+2*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*m<rsub|3>|4>-D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>+D<rsub|2><rsup|2>*m<rsub|3>+<frac|D<rsub|2><rsup|2>*c<rsub|2><rsup|2>*m<rsub|2>|4>|)>+<around*|(|2*v<rsub|1>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|1>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>+2*v<rsub|1>*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>|)>*v<rsub|3>+D<rsub|1>*v<rsub|1>-u<rsub|1>,v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+m<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*m<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*m<rsub|3>|4>+D<rsub|2><rsup|2>*m<rsub|3>+<frac|D<rsub|2><rsup|2>*m<rsub|2>|4>|)>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>+<around*|(|2*v<rsub|2>*m<rsub|3>*q<rsub|3>-v<rsub|2>*L<rsub|3>*m<rsub|3>|)>*v<rsub|3>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-10*s<rsub|2>*m<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-D<rsub|2>*a<rsub|3>*m<rsub|3>-<frac|v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>|4>-<frac|v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>+5*s<rsub|2>*L<rsub|3>*m<rsub|3>+<frac|v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>-10*D<rsub|2>*c<rsub|2>*m<rsub|3>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*c<rsub|2>*m<rsub|2>*s<rsub|2>|4>-5*D<rsub|2>*c<rsub|2>*m<rsub|2>,-u<rsub|3>-v<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+a<rsub|3>*m<rsub|3>+<frac|v<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>-v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>+10*c<rsub|2>*m<rsub|3>-D<rsub|2>*a<rsub|2>*m<rsub|3>|]>,<around*|[|a<rsub|1>=<frac|2*<around*|(|4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>-4*v<rsub|1>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>*v<rsub|3>+2*v<rsub|1>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*v<rsub|3>-4*v<rsub|1>*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*v<rsub|3>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+4*v<rsub|1>*D<rsub|2>*s<rsub|2><rsup|2>*v<rsub|2>*m<rsub|3>*q<rsub|3>-4*v<rsub|1>*D<rsub|2>*c<rsub|2><rsup|2>*v<rsub|2>*m<rsub|3>*q<rsub|3>-v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>-2*v<rsub|1>*D<rsub|2>*s<rsub|2><rsup|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>+2*v<rsub|1>*D<rsub|2>*c<rsub|2><rsup|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>+4*v<rsub|1>*D<rsub|2><rsup|2>*c<rsub|2>*s<rsub|2>*v<rsub|2>*m<rsub|3>+v<rsub|1>*D<rsub|2><rsup|2>*c<rsub|2>*m<rsub|2>*s<rsub|2>*v<rsub|2>-2*D<rsub|1>*v<rsub|1>+2*u<rsub|1>|)>|4*c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+4*c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+4*I<rsub|<with|math-font-family|rm|y1>>+4*s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+4*s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+4*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3><rsup|2>-4*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+8*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3>+s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*m<rsub|3>-4*D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>-4*D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>+4*D<rsub|2><rsup|2>*m<rsub|3>+D<rsub|2><rsup|2>*c<rsub|2><rsup|2>*m<rsub|2>>,a<rsub|2>=-<frac|4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>+8*v<rsub|2>*m<rsub|3>*q<rsub|3>*v<rsub|3>-4*v<rsub|2>*L<rsub|3>*m<rsub|3>*v<rsub|3>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+4*v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-40*s<rsub|2>*m<rsub|3>*q<rsub|3>-4*v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-4*D<rsub|2>*a<rsub|3>*m<rsub|3>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>-2*v<rsub|1><rsup|2>*D<rsub|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>+20*s<rsub|2>*L<rsub|3>*m<rsub|3>+2*v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>+4*v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>-40*D<rsub|2>*c<rsub|2>*m<rsub|3>+4*v<rsub|2>*D<rsub|3>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>+v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*c<rsub|2>*m<rsub|2>*s<rsub|2>-20*D<rsub|2>*c<rsub|2>*m<rsub|2>|4*I<rsub|<with|math-font-family|rm|y3>>+4*I<rsub|<with|math-font-family|rm|y2>>+4*m<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*m<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*m<rsub|3>+4*D<rsub|2><rsup|2>*m<rsub|3>+D<rsub|2><rsup|2>*m<rsub|2>>,a<rsub|3>=<frac|2*u<rsub|3>+2*v<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+2*v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>+2*v<rsub|1><rsup|2>*D<rsub|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>-20*c<rsub|2>*m<rsub|3>+2*D<rsub|2>*a<rsub|2>*m<rsub|3>|2*m<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Sferico II - Stanford>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      sferII:DH[6]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      M:[m[1],m[2],m[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|m<rsub|1>,m<rsub|2>,m<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      uII:matrix([u[1]],[u[2]],[u[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><matrix|<tformat|<table|<row|<cell|u<rsub|1>>>|<row|<cell|u<rsub|2>>>|<row|<cell|u<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      F:(1/2)*D[1]*v[1]^2+(1/2)*D[2]*v[2]^2+(1/2)*D[3]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><frac|v<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|D<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      elSferII:euleroLagrange(sferII,M,F,uII,Trsz[6])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|<around*|[|v<rsub|2>*<around*|(|-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>-L<rsub|2>*c<rsub|2>*m<rsub|3>*v<rsub|3>+2*v<rsub|1>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>-2*v<rsub|1>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+L<rsub|2>*s<rsub|2>*v<rsub|2>*m<rsub|3>*q<rsub|3>+<frac|v<rsub|1>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>|2>-<frac|L<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>|2>|)>+a<rsub|1>*<around*|(|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|y1>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*m<rsub|3>|4>+L<rsub|2><rsup|2>*m<rsub|3>+<frac|L<rsub|2><rsup|2>*m<rsub|2>|4>|)>+<around*|(|2*v<rsub|1>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|1>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-L<rsub|2>*c<rsub|2>*v<rsub|2>*m<rsub|3>|)>*v<rsub|3>+a<rsub|2>*<around*|(|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*m<rsub|3>|2>-L<rsub|2>*c<rsub|2>*m<rsub|3>*q<rsub|3>|)>-L<rsub|2>*s<rsub|2>*a<rsub|3>*m<rsub|3>+D<rsub|1>*v<rsub|1>-u<rsub|1>,v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>+a<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+m<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*m<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*m<rsub|3>|4>|)>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>+<around*|(|2*v<rsub|2>*m<rsub|3>*q<rsub|3>-v<rsub|2>*L<rsub|3>*m<rsub|3>-v<rsub|1>*L<rsub|2>*c<rsub|2>*m<rsub|3>|)>*v<rsub|3>+v<rsub|1>*L<rsub|2>*c<rsub|2>*m<rsub|3>*v<rsub|3>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+v<rsub|2>*<around*|(|v<rsub|1>*L<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3>-<frac|v<rsub|1>*L<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>|2>|)>+a<rsub|1>*<around*|(|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*m<rsub|3>|2>-L<rsub|2>*c<rsub|2>*m<rsub|3>*q<rsub|3>|)>+v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>-v<rsub|1>*L<rsub|2>*s<rsub|2>*v<rsub|2>*m<rsub|3>*q<rsub|3>+10*s<rsub|2>*m<rsub|3>*q<rsub|3>-<frac|v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>|4>+<frac|v<rsub|1>*L<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>|2>-5*s<rsub|2>*L<rsub|3>*m<rsub|3>+v<rsub|2>*D<rsub|3>+D<rsub|2>*v<rsub|2>-u<rsub|2>,-u<rsub|3>-v<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+a<rsub|3>*m<rsub|3>+<frac|v<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>|2>-a<rsub|1>*L<rsub|2>*s<rsub|2>*m<rsub|3>-10*c<rsub|2>*m<rsub|3>|]>,<around*|[|a<rsub|1>=<frac|2*<around*|(|4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>-4*v<rsub|1>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>*v<rsub|3>+2*v<rsub|1>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*v<rsub|3>+4*L<rsub|2>*c<rsub|2>*v<rsub|2>*m<rsub|3>*v<rsub|3>-4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+4*v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>-2*L<rsub|2>*s<rsub|2>*v<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+2*L<rsub|2>*a<rsub|2>*c<rsub|2>*m<rsub|3>*q<rsub|3>+2*L<rsub|2>*s<rsub|2>*a<rsub|3>*m<rsub|3>-v<rsub|1>*c<rsub|2>*s<rsub|2>*v<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>+L<rsub|2>*s<rsub|2>*v<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-L<rsub|2>*a<rsub|2>*c<rsub|2>*L<rsub|3>*m<rsub|3>-2*D<rsub|1>*v<rsub|1>+2*u<rsub|1>|)>|4*c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+4*c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+4*I<rsub|<with|math-font-family|rm|y1>>+4*s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+4*s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+4*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3><rsup|2>-4*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*m<rsub|3>+4*L<rsub|2><rsup|2>*m<rsub|3>+L<rsub|2><rsup|2>*m<rsub|2>>,a<rsub|2>=-<frac|4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z3>>+4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|z2>>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x3>>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*I<rsub|<with|math-font-family|rm|x2>>+8*v<rsub|2>*m<rsub|3>*q<rsub|3>*v<rsub|3>-4*v<rsub|2>*L<rsub|3>*m<rsub|3>*v<rsub|3>-4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*m<rsub|3>*q<rsub|3><rsup|2>+4*v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*m<rsub|3>*q<rsub|3>+40*s<rsub|2>*m<rsub|3>*q<rsub|3>-4*a<rsub|1>*L<rsub|2>*c<rsub|2>*m<rsub|3>*q<rsub|3>-v<rsub|1><rsup|2>*c<rsub|2>*s<rsub|2>*L<rsub|3><rsup|2>*m<rsub|3>-20*s<rsub|2>*L<rsub|3>*m<rsub|3>+2*a<rsub|1>*L<rsub|2>*c<rsub|2>*L<rsub|3>*m<rsub|3>+4*v<rsub|2>*D<rsub|3>+4*D<rsub|2>*v<rsub|2>-4*u<rsub|2>|4*I<rsub|<with|math-font-family|rm|y3>>+4*I<rsub|<with|math-font-family|rm|y2>>+4*m<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*m<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*m<rsub|3>>,a<rsub|3>=<frac|2*u<rsub|3>+2*v<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>+2*v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*m<rsub|3>*q<rsub|3>-v<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>-v<rsub|1><rsup|2>*s<rsub|2><rsup|2>*L<rsub|3>*m<rsub|3>+2*a<rsub|1>*L<rsub|2>*s<rsub|2>*m<rsub|3>+20*c<rsub|2>*m<rsub|3>|2*m<rsub|3>>|]>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|input>
      \;
    </input>
  </session>

  \;

  <nbsp>

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>