<TeXmacs|2.1.2>

<style|<tuple|generic|italian|framed-session|maxima>>

<\body>
  <center|<doc-data|<doc-title|Calcolo Vettoriale in
  <math|<with|font|Bbb|R<rsup|3>>> e Rotazioni in
  <math|<with|font|Bbb|R<rsup|2>>>>|<doc-author|<author-data|<author-name|Andrea
  Efficace & Lorenzo Rossi>>>>>

  <\session|maxima|default>
    <\textput>
      <section|Calcolo Vettoriale>

      <with|font-series|bold|1)> <with|font-series|bold|Definizione del
      prodotto Vettoriale in <math|<with|font|Bbb|R<rsup|3>>>>

      Dati due vettori <math|a,b\<in\>\<bbb-R\><rsup|3>> definiamo il
      <strong|prodotto vettoriale> l'operazione:

      <\equation*>
        a \<times\>b=det <matrix|<tformat|<table|<row|<cell|e<rsub|x>>|<cell|e<rsub|y>>|<cell|e<rsub|z>>>|<row|<cell|a<rsub|x>>|<cell|a<rsub|y>>|<cell|a<rsub|z>>>|<row|<cell|b<rsub|x>>|<cell|b<rsub|y>>|<cell|b<rsub|z>>>>>>=<around*|(|a<rsub|y>*b<rsub|z>-a<rsub|z>*b<rsub|y>|)>*e<rsub|x>-<around*|(|a<rsub|z>*b<rsub|x>-a<rsub|x>*b<rsub|z>|)>+<around*|(|a<rsub|x>*b<rsub|y>-a<rsub|y>*b<rsub|x>|)>*e<rsub|z>
      </equation*>

      Alternativamente:

      <\equation*>
        a\<times\>b=<matrix|<tformat|<table|<row|<cell|a<rsub|y>*b<rsub|z>-a<rsub|z>*b<rsub|y>>>|<row|<cell|a<rsub|z>*b<rsub|x>-a<rsub|x>*b<rsub|z>>>|<row|<cell|a<rsub|x>*b<rsub|y>-a<rsub|y>*b<rsub|x>>>>>>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      cross_prod(A,B):=block([vA,vB,E, M, AxB, res],

      /*Verifica delle dimensioni dei vettori*/

      vA:vector_input(A),vB:vector_input(B),

      if (vA=false or vB=false) then

      \ \ \ error("Inserire vettori colonna")

      else(

      \ \ \ /*Definisco vettore simbolico per i versori*/ \ 

      \ \ \ E:matrix([e[x]],[e[y]],[e[z]]),

      \ \ \ /*Definisco matrice per il prodotto vettoriale*/ \ \ 

      \ \ \ M:addrow(transpose(E),transpose(A),transpose(B)),

      \ \ \ /*Calcolo il prodotto vettoriale. Letsimp necessario per\ 

      \ \ \ coprire anche i casi di vettori simbolici assunti come
      paralleli*/

      \ \ \ AxB:collectterms(scanmap(ratsimp,scanmap(trigsimp,factor(determinant(M)))),e[x],e[y],e[z]),

      \ \ \ /*Verifico se i due vettori sono paralleli*/

      \ \ \ if AxB = 0 then

      \ \ \ \ \ printf(true,"~a//~a",vA,vB)

      \ \ \ \ \ ), \ \ \ \ \ \ \ \ \ 

      \ return(AxB)

      \ )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      A:matrix([a[1]],[a[2]],[a[3]])$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      B:matrix([b[1]],[b[2]],[b[3]])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      AxB:cross_prod(A,B)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|(|a<rsub|1>*b<rsub|2>-b<rsub|1>*a<rsub|2>|)>*e<rsub|z>+<around*|(|b<rsub|1>*a<rsub|3>-a<rsub|1>*b<rsub|3>|)>*e<rsub|y>+<around*|(|a<rsub|2>*b<rsub|3>-b<rsub|2>*a<rsub|3>|)>*e<rsub|x>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      cross_prod(matrix([1],[0],[0]),matrix([1],[0],[0]))
    <|unfolded-io>
      matrix([1],[0],[0])//matrix([1],[0],[0])<math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>0>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|2) Proprietà:<with|font-series|bold|
      <with|font-series|medium|il prodotto vettoriale tra due vettori
      paralleli è nullo>>>

      Per provare la proprietà, assumiamo che <math|B=\<alpha\>\<cdot\>A>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      let(B[1,1],alpha*A[1,1]);

      let(B[2,1],alpha*A[2,1]);

      let(B[3,1],alpha*A[3,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>b<rsub|1>\<longrightarrow\>A<rsub|1,1>*\<alpha\>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>b<rsub|2>\<longrightarrow\>A<rsub|2,1>*\<alpha\>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>b<rsub|3>\<longrightarrow\>A<rsub|3,1>*\<alpha\>>>
    </unfolded-io>

    <\textput>
      Semplifichiamo con <with|font-shape|italic|letsimp()>, vediamo che le
      assunzioni sono state ben definite.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      B:letsimp(B)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|a<rsub|1>*\<alpha\>>>|<row|<cell|a<rsub|2>*\<alpha\>>>|<row|<cell|a<rsub|3>*\<alpha\>>>>>>>>
    </unfolded-io>

    <\textput>
      Verifichiamo anche con la procedura precedente
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      cross_prod(A, B)
    <|unfolded-io>
      matrix([a[1]],[a[2]],[a[3]])//matrix([a[1]*alpha],[a[2]*alpha],[a[3]*alpha])

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      cross_prod<around*|(|matrix([1.5],[theta*sqrt<around*|(|2|)>],[8.4]),matrix([7.5],[9.1],[%pi])|)>
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >>-<frac|<around*|(|375*2<rsup|<frac|3|2>>*\<vartheta\>-1365|)>*e<rsub|z>+<around*|(|150*\<pi\>-6300|)>*e<rsub|y>+<around*|(|7644-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>|)>*e<rsub|x>|100>>>
    </unfolded-io>

    <\textput>
      <with|font-series||<with|font-series|bold|3) Proprietà:> Provare che
      <math|A\<times\>B\<neq\>B\<times\>A > e che
      <math|A\<times\>B=-B\<times\>A>>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|input>
      anticomm(A,C):=block(<around*|[|AxC,CxA,cond1,cond2|]>,

      /*Definisco i due prodotti vettoriali*/

      AxC:cross_prod(A,C),print("AxC = ",AxC),

      CxA:cross_prod(C,A),print("CxA = ",CxA),

      cond1:AxC - CxA= 0,

      cond2:AxC+CxA=0,

      if <around|(|cond1|)> then <around*|(|false|)>

      else if<around*|(|cond2|)> then (true)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      C:matrix([c[1]],[c[2]],[c[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>>|<row|<cell|c<rsub|2>>>|<row|<cell|c<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      anticomm(A,C)
    <|unfolded-io>
      <math|<with|math-display|true|<text|AxC =
      ><around*|(|a<rsub|1>*c<rsub|2>-c<rsub|1>*a<rsub|2>|)>*e<rsub|z>+<around*|(|c<rsub|1>*a<rsub|3>-a<rsub|1>*c<rsub|3>|)>*e<rsub|y>+<around*|(|a<rsub|2>*c<rsub|3>-c<rsub|2>*a<rsub|3>|)>*e<rsub|x>>>

      <math|<with|math-display|true|<text|CxA =
      ><around*|(|c<rsub|1>*a<rsub|2>-a<rsub|1>*c<rsub|2>|)>*e<rsub|z>+<around*|(|a<rsub|1>*c<rsub|3>-c<rsub|1>*a<rsub|3>|)>*e<rsub|y>+<around*|(|c<rsub|2>*a<rsub|3>-a<rsub|2>*c<rsub|3>|)>*e<rsub|x>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><math-bf|false>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      anticomm<around*|(|matrix([1.5],[theta*sqrt<around*|(|2|)>],[8.4]),matrix([7.5],[9.1],[%pi])|)>
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|AxC =
      >-<frac|<around*|(|375*2<rsup|<frac|3|2>>*\<vartheta\>-1365|)>*e<rsub|z>+<around*|(|150*\<pi\>-6300|)>*e<rsub|y>+<around*|(|7644-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>|)>*e<rsub|x>|100>>>

      <math|<with|math-display|true|<text|CxA =
      ><frac|<around*|(|375*2<rsup|<frac|3|2>>*\<vartheta\>-1365|)>*e<rsub|z>+<around*|(|150*\<pi\>-6300|)>*e<rsub|y>+<around*|(|7644-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>|)>*e<rsub|x>|100>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><math-bf|true>>>
    </unfolded-io>

    <section|Matrici di Rotazione>

    <\textput>
      Supponiamo che lo spazio di lavoro sia in <math|\<bbb-R\><rsup|2>>,
      allora è possibile definire la matrice di rotazione:

      <\equation*>
        R<around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos<around*|(|\<theta\>|)>>|<cell|-sin<around*|(|\<theta\>|)>>>|<row|<cell|sin<around*|(|\<theta\>|)>>|<cell|cos<around*|(|\<theta\>|)>>>>>>
      </equation*>

      Definisco una generica matrice di rotazione <math|2\<times\>2>.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      rot2(alpha):=block(

      if(nonscalarp(alpha)=false) then

      (return(ratsimp(matrix([cos(alpha), -sin(alpha)],[sin(alpha),
      cos(alpha)]))))

      else(error("Inserire valore scalare"))

      \ \ \ \ \ \ \ )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      rot2(alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      rot2(ident(3))
    <|unfolded-io>
      \;

      Inserire valore scalare

      #0: rot2(alpha=matrix([1,0,0],[0,1,0],[0,0,1]))

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      rot2(0.111*%pi/sqrt(2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|111*\<pi\>|125*2<rsup|<frac|7|2>>>|)>>|<cell|-sin
      <around*|(|<frac|111*\<pi\>|125*2<rsup|<frac|7|2>>>|)>>>|<row|<cell|sin
      <around*|(|<frac|111*\<pi\>|125*2<rsup|<frac|7|2>>>|)>>|<cell|cos
      <around*|(|<frac|111*\<pi\>|125*2<rsup|<frac|7|2>>>|)>>>>>>>>
    </unfolded-io>

    <\textput>
      <\proposition*>
        <\itemize>
          Per una matrice di rotazione valgono le seguenti proprietà:
        </itemize>

        <\equation*>
          R<around*|(|\<theta\>|)><rsup|-1>=R<around*|(|\<theta\>|)><rsup|T>
        </equation*>

        <\equation*>
          det<around*|(|R<around*|(|\<theta\>|)>|)>\<neq\>0
        </equation*>

        <\equation*>
          det<around*|(|R<around*|(|\<theta\>|)>|)>=\<pm\>1\<longrightarrow\><choice|<tformat|<table|<row|<cell|1
          matrice di rotazione>>|<row|<cell|-1 matrice speculare di
          rotazione>>>>>
        </equation*>

        <\equation*>
          <around*|\||\<lambda\><rsub|i>|\|>=1<space|1em>\<forall\>\<lambda\><rsub|i>\<in\>\<sigma\><around*|(|R<around*|(|\<theta\>|)>|)>
        </equation*>

        Per dimostrare l'isometria dobbiamo verificare che
        <math|<choice|<tformat|<table|<row|<cell|R<around*|(|\<theta\>|)><rsup|T>R<around*|(|\<theta\>|)>=I>>|<row|<cell|R<around*|(|\<theta\>|)>*R<around*|(|\<theta\>|)><rsup|T>=I>>>>>>;

        \;

        Possiamo concludere che è Isometrica: quando moltiplicata per un
        vettore, non ne altera la norma.

        Inoltre, si dimostra che valgono le seguenti proprietà:\ 

        <\itemize>
          <item><math|R<rsup|-1><around*|(|\<theta\>|)>=R<around*|(|\<theta\>|)><rsup|T>=R<around*|(|-\<theta\>|)>>;

          <item><math|R<around*|(|\<theta\><rsub|1>+\<theta\><rsub|2>|)>=R<around*|(|\<theta\><rsub|1>|)>*R<around*|(|\<theta\><rsub|2>|)>>;

          <item><math|R<around*|(|\<theta\><rsub|1>|)>*R<around*|(|\<theta\><rsub|2>|)>=R<around*|(|\<theta\><rsub|2>|)>*R<around*|(|\<theta\><rsub|1>|)>>;
          Proprietà commutativa <underline|<strong|SOLO>> in
          <math|\<bbb-R\><rsup|2>>
        </itemize>
      </proposition*>
    </textput>

    <\textput>
      <with|font-series|bold|4) Proprietà:> Dimostrare che
      <math|R<rsub|><around*|(|\<alpha\><rsub|1>+\<alpha\><rsub|2>|)>=R<around*|(|\<alpha\><rsub|1>|)>R<around*|(|\<alpha\><rsub|2>|)>>
      per ogni punto <math|p\<in\>\<bbb-R\><rsup|2>> e quindi rotazioni
      multiple di angoli <math|\<alpha\><rsub|i>> corrispondono ad un unica
      rotazione data dalla somma di tali angoli.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      R[1]:rot2(alpha[1]); R[2]:rot2(alpha[2]); R[12]:rot2(alpha[1]+alpha[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|1>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|1>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|1>|)>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|2>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|2>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|2>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|2>|)>>>>>>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      rot2(0.4*sqrt(3))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|2*<sqrt|3>|5>|)>>|<cell|-sin
      <around*|(|<frac|2*<sqrt|3>|5>|)>>>|<row|<cell|sin
      <around*|(|<frac|2*<sqrt|3>|5>|)>>|<cell|cos
      <around*|(|<frac|2*<sqrt|3>|5>|)>>>>>>>>
    </unfolded-io>

    <\textput>
      Verifico che il prodotto delle matrici di rotazioni corrisponde alla
      matrice di rotazione complessiva.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      if R[12] = trigreduce(R[1].R[2]) then true else false
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|5) Proprietà:>\ 
    </textput>

    Dimostrare che <math|R<around*|(|-\<alpha\>|)>=R<rsup|-1><around*|(|\<alpha\>|)>>
    <math|\<forall\>\<alpha\>>.

    Poiché una matrice di rotazione è antisimmetrica sappiamo che
    <math|R\<cdot\>R<rsup|T>=I> <math|\<forall\>\<alpha\>> e quindi
    <math|R<rsup|-1>=R*<rsup|T>>.

    Presi due punti arbitrari <math|p=<around*|(|x,y|)>\<in\>\<bbb-R\><rsup|2>>
    e <math|<wide|p|^>=<around*|(|<wide|x|^>,<wide|y|^>|)>\<in\>\<bbb-R\><rsup|2>>
    tale che <math|p=R<around*|(|\<alpha\>|)><wide|p|^>>, deve esistere una
    matrice di rotazione tale che <math|R<around*|(|-\<alpha\>|)>p=<wide|p|^>>
    che permette di tornare indietro.\ 

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      inverse2_check(alpha):=block(check1:false, check2:false, check3:false,

      print("Definiamo p, ph, R, Rt"),

      ph:matrix([x[h]],[y[h]]),

      R:rot2(alpha), print("R(",alpha,") =", R),

      Rt:transpose(R), print("R(",alpha,")^T =", Rt),

      p:R.ph, print("p = ",p),

      print("Definisco prodotto matriciale R.Rt"),

      R_Rt:trigsimp(R.Rt),

      print("Controllo che la trasposta è l'inversa di R"),

      if expand(trigreduce((R(alpha).Rt))) = matrix([1,0],[0,1]) then\ 

      \ \ \ check1:true, print("R(",alpha,") . R(",alpha,")^T =",R_Rt),

      print("Definisco R(",-alpha,")"),

      Ra: rot2(-alpha), print("R(",-alpha,") =", Ra),

      print("Definisco prodotto matriciale R.Rt"),

      R_Ra:trigsimp(R.Ra),

      print("Controllo che la rotazione opposta è l'inversa di R"),

      if expand(trigreduce((R(-alpha).R(alpha)))) = matrix([1,0],[0,1]) then\ 

      \ \ \ check2:true, print("R(",alpha,") . R(",-alpha,") =",R_Ra),

      print("Proviamo che possiamo passare da un S.d.R. all'altro"),

      phh: trigsimp(Ra.p),

      if (phh[1] = ph) then

      \ \ check3: true, print("R(",-alpha,") . p = ", phh),\ 

      if ((check1 = check2) and (check1 = check3)) then

      \ \ print("Come volevasi dimostrare")

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      inverse2_check(alpha)$
    <|unfolded-io>
      <math|<with|math-display|true|<text|Definiamo p, ph, R, Rt >>>

      <math|<with|math-display|true|<text|R( >\<alpha\><text|) =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|R( >\<alpha\><text|)<rsup|T> =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|sin <around*|(|\<alpha\>|)>>>|<row|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>

      <math|<with|math-display|true|<text|p =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>*x<rsub|h>-sin
      <around*|(|\<alpha\>|)>*y<rsub|h>>>|<row|<cell|cos
      <around*|(|\<alpha\>|)>*y<rsub|h>+sin
      <around*|(|\<alpha\>|)>*x<rsub|h>>>>>>>>

      <math|<with|math-display|true|<text|Definisco prodotto matriciale R.Rt
      >>>

      \;

      \ <math|<with|math-display|true|<text|Controllo che la trasposta è
      l'inversa di R >>>

      \;

      \ <math|<with|math-display|true|<text|R( >\<alpha\>*<text|) . R(
      >\<alpha\><text|)<rsup|T> = ><matrix|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<text|Definisco R( >-\<alpha\><text|) >>>

      <math|<with|math-display|true|<text|R( >-\<alpha\><text|) =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|sin <around*|(|\<alpha\>|)>>>|<row|<cell|-sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>

      <math|<with|math-display|true|<text|Definisco prodotto matriciale R.Rt
      >>>

      \;

      \ <math|<with|math-display|true|<text|Controllo che la rotazione
      opposta è l'inversa di R >>>

      <math|<with|math-display|true|<text|R( >\<alpha\><text|) . R(
      >-\<alpha\><text|) = ><matrix|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|1>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Proviamo che possiamo passare da
      un S.d.R. all'altro >>>

      <math|<with|math-display|true|<text|R( >-\<alpha\><text|) . p =
      ><matrix|<tformat|<table|<row|<cell|x<rsub|h>>>|<row|<cell|y<rsub|h>>>>>>>>

      <math|<with|math-display|true|<text|Come volevasi dimostrare >>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      inverse2_check(theta*sqrt<around*|(|2|)>*0.1534768)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Definiamo p, ph, R, Rt >>>

      <math|<with|math-display|true|<text|R(
      >0.1534768*<sqrt|2>*\<vartheta\><text|) =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|-sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>|<row|<cell|sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>>>>>>

      <math|<with|math-display|true|<text|R(
      >0.1534768*<sqrt|2>*\<vartheta\><text|)<rsup|T> =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>|<row|<cell|-sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>>>>>>

      <math|<with|math-display|true|<text|p =
      ><matrix|<tformat|<table|<row|<cell|x<rsub|h>*cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>-y<rsub|h>*sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>|<row|<cell|x<rsub|h>*sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>+y<rsub|h>*cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Definisco prodotto matriciale
      R.Rt >>>

      <math|<with|math-display|true|<text|Controllo che la trasposta è
      l'inversa di R >>>

      \;

      \ <math|<with|math-display|true|<text|R(
      >0.1534768*<sqrt|2>*\<vartheta\>*<text|) . R(
      >0.1534768*<sqrt|2>*\<vartheta\><text|)<rsup|T> =
      ><matrix|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<text|Definisco R(
      >-0.1534768*<sqrt|2>*\<vartheta\><text|) >>>

      \;

      \ <math|<with|math-display|true|<text|R(
      >-0.1534768*<sqrt|2>*\<vartheta\><text|) =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>|<row|<cell|-sin
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>|<cell|cos
      <around*|(|<frac|95923*\<vartheta\>|78125*2<rsup|<frac|5|2>>>|)>>>>>>>>

      <math|<with|math-display|true|<text|Definisco prodotto matriciale R.Rt
      >>>

      \;

      \ <math|<with|math-display|true|<text|Controllo che la rotazione
      opposta è l'inversa di R >>>

      <math|<with|math-display|true|<text|R(
      >0.1534768*<sqrt|2>*\<vartheta\><text|) . R(
      >-0.1534768*<sqrt|2>*\<vartheta\><text|) =
      ><matrix|<tformat|<table|<row|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|1>>>>>>>

      <math|<with|math-display|true|<text|Proviamo che possiamo passare da un
      S.d.R. all'altro >>>

      <math|<with|math-display|true|<text|R(
      >-0.1534768*<sqrt|2>*\<vartheta\><text|) . p =
      ><matrix|<tformat|<table|<row|<cell|x<rsub|h>>>|<row|<cell|y<rsub|h>>>>>>>>

      <math|<with|math-display|true|<text|Come volevasi dimostrare >>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >Come volevasi dimostrare >>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|><with|font-series|bold|6)Proprietà:> Una
      matrice è una matrice di rotazione se solo se:

      <\equation*>
        R\<cdummy\>R<rsup|T>=I
      </equation*>

      <\equation*>
        det<around*|(|R|)>=1
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|input>
      isRot(R):=block(

      [Rinput,RT, RRT, II, sz, det],

      \ \ \ \ \ /*Controllo se R è quadrata ed è una matrice*/

      \ \ \ \ \ Rinput:matrix_input(R),

      \ \ \ \ \ if(Rinput#false) then(

      \ \ \ \ \ sz: size(Rinput),

      \ \ \ \ \ RT: transpose(Rinput),

      \ \ \ \ \ RRT:scanmap(trigsimp,scanmap(trigreduce,trigexpand(factor(Rinput.RT)))),

      \ \ \ \ \ II: identfor(Rinput),

      \ \ \ \ \ det: scanmap(trigsimp,scanmap(trigreduce,(trigexpand(factor(determinant(Rinput)))))),

      \ \ \ \ \ if RRT = II and det = 1 then

      \ \ \ \ \ true

      \ \ \ \ \ else

      \ \ \ \ \ false)

      \ \ \ \ \ else error("Inserire una Matrice")

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      R:rot2(sqrt(2)/2*alpha)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>|<cell|-sin
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>>|<row|<cell|sin
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>|<cell|cos
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|sin
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)><rsup|2>+cos
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)><rsup|2>>>

      \;

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><math-bf|true>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-medium|papyrus>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Calcolo
      Vettoriale> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Matrici
      di Rotazione> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>