<TeXmacs|2.1.2>

<style|<tuple|generic|italian|framed-session|maxima>>

<\body>
  <doc-data|<doc-title|\UProcedure\U>|<\doc-subtitle>
    Calcolo Vettoriale in <math|<with|font|Bbb|R<rsup|3>>> e Rotazioni in
    <math|<with|font|Bbb|R<rsup|2>>>

    \;
  </doc-subtitle>>

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
      vect_prod(A,B):=block([E, M, AxB, res],

      /*Verifica delle dimensioni dei vettori*/

      if ((length(A) # length(B)) or (length(A) \<less\> 3)) then

      \ \ \ error("Inserisci due vettori lunghi uguali")

      else(

      \ \ \ /*Definisco vettore simbolico per i versori*/ \ 

      \ \ \ E:matrix([e[x]],[e[y]],[e[z]]),

      \ \ \ /*Definisco matrice per il prodotto vettoriale*/ \ \ 

      \ \ \ M:addrow(transpose(E),transpose(A),transpose(B)),

      \ \ \ /*Calcolo il prodotto vettoriale. Letsimp necessario per\ 

      \ \ \ coprire anche i casi di vettori simbolici assunti come
      paralleli*/

      \ \ \ AxB:mySimp(determinant(M)),

      \ \ \ /*Verifico se i due vettori sono paralleli*/

      \ \ \ if AxB = 0 then

      \ \ \ \ \ res: true

      \ \ \ else\ 

      \ \ \ \ \ res: false), \ \ \ \ \ \ \ \ \ 

      \ return([AxB, res])

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
      AxB:vect_prod(A,B)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|a<rsub|1>*b<rsub|2>*e<rsub|z>-b<rsub|1>*a<rsub|2>*e<rsub|z>-a<rsub|1>*b<rsub|3>*e<rsub|y>+b<rsub|1>*a<rsub|3>*e<rsub|y>+a<rsub|2>*b<rsub|3>*e<rsub|x>-b<rsub|2>*a<rsub|3>*e<rsub|x>,<math-bf|false>|]>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|2) Propriet�:<with|font-series|bold|
      <with|font-series|medium|il prodotto vettoriale tra due vettori
      paralleli � nullo>>>

      Per provare la propriet�, assumiamo che <math|B=\<alpha\>\<cdot\>A>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      let(B[1,1],alpha*A[1,1]);

      let(B[2,1],alpha*A[2,1]);

      let(B[3,1],alpha*A[3,1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>b<rsub|1>\<longrightarrow\>A<rsub|1,1>*\<alpha\>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>b<rsub|2>\<longrightarrow\>A<rsub|2,1>*\<alpha\>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >>b<rsub|3>\<longrightarrow\>A<rsub|3,1>*\<alpha\>>>
    </unfolded-io>

    <\textput>
      Semplifichiamo con <with|font-shape|italic|letsimp()>, vediamo che le
      assunzioni sono state ben definite.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      B:letsimp(B)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><matrix|<tformat|<table|<row|<cell|a<rsub|1>*\<alpha\>>>|<row|<cell|a<rsub|2>*\<alpha\>>>|<row|<cell|a<rsub|3>*\<alpha\>>>>>>>>
    </unfolded-io>

    <\textput>
      Verifichiamo anche con la procedura precedente
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      vect_prod(A, B)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|0,<math-bf|true>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      vect_prod<around*|(|matrix([1.5],[theta*sqrt<around*|(|2|)>],[8.4]),matrix([7.5],[9.1],[%pi])|)>
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|-<frac|375*2<rsup|<frac|3|2>>*\<vartheta\>*e<rsub|z>-1365*e<rsub|z>+150*\<pi\>*e<rsub|y>-6300*e<rsub|y>-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>*e<rsub|x>+7644*e<rsub|x>|100>,<math-bf|false>|]>>>
    </unfolded-io>

    <\textput>
      <with|font-series||<with|font-series|bold|3) Propriet�:> Provare che
      <math|A\<times\>B\<neq\>B\<times\>A > e che
      <math|A\<times\>B=-B\<times\>A>>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      anticomm(A,C):=block(<around*|[|AxC,CxA,cond1,cond2|]>,

      /*Definisco i due prodotti vettoriali*/

      AxC:vect_prod(A,C)[1],print("AxC = ",AxC),

      CxA:vect_prod(C,A)[1],print("CxA = ",CxA),

      cond1:mySimp<around|(|AxC|)> = mySimp<around|(|CxA|)>,

      cond2:mySimp<around*|(|AxC|)>=mySimp<around*|(|-CxA|)>,

      if <around|(|cond1|)> then <around*|(|print<around*|(|"AxC=CxA"|)>|)>

      else if<around*|(|cond2|)> then print<around*|(|"AxC=-CxA"|)>

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      C:matrix([c[1]],[c[2]],[c[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>>|<row|<cell|c<rsub|2>>>|<row|<cell|c<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      anticomm(A,C)
    <|unfolded-io>
      <math|<with|math-display|true|<text|AxC =
      >a<rsub|1>*c<rsub|2>*e<rsub|z>-c<rsub|1>*a<rsub|2>*e<rsub|z>-a<rsub|1>*c<rsub|3>*e<rsub|y>+c<rsub|1>*a<rsub|3>*e<rsub|y>+a<rsub|2>*c<rsub|3>*e<rsub|x>-c<rsub|2>*a<rsub|3>*e<rsub|x>>>

      \;

      \ <math|<with|math-display|true|<text|CxA =
      >-<around*|(|a<rsub|1>*c<rsub|2>*e<rsub|z>-c<rsub|1>*a<rsub|2>*e<rsub|z>-a<rsub|1>*c<rsub|3>*e<rsub|y>+c<rsub|1>*a<rsub|3>*e<rsub|y>+a<rsub|2>*c<rsub|3>*e<rsub|x>-c<rsub|2>*a<rsub|3>*e<rsub|x>|)>>>

      \;

      \ <math|<with|math-display|true|<text|AxC=-CxA >>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >AxC=-CxA >>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      anticomm<around*|(|matrix([1.5],[theta*sqrt<around*|(|2|)>],[8.4]),matrix([7.5],[9.1],[%pi])|)>
    <|unfolded-io>
      <math|<with|math-display|true|<text|AxC =
      >-<frac|375*2<rsup|<frac|3|2>>*\<vartheta\>*e<rsub|z>-1365*e<rsub|z>+150*\<pi\>*e<rsub|y>-6300*e<rsub|y>-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>*e<rsub|x>+7644*e<rsub|x>|100>>>

      <math|<with|math-display|true|<text|CxA =
      ><frac|375*2<rsup|<frac|3|2>>*\<vartheta\>*e<rsub|z>-1365*e<rsub|z>+150*\<pi\>*e<rsub|y>-6300*e<rsub|y>-25*2<rsup|<frac|5|2>>*\<pi\>*\<vartheta\>*e<rsub|x>+7644*e<rsub|x>|100>>>

      <math|<with|math-display|true|<text|AxC=-CxA >>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >AxC=-CxA >>>
    </unfolded-io>

    <section|Matrici di Rotazione>

    <\textput>
      Supponiamo che lo spazio di lavoro sia in <math|\<bbb-R\><rsup|2>>,
      allora � possibile definire la matrice di rotazione:

      <\equation*>
        R<around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos<around*|(|\<theta\>|)>>|<cell|-sin<around*|(|\<theta\>|)>>>|<row|<cell|sin<around*|(|\<theta\>|)>>|<cell|cos<around*|(|\<theta\>|)>>>>>>
      </equation*>

      Definisco una generica matrice di rotazione <math|2\<times\>2>.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      rot2(alpha):=mySimp(matrix([cos(alpha), -sin(alpha)],[sin(alpha),
      cos(alpha)]))$
    </input>

    <\textput>
      <\proposition*>
        <\itemize>
          Per una matrice di rotazione valgono le seguenti propriet�:
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

        Possiamo concludere che � Isometrica: quando moltiplicata per un
        vettore, non ne altera la norma.

        Inoltre, si dimostra che valgono le seguenti propriet�:\ 

        <\itemize>
          <item><math|R<rsup|-1><around*|(|\<theta\>|)>=R<around*|(|\<theta\>|)><rsup|T>=R<around*|(|-\<theta\>|)>>;

          <item><math|R<around*|(|\<theta\><rsub|1>+\<theta\><rsub|2>|)>=R<around*|(|\<theta\><rsub|1>|)>*R<around*|(|\<theta\><rsub|2>|)>>;

          <item><math|R<around*|(|\<theta\><rsub|1>|)>*R<around*|(|\<theta\><rsub|2>|)>=R<around*|(|\<theta\><rsub|2>|)>*R<around*|(|\<theta\><rsub|1>|)>>;
          Propriet� commutativa <underline|<strong|SOLO>> in
          <math|\<bbb-R\><rsup|2>>
        </itemize>
      </proposition*>
    </textput>

    <\textput>
      <with|font-series|bold|4) Propriet�:> Dimostrare che
      <math|R<rsub|><around*|(|\<alpha\><rsub|1>+\<alpha\><rsub|2>|)>=R<around*|(|\<alpha\><rsub|1>|)>R<around*|(|\<alpha\><rsub|2>|)>>
      per ogni punto <math|p\<in\>\<bbb-R\><rsup|2>> e quindi rotazioni
      multiple di angoli <math|\<alpha\><rsub|i>> corrispondono ad un unica
      rotazione data dalla somma di tali angoli.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      R[1]:rot2(alpha[1]); R[2]:rot2(alpha[2]); R[12]:rot2(alpha[1]+alpha[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|1>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|1>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|1>|)>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|2>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|2>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|2>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|2>|)>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>|<cell|-sin
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>|<cell|cos
      <around*|(|\<alpha\><rsub|2>+\<alpha\><rsub|1>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      rot2(0.4*sqrt(3))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
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
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      if R[12] = trigreduce(R[1].R[2]) then true else false
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|5) Propriet�:>\ 
    </textput>

    Dimostrare che <math|R<around*|(|-\<alpha\>|)>=R<rsup|-1><around*|(|\<alpha\>|)>>
    <math|\<forall\>\<alpha\>>.

    Poich� una matrice di rotazione � antisimmetrica sappiamo che
    <math|R\<cdot\>R<rsup|T>=I> <math|\<forall\>\<alpha\>> e quindi
    <math|R<rsup|-1>=R*<rsup|T>>.

    Presi due punti arbitrari <math|p=<around*|(|x,y|)>\<in\>\<bbb-R\><rsup|2>>
    e <math|<wide|p|^>=<around*|(|<wide|x|^>,<wide|y|^>|)>\<in\>\<bbb-R\><rsup|2>>
    tale che <math|p=R<around*|(|\<alpha\>|)><wide|p|^>>, deve esistere una
    matrice di rotazione tale che <math|R<around*|(|-\<alpha\>|)>p=<wide|p|^>>
    che permette di tornare indietro.\ 

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|input>
      inverse_check(alpha):=block(check1:false, check2:false, check3:false,

      print("Definiamo p, ph, R, Rt"),

      ph:matrix([x[h]],[y[h]]),

      R:rot2(alpha), print("R(",alpha,") =", R),

      Rt:transpose(R), print("R(",alpha,")^T =", Rt),

      p:R.ph, print("p = ",p),

      print("Definisco prodotto matriciale R.Rt"),

      R_Rt:trigsimp(R.Rt),

      print("Controllo che la trasposta � l'inversa di R"),

      if expand(trigreduce((R(alpha).Rt))) = matrix([1,0],[0,1]) then\ 

      \ \ \ check1:true, print("R(",alpha,") . R(",alpha,")^T =",R_Rt),

      print("Definisco R(",-alpha,")"),

      Ra: rot2(-alpha), print("R(",-alpha,") =", Ra),

      print("Definisco prodotto matriciale R.Rt"),

      R_Ra:trigsimp(R.Ra),

      print("Controllo che la rotazione opposta � l'inversa di R"),

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
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      inverse_check(alpha)$
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Definiamo p, ph, R, Rt >>>

      \;

      \ <math|<with|math-display|true|<text|R( >\<alpha\><text|) =
      ><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>

      <math|<with|math-display|true|<text|R( >\<alpha\><text|)<rsup|T> =
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

      \ <math|<with|math-display|true|<text|Controllo che la trasposta �
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
      opposta � l'inversa di R >>>

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
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      inverse_check(theta*sqrt<around*|(|2|)>*0.1534768)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Definiamo p, ph, R, Rt >>>

      \;

      \ <math|<with|math-display|true|<text|R(
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

      <math|<with|math-display|true|<text|Definisco prodotto matriciale R.Rt
      >>>

      \;

      \ <math|<with|math-display|true|<text|Controllo che la trasposta �
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
      opposta � l'inversa di R >>>

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

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >Come volevasi dimostrare >>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|><with|font-series|bold|6)Propriet�:> Una
      matrice � una matrice di rotazione se solo se:

      <\equation*>
        R\<cdummy\>R<rsup|T>=I
      </equation*>

      <\equation*>
        det<around*|(|R|)>=1
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      isRot(R):=block(

      [RT, RRT, II, sz, det],

      \ \ \ \ \ /*Controllo se R � quadrata ed � una matrice*/

      \ \ \ \ \ sz: size(R),

      \ \ \ \ \ if sz[1]\<less\>1 or sz[1] # sz[2] then

      \ \ \ \ \ \ \ error("Inserire una matrice quadrata"),

      \ \ \ \ \ RT: transpose(R),

      \ \ \ \ \ RRT:mySimp(R.RT),

      \ \ \ \ \ II: identfor(R),

      \ \ \ \ \ det: mySimp(determinant(R)),

      \ \ \ \ \ if RRT = II and det = 1 then

      \ \ \ \ \ true

      \ \ \ \ \ else

      \ \ \ \ \ false

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      R:rot2(sqrt(2)/2*alpha)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>|<cell|-sin
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>>|<row|<cell|sin
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>|<cell|cos
      <around*|(|<frac|\<alpha\>|<sqrt|2>>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><math-bf|true>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|input>
      \;
    </input>
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