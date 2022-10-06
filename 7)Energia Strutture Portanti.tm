<TeXmacs|2.1.2>

<style|<tuple|generic|italian|large-formulas|maxima>>

<\body>
  <\center>
    <doc-data|<doc-title|Energie Strutture
    Portanti>|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
    Rossi>>>>
  </center>

  Scrivere una procedura Maxima che, presa in ingresso la tabella di
  Denavit-Hartenberg e le informazioni necessarie per individuare i
  baricentri dei link, resistuisca per ogni link:

  <\itemize>
    <item>Energia cinetica di rotazione;

    <item>Energia cinetica di traslazione;

    <item>Energia potenziale

    <item>Matrice delle inerzie generalizzate per ogni link;
  </itemize>

  In aggiunta, per l'intero robot:

  <\itemize>
    <item>Energia cinetica complessiva;

    <item>Matrice delle inerzie generalizzate.
  </itemize>

  Calcolo cinematica diretta in accordo all'algoritmo di Denavit-Hartenberg:

  <\equation*>
    Q<rsub|0,n>=Q<rsub|01>Q<rsub|12>\<ldots\>Q<rsub|n-1,n><space|1em>con
    n\<equiv\>#DOF
  </equation*>

  Applico traslazioni necessarie per portare il sistema il
  <math|SR<rsub|i-1,i>> con l'origine coincidente con il baricentro del link:

  <\equation*>
    <wide|Q|^><rsub|01>=Q<rsub|01><matrix|<tformat|<table|<row|<cell|I<space|1em>d>>|<row|<cell|0<space|1em>1>>>>>,<wide|Q|^><rsub|12>\<ldots\><wide|Q|^><rsub|n-1,n><space|1em>in
    cui d sono le coordinate del baricentro del link-<frac|L<rsub|i>|2>
  </equation*>

  A questo punto, l'energia cinetica del link i-esimo:

  <\equation*>
    T<rsub|i>=T<rsub|i><rsub|a>+T<rsub|i><rsub|b>=<frac|1|2>\<omega\><rsub|i><rsup|T>R<rsub|i>\<bbb-I\><rsub|i>R<rsub|i><rsup|T>\<omega\><rsub|i>+<frac|1|2>M<rsub|i><wide|d|\<dot\>><rsup|T><rsub|i<rsup|>><wide|d|\<dot\>><rsup|><rsub|i<rsup|>>
  </equation*>

  In cui:

  <\equation*>
    \<omega\><rsub|i>\<equiv\><wide|q|\<dot\>><rsub|i>*e<rsub|k><space|2em>con
    k\<in\><around*|{|x,z|}> in base all<rprime|'>asse su cui avviene la
    rotazione
  </equation*>

  In particolare:

  <\equation*>
    \<omega\><rsub|i>=\<omega\>=<matrix|<tformat|<table|<row|<cell|\<omega\><rsub|x>>>|<row|<cell|\<omega\><rsub|y>>>|<row|<cell|\<omega\><rsub|z>>>>>>
    ottenuto da S<around*|(|\<omega\>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>-\<omega\><rsub|z><space|1em>\<omega\><rsub|y>>>|<row|<cell|\<omega\><rsub|z><space|1em>0<space|1em>-\<omega\><rsub|x>>>|<row|<cell|\<omega\><rsub|y><space|1em>\<omega\><rsub|x><space|1em>0>>>>>=<wide|R|\<dot\>>R<rsup|T>
  </equation*>

  <\equation*>
    R<script-assign> matrice di rotazione associata a <wide|Q|^><rsub|i-1,i>
  </equation*>

  <\equation*>
    \<bbb-I\><script-assign>matrice di inerzia del link i-esimo
  </equation*>

  <\equation*>
    M<rsub|i><script-assign>massa dell<rprime|'>i-esimo link<rsub|>
  </equation*>

  <\equation*>
    d<rsub|i><script-assign> coordinate di posizione associata a
    <wide|Q|^><rsub|i-1,i>
  </equation*>

  <\equation*>
    T<rsub|a><script-assign> energia cinetica associata alla rotazione
  </equation*>

  <\equation*>
    T<rsub|b><script-assign> energia cinetica associata alla traslazione
  </equation*>

  Inoltre si definisce, la matrice delle inerzie generalizzate
  B<math|<rsub|i>>, nel seguente modo:

  <\equation*>
    T<rsub|i>=T<rsub|i><rsub|a>+T<rsub|i><rsub|b>=<frac|1|2><matrix|<tformat|<table|<row|<cell|<wide|q|\<dot\>><rsub|1>\<ldots\><wide|q|\<dot\>><rsub|n>>>>>>B<rsub|i><matrix|<tformat|<table|<row|<cell|<wide|q|\<dot\>><rsub|1>>>|<row|<cell|\<vdots\>>>|<row|<cell|<wide|q|\<dot\>><rsub|n>>>>>>
  </equation*>

  In altri termini è la forma quadratica corrispondende all'energia totale
  del link i-esimo.

  In particolare, per l'intero robot la matrice delle interzie generalizzate:

  <\equation*>
    B=B<rsub|1>+\<cdots\>+B<rsub|n>
  </equation*>

  \;

  <\session|maxima|default>
    \;

    <\textput>
      Procedura per la costruzione di una matrice di inerzia simbolica
      diagonale poiché abbiamo supposto che il baricentro si trovi lungo i
      piani di simmetria dei link
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      inerzia(j):=block(

      [II],

      II:matrix([I[concat(x,j)],0,0],

      [0,I[concat(y,j)],0],

      [0,0,I[concat(z,j)]]),

      /*II:subst(j,i,II),*/

      return(II)

      )$
    </input>

    <\textput>
      Procedura di supporto per la definizione delle traslazioni per portare
      il sistema di riferimento <math|Q<rsub|i j>> nel baricentro del link:

      <\equation>
        <matrix|<tformat|<table|<row|<cell|I>|<cell|row>>|<row|<cell|0>|<cell|1>>>>>
      </equation>

      \;
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      baricentro(row):=block(

      [bc],

      bc:addrow(addcol(ident(3),transpose(row)),[0,0,0,1]),

      return(bc)

      )$
    </input>

    <\textput>
      Procedura di supporto per identificare una forma quadratica e
      restituire la matrice delle inerzie generalizzate;
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      formaQuad(func,n):=block(

      [B],

      B:zeromatrix(n,n),

      /*Derivoduevolte:ottengoiterminiquadraticinellevelocità*/

      for k:1thru n do(

      B[k,k]:diff(func,v[k],2)),

      /*Derivoiterminimisti:*/

      /*ottengoiterminisopraesottoladiagonaleprincipale.*/

      for i:1 thru n do(

      for j:i+1 thru n do(

      B[i,j]:1/2*dev(dev(func,v[j]),v[i]),

      B[j,i]:B[i,j]

      )

      ),

      return(B)

      )$
    </input>

    \;

    <\textput>
      Funzione per il calolo della derivata di una matrice
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      matrixDot(m):=block([sizeM:size(m),dotM:zerofor(m)],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1
      thru sizeM[1] do (

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for
      j:1 thru sizeM[2] do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dotM[i,j]:dev(m[i][j],t)

      )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(dotM)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )$
    </input>

    <\textput>
      Funzione per il calclo dell'energia potenziale
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|input>
      Ulink(Qh,M):=block(

      [g,U,d],

      /*Approssimoaccelerazionegravitazionalea10m/s^2*/

      g:[0,0,10],

      d:submatrix(4,Qh,1,2,3),

      U:-M*g.d,

      return(U)

      )$
    </input>

    <\textput>
      Funzione per il calcolo dell'energia cinetica di un link
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      Tlink(Qh,dof,M):=block(

      [Tr,Tt,w,wt,II,R,Rt,Rd,Sw,result,dd,ddt],

      R:submatrix(4,Qh,4),

      d:submatrix(4,Qh,1,2,3),

      Rd:matrixDot(R),

      dd:matrixDot(d),

      Sw:trigsimp(Rd.transpose(R)),

      w:matrix([Sw[3][2]],[Sw[1][3]],[Sw[2][1]]),

      wt:transpose(w),

      dd:trigsimp(trigexpand(dd)),

      ddt:transpose(dd),

      II:inerzia(dof),

      Tt:1/2*M*trigsimp(trigexpand(ddt.dd)),

      Tr:1/2*trigsimp(trigexpand(wt.R.II.transpose(R).w)),

      result:[Tr,Tt,II],

      return(result)

      )$
    </input>

    <\textput>
      Funzione ausiliare di stampa dei risultati
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      stampa(T,U,Ttot,Utot,size):=block([dof:size(U)[2],Tr:T,Ur:U,brToPrint:0,btToPrint:0,pos:[],vel:[]],

      \ \ 

      \ \ \ for i:1 thru 6 do(

      \ \ \ \ \ \ vel:flatten([vel,[v[i]]]),

      \ \ \ \ \ \ pos:flatten([pos,[q[i]]])

      \ \ \ ),

      \ \ \ for i:1 thru dof do(

      \ \ \ \ \ \ \ \ print("Link",i),

      \ \ \ \ \ \ \ \ print("Energica Cinetica di Rotazione:",

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ collectterms(intosum(scanmap(multthru,factor(Tr[i][1]))),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vel[1],vel[2],vel[3],vel[4],vel[5],vel[6])

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ print("Energia Cinetica di Traslazione:",

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ collectterms(intosum(scanmap(multthru,factor(Tr[i][2]))),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ vel[1],vel[2],vel[3],vel[4],vel[5],vel[6])

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ print("Matrice di Inerzia:",Tr[i][3]),

      \ \ \ \ \ \ \ \ print("Energia Potenziale:",collectterms(Ur[i],pos[1],pos[2],pos[3],pos[4],pos[5],pos[6])),

      \ \ \ \ \ \ \ \ brToPrint:<var|formaQuad(Tr[i][1],size)>,

      \ \ \ \ \ \ \ \ btToPrint:formaQuad(Tr[i][2],size),

      \ \ \ \ \ \ \ \ print("Br:",intosum(scanmap(multthru,brToPrint))),

      \ \ \ \ \ \ \ \ print("Bt:",intosum(scanmap(multthru,btToPrint)))

      \ \ \ ),

      \ \ \ \ print("Energia Cinetica Complessiva:",collectterms(intosum(scanmap(multthru,factor(Ttot))),vel[1],vel[2],vel[3],vel[4],vel[5],vel[6])),

      \ \ \ \ print("Energia Potenziale Complessiva:",collectterms(Utot,pos[1],pos[2],pos[3],pos[4],pos[5],pos[6]))

      )$
    </input>

    <\textput>
      Funzione principale per il calcolo dell'energia di un robot
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      energia(tab,M,Trs,flag):=block(

      \ \ [T:[],U:[],Q:[],Qbc:[],i,rowList,Qdr:0,Ttot:0,Utot:0],

      rowList:args(DH),

      dof:size(rowList)[1],

      [Qdr,Q]:DH(tab),

      for i:1 thru size(Q)[2] do (

      \ \ \ Qbc:append(Qbc,[Q[i].baricentro(Trs[i])]),

      \ \ \ T:append(T,[Tlink(Qbc[i],i,M[i])]),

      \ \ \ /*print("T",T)*/

      \ \ \ U:append(U,[Ulink(Qbc[i],M[i])]),

      \ \ \ /* print("U",U)*/

      \ \ \ Ttot:expand(Ttot+T[i][1]+T[i][2]),

      \ \ \ /*print("Ttot",Ttot)*/

      \ \ \ Utot:expand(Utot+U[i])

      \ \ \ /*print("Utot",Utot)*/

      ),if flag=1 then stampa(rename(T,0),rename(U,0),rename(Ttot,0),rename(Utot,0),size(Q)[2]),

      \ \ \ return(rename(expand([formaQuad(Ttot,size(Q)[2]),Utot]),0))

      \ \ \ )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      DH:[matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),

      matrix([0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,L[3]]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,%pi/2,D[2]],[0,q[3],0,0]),

      matrix([q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|D<rsub|3>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      Trsz:[matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),

      matrix([0,L[1]/2,0],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,0,-L[1]/2],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([-D[1]/2,0,-L[1]/2],[-D[2]/2,0,0],[0,0,L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[0,0,-L[3]/2]),

      matrix([0,L[1]/2,0],[0,-L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[-D[3]/2,0,0])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|L<rsub|1>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>|2>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|D<rsub|1>|2>>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|-<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|D<rsub|3>|2>>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      M:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|2DOF>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      [T,U]:energia(DH[1],M,Trsz[1],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|z1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z1>>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2>+v<rsub|1>|)><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+v<rsub|1>*<around*|(|<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>*v<rsub|2>+v<rsub|1><rsup|2>*<around*|(|<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|L<rsub|1><rsup|2>*M<rsub|2>|2>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z2>>>|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>>>|<row|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>+L<rsub|1><rsup|2>*M<rsub|2>>|<cell|<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>>>|<row|<cell|<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1>*v<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|1><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|I<rsub|<with|math-font-family|rm|z1>>|2>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|L<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|L<rsub|1><rsup|2>*M<rsub|1>|8>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>|)>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >0>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|z1>>+L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>+L<rsub|1><rsup|2>*M<rsub|2>+<frac|L<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>>>|<row|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|1>*L<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|I<rsub|<with|math-font-family|rm|z2>>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>,0|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Cartesiano>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      [T,U]:energia(DH[2],M,Trsz[2],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|1>*<around*|(|q<rsub|1>-<frac|L<rsub|1>|2>|)>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|M<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|2>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*q<rsub|1>*M<rsub|2>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|M<rsub|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Link >3>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|v<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|3>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*q<rsub|1>*M<rsub|3>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|M<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+v<rsub|1><rsup|2>*<around*|(|<frac|M<rsub|3>|2>+<frac|M<rsub|2>|2>+<frac|M<rsub|1>|2>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|M<rsub|3>|2>+<frac|M<rsub|2>|2>|)>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >q<rsub|1>*<around*|(|-10*M<rsub|3>-10*M<rsub|2>-10*M<rsub|1>|)>+5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|M<rsub|3>+M<rsub|2>+M<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>+M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-10*q<rsub|1>*M<rsub|3>-10*q<rsub|1>*M<rsub|2>-10*M<rsub|1>*q<rsub|1>+5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\textput>
      <center|>
    </textput>

    <\textput>
      <center|<with|font-series|bold|Robot Cilindrico>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      [T,U]:energia(DH[3],M,Trsz[3],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|z1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*v<rsub|2><rsup|2>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|q<rsub|2>-<frac|L<rsub|2>|2>+L<rsub|1>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y3>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+v<rsub|1><rsup|2>*<around*|(|<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>|)>+<frac|v<rsub|2><rsup|2>*M<rsub|3>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z3>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*<around*|(|q<rsub|2>+L<rsub|1>|)>*M<rsub|3>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z1>>|2>+<frac|I<rsub|<with|math-font-family|rm|y3>>|2>+<frac|I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>|)>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+v<rsub|2><rsup|2>*<around*|(|<frac|M<rsub|3>|2>+<frac|M<rsub|2>|2>|)>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*L<rsub|1>*M<rsub|3>+q<rsub|2>*<around*|(|-10*M<rsub|3>-10*M<rsub|2>|)>+5*L<rsub|2>*M<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z1>>+I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>+M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-10*q<rsub|2>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*M<rsub|2>*q<rsub|2>+5*L<rsub|2>*M<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot SCARA>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      [T,U]:energia(DH[4],M,Trsz[4],1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Link >1>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|z1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|D<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|<frac|D<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2>+v<rsub|1>|)><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+v<rsub|1>*<around*|(|<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>*v<rsub|2>+v<rsub|1><rsup|2>*<around*|(|<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|D<rsub|1><rsup|2>*M<rsub|2>|2>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*L<rsub|1>*M<rsub|2>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z2>>>|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>>|<cell|0>>|<row|<cell|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>>|<cell|I<rsub|<with|math-font-family|rm|z2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>+D<rsub|1><rsup|2>*M<rsub|2>>|<cell|<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|0>>|<row|<cell|<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2>+v<rsub|1>|)><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+v<rsub|1>*v<rsub|2>*<around*|(|L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>|)>+v<rsub|1><rsup|2>*<around*|(|<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1><rsup|2>*M<rsub|3>|2>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|q<rsub|3>+<frac|L<rsub|3>|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z3>>>|<cell|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>>|<cell|0>>|<row|<cell|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>>|<cell|I<rsub|<with|math-font-family|rm|z3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*M<rsub|3>>|<cell|<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>>|<cell|0>>|<row|<cell|<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>>|<cell|L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1>*v<rsub|2>*<around*|(|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+L<rsub|3><rsup|2>*M<rsub|3>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|1><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|I<rsub|<with|math-font-family|rm|z1>>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|D<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|D<rsub|1><rsup|2>*M<rsub|1>|8>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>|)>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*M<rsub|3>*q<rsub|3>-5*L<rsub|3>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|z1>>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+2*D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|1><rsup|2>*M<rsub|3>+D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>+D<rsub|1><rsup|2>*M<rsub|2>+<frac|D<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|0>>|<row|<cell|<frac|I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>+D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|1>*D<rsub|2>*c<rsub|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1>*D<rsub|2>*M<rsub|2>*c<rsub|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|I<rsub|<with|math-font-family|rm|z3>>+I<rsub|<with|math-font-family|rm|z2>>+L<rsub|3><rsup|2>*M<rsub|3>+2*D<rsub|2>*L<rsub|3>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-10*M<rsub|3>*q<rsub|3>-5*L<rsub|3>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Sferico (di primo tipo)>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      [T,U]:energia(DH[5],M,Trsz[5],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>|)>+<frac|v<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|8>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|<frac|D<rsub|2>*s<rsub|2>|2>+L<rsub|1>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>|2>|)>+<frac|v<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|y3>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>-D<rsub|2>*v<rsub|2>*M<rsub|3>*v<rsub|3>+v<rsub|1><rsup|2>*<around*|(|<frac|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+D<rsub|2>*c<rsub|2>*s<rsub|2>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>-<frac|D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>|2>-<frac|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>|)>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z3>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|-c<rsub|2>*q<rsub|3>+<frac|c<rsub|2>*L<rsub|3>|2>+D<rsub|2>*s<rsub|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>+2*D<rsub|2>*c<rsub|2>*s<rsub|2>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|4>-D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>+D<rsub|2><rsup|2>*M<rsub|3>>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>>|<row|<cell|0>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>|<cell|M<rsub|3>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|I<rsub|<with|math-font-family|rm|y1>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>+<frac|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+D<rsub|2>*c<rsub|2>*s<rsub|2>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>-<frac|D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>|2>-<frac|D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|8>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|y3>>|2>+<frac|I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>|)>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>-D<rsub|2>*v<rsub|2>*M<rsub|3>*v<rsub|3>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >10*c<rsub|2>*M<rsub|3>*q<rsub|3>-5*c<rsub|2>*L<rsub|3>*M<rsub|3>-10*D<rsub|2>*s<rsub|2>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-5*D<rsub|2>*M<rsub|2>*s<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|y1>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>+2*D<rsub|2>*c<rsub|2>*s<rsub|2>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|4>-D<rsub|2>*c<rsub|2>*s<rsub|2>*L<rsub|3>*M<rsub|3>-D<rsub|2><rsup|2>*s<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>+D<rsub|2><rsup|2>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>>|<row|<cell|0>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>|<cell|M<rsub|3>>>>>>,10*c<rsub|2>*M<rsub|3>*q<rsub|3>-5*c<rsub|2>*L<rsub|3>*M<rsub|3>-10*D<rsub|2>*s<rsub|2>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-5*D<rsub|2>*M<rsub|2>*s<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Sferico (di secondo tipo) -
      Stanford>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      [T,U]:energia(DH[6],M,Trsz[6],1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Link >1>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>|)>+<frac|v<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*L<rsub|1>*M<rsub|2>>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>|2>|)>+<frac|v<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|y3>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>-v<rsub|1>*L<rsub|2>*s<rsub|2>*M<rsub|3>*v<rsub|3>+v<rsub|1><rsup|2>*<around*|(|<frac|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|L<rsub|2><rsup|2>*M<rsub|3>|2>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>|)>+v<rsub|1>*v<rsub|2>*<around*|(|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>-L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|)>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z3>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|c<rsub|2>*q<rsub|3>-<frac|c<rsub|2>*L<rsub|3>|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y3>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|4>+L<rsub|2><rsup|2>*M<rsub|3>>|<cell|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|4>-<frac|L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|2>>|<cell|-<frac|L<rsub|2>*s<rsub|2>*M<rsub|3>|2>>>|<row|<cell|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|4>-<frac|L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|2>>|<cell|M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>*s<rsub|2>*M<rsub|3>|2>>|<cell|0>|<cell|M<rsub|3>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1><rsup|2>*<around*|(|<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>|2>+<frac|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|I<rsub|<with|math-font-family|rm|y1>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>|2>+<frac|s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>+<frac|s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|L<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|8>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|y3>>|2>+<frac|I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|8>|)>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>-v<rsub|1>*L<rsub|2>*s<rsub|2>*M<rsub|3>*v<rsub|3>+v<rsub|1>*v<rsub|2>*<around*|(|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|2>-L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|)>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*c<rsub|2>*M<rsub|3>*q<rsub|3>+5*c<rsub|2>*L<rsub|3>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z3>>+c<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>+I<rsub|<with|math-font-family|rm|y1>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x3>>+s<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>-s<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|s<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|4>+L<rsub|2><rsup|2>*M<rsub|3>+<frac|L<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|4>-<frac|L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|2>>|<cell|-<frac|L<rsub|2>*s<rsub|2>*M<rsub|3>|2>>>|<row|<cell|<frac|L<rsub|2>*c<rsub|2>*L<rsub|3>*M<rsub|3>|4>-<frac|L<rsub|2>*c<rsub|2>*M<rsub|3>*q<rsub|3>|2>>|<cell|I<rsub|<with|math-font-family|rm|y3>>+I<rsub|<with|math-font-family|rm|y2>>+M<rsub|3>*q<rsub|3><rsup|2>-L<rsub|3>*M<rsub|3>*q<rsub|3>+<frac|L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>*s<rsub|2>*M<rsub|3>|2>>|<cell|0>|<cell|M<rsub|3>>>>>>,-10*c<rsub|2>*M<rsub|3>*q<rsub|3>+5*c<rsub|2>*L<rsub|3>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Robot Antropomorfo>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      [T,U]:energia(DH[7],M,Trsz[7],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+v<rsub|2>*v<rsub|3>*I<rsub|<with|math-font-family|rm|z2>>+<frac|v<rsub|2><rsup|2>*I<rsub|<with|math-font-family|rm|z2>>|2>+v<rsub|1><rsup|2>*<around*|(|<frac|s<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>-c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|y2>>+<frac|c<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|c<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>+c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|x2>>+<frac|s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><around*|(|<frac|M<rsub|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>|)>*v<rsub|3><rsup|2>+v<rsub|2>*<around*|(|D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>|2>+M<rsub|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>*v<rsub|3>+v<rsub|1><rsup|2>*<around*|(|-M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>|2>+D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*s<rsub|3><rsup|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>*s<rsub|3><rsup|2>|2>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*s<rsub|3><rsup|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*s<rsub|3><rsup|2>|8>-M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*c<rsub|3>*s<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>|4>-D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*s<rsub|3>|2>+D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*c<rsub|3>|2>+<frac|M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|8>|)>+v<rsub|2><rsup|2>*<around*|(|D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>|2>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>|8>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|D<rsub|3>*s<rsub|32>-<frac|D<rsub|2>*s<rsub|32>|2>+D<rsub|2>*s<rsub|2>+L<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      test:matrix([q[1],0,-%pi/2,0],[0,q[2],0,0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|s<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>-2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|y2>>+c<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>+c<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|-2*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+M<rsub|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*s<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>*s<rsub|3><rsup|2>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*s<rsub|3><rsup|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*s<rsub|3><rsup|2>|4>-2*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+2*D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*c<rsub|3>*s<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>|2>-2*D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*s<rsub|3>+2*D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*c<rsub|3>+M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|2*D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>+M<rsub|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|2>*v<rsub|3>*<around*|(|I<rsub|<with|math-font-family|rm|z2>>+D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>|2>+M<rsub|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|4>|)>+v<rsub|2><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>|2>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>|8>|)>+v<rsub|3><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|z2>>|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>|8>|)>+v<rsub|1><rsup|2>*<around*|(|<frac|s<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>-c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|y2>>+<frac|c<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|I<rsub|<with|math-font-family|rm|y1>>|2>+<frac|c<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>+c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|x2>>+<frac|s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>|2>-M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>|2>+D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*s<rsub|3><rsup|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>*s<rsub|3><rsup|2>|2>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*s<rsub|3><rsup|2>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*s<rsub|3><rsup|2>|8>-M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*c<rsub|3>*s<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>|4>-D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*s<rsub|3>|2>+D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*c<rsub|3>|2>+<frac|M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>|2>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|8>|)>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*M<rsub|2>*D<rsub|3>*s<rsub|32>+5*D<rsub|2>*M<rsub|2>*s<rsub|32>-10*D<rsub|2>*M<rsub|2>*s<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|s<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>-2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|y2>>+c<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>+I<rsub|<with|math-font-family|rm|y1>>+c<rsub|2><rsup|2>*s<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>+2*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>*I<rsub|<with|math-font-family|rm|x2>>+s<rsub|2><rsup|2>*c<rsub|3><rsup|2>*I<rsub|<with|math-font-family|rm|x2>>-2*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+M<rsub|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*s<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>*s<rsub|3><rsup|2>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*s<rsub|3><rsup|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*s<rsub|3><rsup|2>|4>-2*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+2*D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*c<rsub|3>*s<rsub|3>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*c<rsub|3>*s<rsub|3>|2>-2*D<rsub|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2>*s<rsub|2>*s<rsub|3>+2*D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>*c<rsub|3>+M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|2><rsup|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>+2*D<rsub|2>*M<rsub|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*M<rsub|2>*c<rsub|3>+M<rsub|2>*D<rsub|3><rsup|2>-D<rsub|2>*M<rsub|2>*D<rsub|3>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>,-10*M<rsub|2>*D<rsub|3>*s<rsub|32>+5*D<rsub|2>*M<rsub|2>*s<rsub|32>-10*D<rsub|2>*M<rsub|2>*s<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      M:[0,m[2]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      zeromatrix(2,2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|0,m<rsub|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      energia(test,M,zeromatrix(2,3),1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      vel:[v[1],v[2],v[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x1>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      \;

      \ <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y1>>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Link >2>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<with|math-font-family|rm|y2>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|m<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*m<rsub|2>*q<rsub|2><rsup|2>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|x2>>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|I<rsub|<with|math-font-family|rm|z2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      <math|<with|math-display|true|<text|Br:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y2>>>|<cell|0>>|<row|<cell|0>|<cell|0>>>>>>>

      <math|<with|math-display|true|<text|Bt:
      ><matrix|<tformat|<table|<row|<cell|m<rsub|2>*q<rsub|2><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|m<rsub|2>>>>>>>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      >v<rsub|1><rsup|2>*<around*|(|<frac|I<rsub|<with|math-font-family|rm|y2>>|2>+<frac|I<rsub|<with|math-font-family|rm|y1>>|2>+<frac|m<rsub|2>*q<rsub|2><rsup|2>|2>|)>+<frac|m<rsub|2>*v<rsub|2><rsup|2>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >0>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|I<rsub|<with|math-font-family|rm|y2>>+I<rsub|<with|math-font-family|rm|y1>>+m<rsub|2>*q<rsub|2><rsup|2>>|<cell|0>>|<row|<cell|0>|<cell|m<rsub|2>>>>>>,0|]>>>
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
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a3>
    <associate|page-width|auto>
  </collection>
</initial>