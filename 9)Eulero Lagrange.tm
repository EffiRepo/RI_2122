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

  <\center>
    <with|font-series|bold|Massa molla smorzatore>
  </center>

  <center|<image|<tuple|<#89504E470D0A1A0A0000000D494844520000028A00000098080600000063F5C835000000017352474200AECE1CE9000039EF744558746D7866696C65002533436D7866696C652533452533436469616772616D2532306964253344253232767A374D7642756162745F536C594D354279497A2532322532306E616D65253344253232506167696E612D312532322533452533436D7847726170684D6F64656C2532306478253344253232363931253232253230647925334425323235353225323225323067726964253344253232312532322532306772696453697A65253344253232313025323225323067756964657325334425323231253232253230746F6F6C7469707325334425323231253232253230636F6E6E656374253344253232312532322532306172726F777325334425323231253232253230666F6C64253344253232312532322532307061676525334425323231253232253230706167655363616C652533442532323125323225323070616765576964746825334425323238323725323225323070616765486569676874253344253232313136392532322532306D61746825334425323230253232253230736861646F7725334425323230253232253345253343726F6F742533452533436D7843656C6C2532306964253344253232302532322532462533452533436D7843656C6C253230696425334425323231253232253230706172656E74253344253232302532322532462533452533436D7843656C6C25323069642533442532323225323225323076616C75652533442532322532322532307374796C65253344253232726F756E64656425334430253342776869746553706163652533447772617025334268746D6C2533443125334266696C6C436F6C6F7225334425323330303030303025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323238302532322532307925334425323232303025323225323077696474682533442532323130253232253230686569676874253344253232313130253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323325323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533426578697458253344312533426578697459253344302E323525334265786974447825334430253342657869744479253344302533422532322532306564676525334425323231253232253230706172656E7425334425323231253232253230736F75726365253344253232322532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323730253232253230792533442532323237302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313730253232253230792533442532323232382532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323525323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313730253232253230792533442532323232382532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313830253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323625323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313930253232253230792533442532323233382532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313830253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323725323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313930253232253230792533442532323233382532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323030253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323825323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323130253232253230792533442532323234302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323030253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C25323069642533442532323925323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323130253232253230792533442532323234302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232313025323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323330253232253230792533442532323232382532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323231302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232313125323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533426578697458253344312533426578697459253344302E323525334265786974447825334430253342657869744479253344302533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323330253232253230792533442532323232382532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232333130253232253230792533442532323232382E352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232313225323225323076616C75652533442532322532322532307374796C65253344253232726F756E64656425334430253342776869746553706163652533447772617025334268746D6C2533443125334266696C6C436F6C6F722533446E6F6E6525334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323233313025323225323079253344253232323030253232253230776964746825334425323236302532322532306865696768742533442532323630253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232313325323225323076616C75652533442532324D312532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323233313025323225323079253344253232323135253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323225323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533426578697458253344312533426578697459253344302E373525334265786974447825334430253342657869744479253344302533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E74253230782533442532323930253232253230792533442532323238352E352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313630253232253230792533442532323238362532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323325323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323330302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313630253232253230792533442532323237302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323425323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323237302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323237302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323525323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323330302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323330302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323625323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313733253232253230792533442532323238352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323630253232253230792533442532323238352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323725323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323330302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232313630253232253230792533442532323237302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323825323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323237302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323237302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232323925323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313630253232253230792533442532323330302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323230253232253230792533442532323330302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232333025323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232313733253232253230792533442532323238352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232323630253232253230792533442532323238352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232333125323225323076616C75652533442532324B312532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323231373025323225323079253344253232313830253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232343925323225323076616C756525334425323244312532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323231363025323225323079253344253232333030253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232353525323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232323630253232253230792533442532323238352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232353630253232253230792533442532323238352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232353625323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533426578697458253344312533426578697459253344302E323525334265786974447825334430253342657869744479253344302533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232333730253232253230792533442532323233322E352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232343530253232253230792533442532323233332532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232353725323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232343530253232253230792533442532323233332532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232343630253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232353825323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232343730253232253230792533442532323234332532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232343630253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232353925323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232343730253232253230792533442532323234332532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232343830253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363025323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232343930253232253230792533442532323234352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232343830253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363125323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232343930253232253230792533442532323234352532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232353030253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363225323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232353130253232253230792533442532323233332532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232353030253232253230792533442532323231352532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363325323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F772533446E6F6E6525334268746D6C253344312533426578697458253344312533426578697459253344302E323525334265786974447825334430253342657869744479253344302533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232353130253232253230792533442532323233332532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232353630253232253230792533442532323233342532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363425323225323076616C75652533442532324B322532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323234353025323225323079253344253232313835253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363625323225323076616C75652533442532322532322532307374796C65253344253232726F756E64656425334430253342776869746553706163652533447772617025334268746D6C2533443125334266696C6C436F6C6F722533446E6F6E6525334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323235363025323225323079253344253232323130253232253230776964746825334425323239302532322532306865696768742533442532323930253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363725323225323076616C75652533442532324D322532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323235373525323225323079253344253232323430253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363825323225323076616C75652533442532322532322532307374796C65253344253232656E644172726F77253344636C617373696325334268746D6C253344312533422532322532306564676525334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D6574727925323077696474682533442532323530253232253230686569676874253344253232353025323225323072656C617469766525334425323231253232253230617325334425323267656F6D657472792532322533452533436D78506F696E7425323078253344253232363530253232253230792533442532323236302532322532306173253344253232736F75726365506F696E742532322532462533452533436D78506F696E7425323078253344253232373230253232253230792533442532323236302532322532306173253344253232746172676574506F696E742532322532462533452533432532466D7847656F6D657472792533452533432532466D7843656C6C2533452533436D7843656C6C2532306964253344253232363925323225323076616C7565253344253232752532322532307374796C652533442532327465787425334268746D6C253344312533427374726F6B65436F6C6F722533446E6F6E6525334266696C6C436F6C6F722533446E6F6E65253342616C69676E25334463656E746572253342766572746963616C416C69676E2533446D6964646C652533427768697465537061636525334477726170253342726F756E6465642533443025334225323225323076657274657825334425323231253232253230706172656E74253344253232312532322533452533436D7847656F6D657472792532307825334425323236363025323225323079253344253232323330253232253230776964746825334425323236302532322532306865696768742533442532323330253232253230617325334425323267656F6D657472792532322532462533452533432532466D7843656C6C253345253343253246726F6F742533452533432532466D7847726170684D6F64656C2533452533432532466469616772616D2533452533432532466D7866696C6525334559AB5122000016FB49444154785EEDDD5DC82D551DC7F15F4685519E484A4AD0B28BE35591BD4085BD11114551197A712A102AA3A290201153EB9899BD702230B217824EE7C2C8D2DEA088A854BAD00CBAF322AB0B8B4AC5173052B2F8D78C4DDBD97BD6CC7FD6DA6BE6FFDD70109F67D69AB53E6B3DF3FC9E597BCD7E8C782180000208208000020820D023F018541040000104104000010410E8132028322F104000010410400001047A05088A4C0C0410400001041040000182227300010410400001041040205D803B8AE9561C89000208208000020884122028861A6E3A8B0002082080000208A40B1014D3AD38120104104000010410082540500C35DC7416010410400001041048172028A65B71240208208000020820104A80A0B88EE13E28E90B923E28E9B6A64BF6B56B245D2BE9B24E372F9674BBA463EBE83ABD40000104104000815C0204C55CB265EBDD0C8A6D487CBFA49B3642E261496F2728961D20CE860002082080C01205088A4B1CB547B7B91B14EF6C42A0DD456C43E2F1928E48BAA329CA1DC5758C3BBD40000104104020AB0041312B6FB1CADBA068770B6D69F9E88E3B862C3D171B164E840002082080C0B205088ACB1EBFB6F5ED52F3F39A2FEC5A5A2628AE63CCE905020820800002D905088AD9898B9CA00D8A9F91744BB38965F3FD896D43088A4586849320B01A81A1CD729F6DDEDA725ED3E3AB259D2FE9EFAB11A0230804162028AE63F0372FE42F6B96A00F49BA6BA38B04C5758C39BD40A094C0D06639BBCED8CB9EA4D0BE1FFA0636CC951A1ECE83405E0182625EDF52B5F7FDC56F81F0E49EBFEC098AA54685F320B00E81A1CD729BBDB4E078267715D731F8F4020182E23AE6405F503CB1F98BFE0F1B176C82E23AC69C5E20504A60CC66396B935D63ECD57D7E6BA9B6721E0410985980A0383328D5218000022B1318B3596ED7DB5E56C642771088216041F15F23BA4AB01C81C5A1083804C6FC5C3A4E535551AE2F550DC7238D49DD2C6721F12A49E7743E21AACE1ED12A041048162028265371200245052C28460A4ED1FA5B7432394F96B259CEDE97F80E497D1BE89CA7A7380208EC5380A0B84F7DCE8DC0768168C1295A7F9734F78736CB9DB1E3290B4BEA276D4500811E018222D302813A05A205A768FDAD73D6F5B76A68B3DC5F3B1B58DA1A7896E2924698B622B04380A0C8F440A04E8168C1295A7FEB9C75B40A010410D8102028322510A853205A708AD6DF3A671DAD42000104088ACC01041621102D3845EBEF2226218D44000104B8A3C81C40A04E8168C1295A7FEB9C75B40A010410E08E227300814508440B4ED1FABB8849482311400001EE28320710A853205A708AD6DF3A671DAD42000104B8A358F51C7896A4AF4B7AB3A47B6768E90149D7497A93A4FB67A8EFC992BE27E95C49F619D2BCF209440B4ED1FA9B6FE650F39204227E02D3BEC627D20718CC6ACC1DC55939DD957D55D24B247D5ED257DCB549EF9674A9A40B251D9DA13EFBE4858B24DD28E95D33D44715DB05A205A768FD65EE236002CCFB32F30067873341D1813773510B88D74AFA7073C7EEB533D4FF93E633574F96F4D619EAFB8EA41F48FA84A4B324FD6A863AA9A25F20DA852D5A7F99F7081014CBCD01AE2F0E6B82A2036FE6A23F9464FFBE28E96E49F6B1589EE55D5BC6BE55D2A992EE93748273F9D9969DDB7AECCEE21B9A7F3333505D2310EDC216ADBF4C7404088AE5E600D717873541D181376351BBDBF7D1261C5AB55F9274BBA44F3BCEF11149A7497AAF24BB13F85DE7F2B385C3B774EE4CFE5AD2E54DDD8E6652748B40B40B5BB4FE32F1112028969B035C5F1CD6044507DE8C452D74D972AE85397BBD5AD295925EE438C7CD922E90F43349EF6C36C878969F2D6CDAC6986F346DB2D068E1F6058E365274BB40B40B5BB4FEEE63EEB3596E1FEABBCFC9BC2F3326383B9C098A0EBC998ABE5FD2EB7B96717F27E96D927E33E13CCF97F46D49CF69CA76978DA7EC7EDE56DE96CA7F24E9AA096DA408BF40BA025CC8F3FF44B0592EBFF1D83330EFC78A4D3B1EE7696EFF29455074E0CD50F409927EBF6563C8154DFDB66379ECABAFAC67F97973D9B96D4FBB01E7D992FE31B6911CBF5320DA852D5A7F4B4F7F36CB95164F3B1FF33ECDC97B14CE0E4182A2036F86A297497AC69647CD6CDE151C73BABEBB919EE5E7CD65E76E5BEC2EC59F255D3CA6811C3B2810EDC216ADBF831360E603D82C3733E84CD531EF67821CA80667873341D181E72C6AEF17B2BB8976376EDBEEE65B24D9A6147B9F61EACBDEDF689B605EB85160EAF2F350B9947EA4B69DE3FE2710EDC216ADBF25E7BABD37D99E7FDABE9F98CD7225F5779F8B795F662C70763813141D78CEA22977E2BA3B97534FB7EB97C0AE3B83DBEA4FB913B9EBCE686ABB39EEFF05A25DD8A2F5B7E47C67B35C49ED71E762DE8FF39A7A34CE53E5788FA243CE5734F5BD7DEDB3109F3AE274BB9EC1B8EDBD86BBAA4F796FE3AEF75A8E683A877604A25DD8A2F5B7D46467B35C29E969E761DE4F731B5B0AE7B1629DE3B9A3E8C07314EDBE5F68A81AFB74952F37BB98878EB55DD2EF91B4ED535D86969137EB1F73FCFB7808F7D0F08CFA7EB40B5BB4FE8E9A0C130F66B3DC44B882C598F765B071763813141D78138B6EBE5F68A81AFBBCE6D7483A67E84049D748FAE9C0E7448F597E4E5976EE368B8770270C52E221D12E6CD1FA9B380D5C87B159CEC557A430F3BE08339FA9ED6126287AF4A695B58FD5B3876B5B604B791D90748FA4A748BA774781D4E3C62C3FA72C3B779BB4F9093329FDE3987E8168BF40A2F537F7BC4FD964C666B9DCA3305C3FF37ED8688E2370762812141D78138A4E5D9E4DB953987AE731753939F5B84D8631CBEA1308C314C975617B99A41B255D22C9EE38B5AF13251D6BFEE790A4BB3ADFB3471FD9474AB6DFCF3108B9FA9BA3AD4BA893CD724B182571A7ABD030717D714013141D78238B7A367C9C25E9BC1DEF3DB4A6D87B19AF96746D42BB52969FC72E3BB7A74DDDA893D0CCD087E4BAB05950B490689B9E3ED00984DBBE6E21F1B0A4B7131417331F537F06D92CB7FF21CDF573BEFF9ED5D5029C1DE33136285E2AE961FDF7AFA0EE7F53BFD6964B3D7E4DC7D92FDB6D0FD74E19C25DBB99C75EF053969FC72E3B77FB90723723A5CF918FC97561B34068E37F9FA4EB25DDD4205B20FC8BA4573501F201494724DDD17C9F3B8ACB998D63EEEAB3596EBFE39AEBE77CBFBDAAEFEC383BC6646C50B4B0735CF3589DEE7FE7FE9AB5CBEA5C53BDBF9474EE8E876B0F0DE3AEE7238E7DDEE2D0B2F2D0F787DA6AC1F5EB925EDEF9A3A22FF4CFF187C3D83AC61E9FABDD437F04D95D3FFB3998FBD506457BAFEC49CDF2B32D3B5F2EE9681312BB771AEDFC2C3DCF3D0AF9EA63B35C3EDB1C35136072A83EBA4E9C1DCE6383628E5F5C8EE6872ABAED13570C61CA9BD2772D3F4F5D76DE1C905C813FF50F887D9F3FB59D7DC77D3C7350B43F3C2E6882E1E9926C7E7D4BD2C73696A4098ACBBACCB0596E59E3458029335E383B9C098A0EBC3D14EDFB0CE7A99F09BD6BF9D9B3ECBC0796559E32D785ADBDA3681FE96641F16B92CE6E36ABD81F1C04C5E54E2736CB2D6FEC72FD9C2F4F226F8B7176F812141D787B287A4573CE0B3BE7EEFB5A4AD3B62D2F7B979D53CECD31C302B92E6C6D503C5F922D533E5DD28B9B8068AD22280E8F4D8D47B059AEC651196E53AE9FF3E133C73A0267C77813141D787B28DA77F7B0EF2E636AD3FA969FE75A764E6D03C7F50BE4BAB07583E219CDA3726CB7BC05C753F61C14D92C376D93A0BDDF95CD72CBBC92E4FA395FA646BE56E3ECB025283AF0F654F4E666C9F067CDFBCAAE94F4A2896DE95B7E66D97922E6CCC5725DD8BA41F189CD236F6C138B3D23F1E09E83229BE5FA37F0A5BCD736E266B9974A7AC8F1EFC19165878EDFF5FD6DDFB3AFF3DEFF992F9E3DD5E5BA9EE66F7905672028563008239BD0DDE1BC6B27744AB59BCBCC2C3BA7A8953926DA852D5A7FCBCCA2F4B32C71B3DCE324EDFAF7F881EFB765E73ECEEA1D532741317D9E4E3D92EBCB54B9E62F19034C7D31A153A5F21DD77D66E2AE672BA6B6A0BBFCCCB273AA5AFEE3A25DD8A2F537FF0C1A7F0636CB8D37F39660DE7B05D3CAE39CE6D47B1477141D787B2C6A0FC9FDADA4E70E7C5A4B4A13BBCBCF2C3BA788953926DA852D5A7FCBCCA2716761B3DC38AF398E66DECFA1385C07CEC3465B8F20283AF0F658D43ED7D91E826C9FD5FB15673BDAE5E6674AFA93A41324DDEFAC93E27E816817B668FDF5CF90F96B60B3DCFCA6433532EF8784E6F93ECE0E4782A2036F8F450F48BA4ED29B25DD3B433BEC4EE2DF243DAD7964CA0C5552855320DA852D5A7F9DD3235B7136CB65A3EDAD98795FC61B67873341D181B7A2A2B6FC6CBBA7ED01CCB60396D7FE05A25DD8A2F577FF33ACBF056C962B3B32CCFB32DE383B9C098A0EBC1515B5E5E7EF4B7A23CBCED58C6AB40B5BB4FE5633D1361AC266B9B223C3BC2FE38DB3C399A0E8C0A328021905A25DD8A2F537E3D47157CD663937617205CCFB642AD781383BF8088A0E3C8A22905120DA852D5A7F334E1D77D56C9673132657C0BC4FA6721D58A373F7C30FFE2EE990A4D39A4DAAAECECE5D98A038B728F521308F408D17B6797AD65F4BB4FEE6B4F4D6CD6639AF607A79E67DBA95E7C81A9D098A9E11A52C0208A8C60B5BCE6189D6DF9C96B5D5CD66B9ED23C2BC2F335B6B74262896197BCE82C06A056ABCB0E5C48ED6DF9C96B5D5CD663982E2BEE7648DD71782E2BE6705E74760E102355ED8729246EB6F4E4BEA5E8E00F3BECC58D5E8BC1914ED4334EC651FA451D58BF72856351C34068147046ABCB0E51C9E68FDCD6949DDCB1160DE9719AB1A9D2D285E25E91C49774A3A26E92682629909C159105883408D17B69CAED1FA9BD392BA9723C0BC2F3356B53ADB5DC4C3927EDCFC7B1241B1CC84E02C08AC41A0D60B5B2EDB68FDCDE548BDCB1260DE97192F9C1DCE2C3D3BF0288A4046816817B668FDCD3875A87A410235CE7B5B12BD51D2251B77B74E6C96478DD79EF9F780A42392CE6BBCAF9674BE247B26606DAF1A9D6B33DADA1E82E262868A8606138876618BD6DF60D399EE6E11A871DE5B50B49078B7A40F48BAAB69FBE6D75FD77CDDDE5B777C131A6FE884C99A06BD46E79A7C76B685A0B898A1A2A1C104A25DD8A2F537D874A6BB0B0B8AF6ECCBFB245DDF6CB0B0E6DBFBE9FE22E9551B01B2ED9ADD653CB3D2BB8A5C5F1C3F820445071E4511C82810EDC216ADBF19A70E552F48A0C679DF3EB6E556492735CBCFB6EC7CB9A4A34D48ECDE696CB9AB7DBC8B14EE030C66FD112028CECA496508CC2650E32F90D93AD75351B4FEE6B4A4EEE508D438EFDBA0F825491734C1F07449AF96F42D491FEBB9A368652C28DA5DC576A9BAA651A8D1B9261F969E17331A341481FF0944BBB045EB2F731D0113A871DEB741F1A226287E4DD2D9926E97744B4F50EC3E0FF0B64A87B546E74AA91EDD2CEE282E66A8686830816817B668FD0D369DE9EE16811AE77DF71343DE2AE9E9925EDC0444EB46F78EA2DD41B4F733D67A27B165AFD1B9C40FC587257D59D2FD9E9311143D7A9445209F40B40B5BB4FEE69B39D4BC24811AE77D37289ED13C2AA77DF4CD299DA068CBD1352F3777E7418DCE25E6A93DAAE8B1923E27E99353032341B1C450710E04C60B44BBB045EBEFF8194189350AD438EFBB41F189CDE36E6C138B3D06E7602728BEAFF95491EEB8D4FA2CC51A9D4BCCE70F49FA94A4E39AB739D8732F470746826289A1E21C088C178876618BD6DFF13382126B1460DE9719D5C8CEB6B9E8A90DF38353022341B1CC24E52C088C15B00B5BB4975D8F782110492072802939CE11AFA7BB7C1F92F43D496F4B190482628A12C720800002082030BF0041717ED3BE1A233BDF29C99E83692FEE2896996F9C0501041040008159042207985900132B89EA6CEF51BCA2D9D06206BC473171C270180208208000023508440D30A5EDA33AB3EBB9F44CE37C082080000208CC281035C0CC4898545554679EA398343D38080104104000813A05A20698D2A381B3439CCD2C0E3C8A228000020820E01020C038F04614C57904D6E6A10445071E45114000010410700810601C78238AE23C028BA0E8C0A228020820800002330A106066C4DC5115CE0E67EE283AF0288A000208208080438000E3C01B5114E71158DC5174606D297A8FA403F3575B6D8DBF90F4CA6A5B47C310400081E5081060CA8C15CE0E67EE283AF09AA24C40BF2135208000021105F8FD5166D471763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F67873341D1814750F4E35103020820105880005366F071763813141D7804453F1E35208000028105083065061F6787F3D8A078A9A48737FED900A47CCD8EF11E9BB38EA975FF5392398E79FD5CD22BC614E0D864813F4A3A35F9680E44000104F62B30F6F7C77E5BBBCCB313141DE33636281E9674DCC63FAB63F36BF6FF7D5FAFE1D81C6DE307DD3109298A000208041520C09419789C1DCE63832281E8D1D84C40C704A428020820105880DF1F65061F67873341D181D7146502FA0DA9010104108828C0EF8F32A38EB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0E3C82A21F8F1A10400081C002049832838FB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0E3C82A21F8F1A10400081C002049832838FB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0E3C82A21F8F1A10400081C002049832838FB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0E3C82A21F8F1A10400081C002049832838FB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0E3C82A21F8F1A10400081C002049832838FB3C399A0E8C02328FAF1A801010410082C40802933F8383B9C098A0EBCA6E83D920EF8AB594C0DBF90F4CAC5B4968622800002F50A5880E15546C0F20EAF090204C509681441000104104000010422081014238C327D4400010410400001042608101427A051040104104000010410882040508C30CAF4110104104000010410982040509C80461104104000010410402082004131C228D34704104000010410406082004171021A45104000010410400081080204C508A34C1F114000010410400081090204C509681441000104104000010422081014EB1EE58B251DDE68E225922EEB69F62149A76DF95EDDBDA4750820800002082050A5001F6953E5B03CD2280B8AF66A83E1F1928E48BA6323105A48FCA6A46D21B2EE5ED23A04104000010410A85280A058E5B06C0D8AF68D8392BE20E983926E936461F26449B74A3A893B8A750F28AD43000104104060490204C5BA476BF38EA2B5B6BDAB7854D24D9DE6B3F45CF758D23A04104000010416274050AC7BC8088A758F0FAD43000104104060D50204C5BA87B72F289E28E958B3C4CC1DC5BAC78FD6218000020820B068018262DDC3D7171437DFA3D8F680A5E7BAC792D6218000020820B038018262DD4396BAEBD97A4150AC7B2C691D0208208000028B132028D63D643C47B1EEF1A175082080000208AC5A80A0B8EAE1A5730820800002082080C0740182E2743B4A228000020820800002AB162028AE7A78E91C0208208000020820305D80A038DD8E920820800002082080C0AA05088AAB1E5E3A8700020820800002084C1720284EB7A3240208208000020820B06A0182E2AA8797CE218000020820800002D305088AD3ED28890002082080000208AC5A80A0B8EAE1A5730820800002082080C0740182E2743B4A228000020820800002AB162028AE7A78E91C0208208000020820305D80A038DD8E920820800002082080C0AA05088AAB1E5E3A8700020820800002084C17F8377A882EF307CEFBAE0000000049454E44AE426082>|massamollasmor.png>|390pt|91pt||>>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      T:1/2*M[1]*v[1]^2+1/2*M[2]*v[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><frac|M<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      U:1/2*K[1]*q[1]+1/2*K[2]*(q[2]-q[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><frac|K<rsub|2>*<around*|(|q<rsub|2>-q<rsub|1>|)>|2>+<frac|K<rsub|1>*q<rsub|1>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      F:1/2*D[1]*q[2]^2
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><frac|D<rsub|1>*q<rsub|2><rsup|2>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      L:T-U
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><frac|M<rsub|2>*v<rsub|2><rsup|2>|2>-<frac|K<rsub|2>*<around*|(|q<rsub|2>-q<rsub|1>|)>|2>+<frac|M<rsub|1>*v<rsub|1><rsup|2>|2>-<frac|K<rsub|1>*q<rsub|1>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|unfolded-io>
      u:matrix([u1],[u2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o49>)
      >><matrix|<tformat|<table|<row|<cell|<with|math-font-family|rm|u1>>>|<row|<cell|<with|math-font-family|rm|u2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|input>
      EEL(L,F,u):=block([dim,eq:[],dldv,dldq,dtdldv,dfdv,sols:[]],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dim:size(u)[1],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if(nonscalarp(u))then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru dim do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dldv:dev(L,v[i]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dldq:dev(L,q[i]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dtdldv:dev(dldv,t),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dfdv:dev(F,v[i]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ eq:flatten(append(eq,[dtdldv-dldq+dfdv-u[i,1]])),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ sols:flatten(append(sols,[solve(eq[i]=0,a[i])]))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return([eq,sols]))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      EEL(L,F,u)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><around*|[|<around*|[|-<with|math-font-family|rm|u1>-<frac|K<rsub|2>|2>+M<rsub|1>*a<rsub|1>+<frac|K<rsub|1>|2>,-<with|math-font-family|rm|u2>+M<rsub|2>*a<rsub|2>+<frac|K<rsub|2>|2>|]>,<around*|[|a<rsub|1>=<frac|2*<with|math-font-family|rm|u1>+K<rsub|2>-K<rsub|1>|2*M<rsub|1>>,a<rsub|2>=<frac|2*<with|math-font-family|rm|u2>-K<rsub|2>|2*M<rsub|2>>|]>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
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