<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  \;

  <doc-data|<doc-author|<author-data|<author-name|Andrea Efficace & Lorenzo
  Rossi>>>|<\doc-subtitle>
    Matrice Antisimmetrica e legame con Matrici di Rotazione,

    Formula di Rodrigues e Parametrizzazione di Cayley
  </doc-subtitle>>

  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|12)Procedura:> definire una matrice
      antisimmetrica <math|S<around*|(|v|)>> dato un vettore <math|v>.

      <\equation*>
        S<around*|(|v|)>=<matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|z>>|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>|<cell|0>|<cell|-v<rsub|x>>>|<row|<cell|-v<rsub|y>>|<cell|v<rsub|x>>|<cell|0>>>>>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      S(v):=block(

      [S],

      /*Controlliamo che v sia un vettore o una lista*/

      if vector_input(v)=false then

      \ \ error("Inserire un vettore colonna di tre elementi")

      else(

      \ \ S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0])

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      vv:matrix([v[x]],[v[y]],[v[z]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|x>>>|<row|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      S:S(vv)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|z>>|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>|<cell|0>|<cell|-v<rsub|x>>>|<row|<cell|-v<rsub|y>>|<cell|v<rsub|x>>|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.1)Procedura:> Verificare una matrice sia
      antisimmetrica
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      isAsim(S):=block(

      [st, sz: size(S), sum],

      if matrix_input(S)=false then error("Inserire una matrice quadrata"),
      \ \ \ \ 

      st: transpose(S),

      if st = -S then return(true)

      else return(false)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      isAsim(S)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      S:S(matrix([ratsimp(0.14564)],[sqrt(%pi)*theta[i]],[rho*1/431]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|\<rho\>|431>>|<cell|<sqrt|\<pi\>>*\<vartheta\><rsub|i>>>|<row|<cell|<frac|\<rho\>|431>>|<cell|0>|<cell|-<frac|3641|25000>>>|<row|<cell|-<sqrt|\<pi\>>*\<vartheta\><rsub|i>>|<cell|<frac|3641|25000>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      isAsim(S)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.2)Procedura:> data una matrice antisimmetrica
      <math|S<around*|(|v|)>> determinare il vettore <math|v>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      getAsimVect(S):=block(

      [v:zeromatrix(3,1)],

      /*Verifico che la matrice � antisimmetrica*/

      if isAsim(S) then(

      /*Mappo le componenti della matrice antisimmetrica nel vettore*/

      \ \ v[1,1]:S[3,2],

      \ \ v[2,1]:S[1,3],

      \ \ v[3,1]:S[2,1],

      \ \ return(v)

      ) else (

      \ \ error("La matrice non � antisimmetrica")

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      getAsimVect(S)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|<frac|3641|25000>>>|<row|<cell|<sqrt|\<pi\>>*\<vartheta\><rsub|i>>>|<row|<cell|<frac|\<rho\>|431>>>>>>>>
    </unfolded-io>

    <\textput>
      <\with|font-shape|right>
        <with|font-series|bold|12.3)Procedura:> calcolare il prodotto
        vettoriale <math|v\<times\>w> come prodotto matriciale

        <center|<center|><math|v\<times\>w=S<around*|(|v|)>\<cdot\>w>>
      </with>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      antiSimProduct(v,w):=block(

      [S,Sw],

      \ S:S(v),

      \ Sw:S.w,

      \ return(Sw)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      ww:matrix([w[x]],[w[y]],[w[z]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><matrix|<tformat|<table|<row|<cell|w<rsub|x>>>|<row|<cell|w<rsub|y>>>|<row|<cell|w<rsub|z>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      prod1:antiSimProduct(vv,ww)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      Calcolo il prodotto vettoriale con la nostra procedura. Prendiamo il
      primo membro del risultato per come � stata definita.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      prod2:cross_prod(vv,ww)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>e<rsub|x>*<around*|(|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>|)>+e<rsub|y>*<around*|(|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>|)>+<around*|(|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>|)>*e<rsub|z>>>
    </unfolded-io>

    <\textput>
      Per verificare il risultato, applichiamo una sostituzione per eliminare
      i versori simbolici
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      psubst([e[x]=matrix([1],[0],[0]),e[y]=matrix([0],[1],[0]),e[z]=matrix([0],[0],[1])],prod2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|13)Procedura:> calcolare l'esponenziale di
      matrice, <math|\<mathe\><rsup|A\<nosymbol\>t>> usando la trasformata di
      Laplace
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|input>
      expLaplace(A,t):=block(

      [sz, II, s, sIImA, sIImAT, i, iltA],

      \ \ \ \ \ /*Controlliamo che la matrice inserita sia quadrata*/

      \ \ \ \ \ sz:size(A),

      \ \ \ \ \ if(sz[1]#sz[2]) then error("Matrice non Quadrata"),

      \ \ \ \ \ II:ident(sz[1]),

      \ \ \ \ \ sIImA:invert(s*II-A),

      \ \ \ \ \ iltA:zerofor(A),

      \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ for j:1 thru sz[2] do(

      \ \ \ \ \ \ \ \ \ iltA[i,j]:ilt(sIImA[i,j],s,t)

      \ \ \ \ \ \ \ )

      \ \ \ \ \ ),

      \ \ \ \ \ return(scanmap(trigsimp,expand(trigexpand(iltA))))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      A:matrix([1,1,0],[0,2,2],[0,0,3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|2>>|<row|<cell|0>|<cell|0>|<cell|3>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      expLaplace(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|2*t>-\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>+\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\textput>
      <\textput>
        <with|font-series|bold|13.1)Procedura:>
        <with|font-shape|right|Scrivere una procedura che utilizzando la
        forma canonica di Jordan calcoli la matrice esponenziale. Ovvero,
        trovare una matrice invertibile <math|V> tale che:>

        <center|<\math>
          \<mathe\><rsup|A*t>=V\<cdot\>\<mathe\><rsup|J<rsub|A>t>\<cdot\>V<rsup|-1><with|font-shape|right|>
        </math>>
      </textput>

      Dove <math|\<mathe\><rsup|J<rsub|A>t>> � l'esponenziale di matrice
      della forma di jordan <math|J<rsub|A>> della matrice <math|A>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|input>
      expVect(A,t):=block(

      [sz, V, eigVec, Vi, D, expD, res, theta],

      \ \ \ \ \ \ sz:size(A),

      \ \ \ \ \ \ if matrix_input(A) then error("Matrix not Square"),

      /*Definiamo una matrice vuota pronta a contenere vettori colonna di
      dimensione 3*/

      \ \ \ \ \ \ V:zeromatrix(sz[1],0),

      \ \ \ \ \ \ eigVec:myEigens(A)[2],

      \ \ \ \ \ \ /*Controlliamo la presenza di eventuali blocchi di Jordan e
      andiamo in recovery usando expLaplace*/

      \ \ \ \ \ \ if(length(eigVec)#3) then return(expLaplace(A,t)),

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ \ V:addcol(V, eigVec[i])

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ Vi:matrix_input(invert(V)),

      \ \ \ \ \ \ D:Vi.A.matrix_input(V),

      \ \ \ \ \ \ expD:D,

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ expD[i,i]:exp(expD[i,i]*t)

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ res:matrix_input(V).expD.Vi,

      \ \ \ \ \ \ return(scanmap(ratsimp,scanmap(factor,res,bottomup)))

      )$
    </input>

    <\textput>
      Definiamo una matrice <math|A> e verifichiamo il risultato delle due
      procedure.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      A:matrix([1,1,0],[0,2,2],[0,0,3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|2>>|<row|<cell|0>|<cell|0>|<cell|3>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      length(myEigens(A)[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>3>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      expLaplace(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|2*t>-\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>+\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      expVect(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|2*t>-\<mathe\><rsup|t>>|<cell|\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>+\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*\<mathe\><rsup|3*t>-2*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      a:matrix([0,1,0],[1,0,0],[0,0,-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      (expVect(a,t))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>-1|)>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>-1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      expLaplace(a,t)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>-1|)>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>-1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|14)Procedura:> verificare che le matrici di
      rotazione sono parametrizzate da esponenziali di matrici
      antisimmetriche, con <math|v> <with|font-series|bold|versore>. Ovvero

      <\equation*>
        R<rsub|v><around*|(|\<vartheta\>|)>=\<mathe\><rsup|S<rsub|><around*|(|v|)>\<vartheta\>>
      </equation*>

      Dobbiamo eseguire i seguenti passi:

      1) Calcolo della matrice <math|S<around*|(|k|)> con k
      \<in\><around*|{|e<rsub|x>,e<rsub|y>,e<rsub|z>|}> con
      e<rsub|x>,e<rsub|y>,e<rsub|z> versori dei rispettivi assi x,y,z>:

      <space|9em><math|S<around*|(|e<rsub|x>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0-1>>|<row|<cell|0<space|1em>1<space|1em>0>>>>>;S<around*|(|e<rsub|y>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>1>>|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|-1<space|1em>0<space|1em>0>>>>>;S<around*|(|e<rsub|z>|)>=<matrix|<tformat|<table|<row|<cell|0-1<space|1em>0>>|<row|<cell|1<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0<space|1em>0>>>>>.>

      2)Calcolo della matrice <math|s*I-S<around*|(|k|)>> di Laplace con s
      variabile di Laplace e I matrice identit�
      <math|I><math|\<in\>R<rsup|3x3>>:

      <space|5em><math|s*I-S<around*|(|e<rsub|x>|)>=><math|<matrix|<tformat|<table|<row|<cell|s<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>s-1>>|<row|<cell|0<space|1em>1<space|1em>s>>>>>>;<math|s*I-S<around*|(|e<rsub|y>|)>=><math|<matrix|<tformat|<table|<row|<cell|s<space|1em>0<space|1em>1>>|<row|<cell|0<space|1em>s<space|1em>0>>|<row|<cell|-1
      0<space|1em>s>>>>>;s*I-S<around*|(|e<rsub|z>|)>=><math|<matrix|<tformat|<table|<row|<cell|s-1<space|1em>0>>|<row|<cell|1<space|1em>s<space|1em>0>>|<row|<cell|0<space|1em>0<space|1em>s>>>>>>.

      3)Invertire le matrici appena ottenute:

      <space|13em><math|<around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|1|s>
      <space|1em>0<space|1em>0>>|<row|<cell|0<space|1em><frac|s|s<rsup|2>+1><space|1em><frac|1|s<rsup|2>+1>>>|<row|<cell|0<space|1em><frac|1|s<rsup|2>+1><space|1em><frac|s|s<rsup|2>+1>>>>>>>;\ 

      <space|13em><math|\<space\><around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|0>|<cell|<frac|s|s<rsup|3>+s>>>|<row|<cell|0>|<cell|<frac|s<rsup|2>+1|s<rsup|3>+s>>|<cell|0>>|<row|<cell|-<frac|s|s<rsup|3>+s>>|<cell|0>|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>>>>>>;\ 

      <space|13em><math|<around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|-<frac|s|s<rsup|3>+s>>|<cell|0>>|<row|<cell|<frac|s|s<rsup|3>+s>>|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|s<rsup|2>+1|s<rsup|3>+s>>>>>>>.

      4)Calcolare l'inversa di Laplace della matrici inverse
      <math|\<cal-L\><around*|{|<around*|(|s*I-S<around*|(|k|)>|)><rsup|-1>|}><rsup|-1>>:

      <\equation*>
        R<rsub|x><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|-sin
        <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
        <around*|(|\<vartheta\>|)>>|<cell|cos
        <around*|(|\<vartheta\>|)>>>>>>;R<rsub|y><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|sin
        <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
        <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|cos
        <around*|(|\<vartheta\>|)>>>>>>;R<rsub|z><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|-sin
        <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
        <around*|(|\<vartheta\>|)>>|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|input>
      rotExp(S,t):=block(

      [R],

      /*Verifichiamo che S sia antisimmetrica*/

      if isAsim(S) then(

      \ \ R:expLaplace(S,t),

      \ \ return(R)

      ) else (

      \ \ error("Inserire una matrice antisimmetrica")

      )

      )$
    </input>

    <\textput>
      Verifichiamo:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      v:matrix([1],[sqrt(2)],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<sqrt|2>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      S:S(normalize(v)[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<frac|<sqrt|2>|<sqrt|3>>>>|<row|<cell|0>|<cell|0>|<cell|-<frac|1|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>|<sqrt|3>>>|<cell|<frac|1|<sqrt|3>>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      R:demoivre(rotExp(S,theta))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*cos
      <around*|(|\<vartheta\>|)>+1|3>>|<cell|-<frac|<sqrt|2>*cos
      <around*|(|\<vartheta\>|)>-<sqrt|2>|3>>|<cell|<frac|<sqrt|2>*sin
      <around*|(|\<vartheta\>|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*cos
      <around*|(|\<vartheta\>|)>-<sqrt|2>|3>>|<cell|<frac|cos
      <around*|(|\<vartheta\>|)>+2|3>>|<cell|-<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*sin
      <around*|(|\<vartheta\>|)>|<sqrt|3>>>|<cell|<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|3>>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|15)Procedura:> implementare la formula di
      Rodrigues

      <\equation*>
        <center|<math|R<rsub|v>*<around*|(|\<vartheta\>|)>=I+S<rsup|2><around*|(|v|)><around*|(|1-cos<around*|(|\<vartheta\>|)>|)>+S<around*|(|v|)>sin<around*|(|\<vartheta\>|)>>>
      </equation*>
    </textput>

    <\textput>
      definiamo una procedura ausiliaria per normalizzare un vettore
      qualsiasi, esprimendolo come:

      <\equation*>
        <wide|v|\<vect\>>=<around*|\<\|\|\>|v|\<\|\|\>>*<wide|u|\<vect\>>
      </equation*>

      Dove <math|<wide|u|\<vect\>>> � un versore.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|input>
      normalize(v):=block(

      [norm, u, i, sz, vv],

      sz:size(v),

      /*Mi assicuro che v sia un vettore colonna*/

      if nonscalarp(v) and sz[2] = 1 \ then(

      \ \ vv:ratsimp(v),

      \ \ norm:sqrt(transpose(vv).vv),

      \ \ u:vv/norm

      ),

      return([norm,u])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      v:matrix([sqrt(2)],[1.1],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><matrix|<tformat|<table|<row|<cell|<sqrt|2>>>|<row|<cell|1.1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      [norm,u]:normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|<frac|<sqrt|321>|10>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\textput>
      Verifico il risultato espresso in [norma, versore]
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|input>
      rodrigues(v,theta):=block(

      [S,II,S2,rodr,norm,u,theta1],

      /*normaliziamo il vettore*/

      [norm,u]:normalize(v),

      /*calcoliamo l'antisimmetrica sul versore*/

      \ S:S(u),

      \ II:identfor(S),

      \ /*S2:trigsimp(expand(trigreduce(expand(S.S)))),*/

      \ S2:S.S,

      \ /*implementiamo la formula di rodrigues, moltiplicando l'angolo per
      la norma di v*/

      \ theta1: theta,

      \ /*rodr:scanmap(factor,scanmap(ratsimp,factor(trigexpand(II+S2*(1-cos(theta1))+S*sin(theta1)))),bottomup),*/

      \ rodr:II+S2*(1-cos(theta1))+S*sin(theta1),

      \ return((rodr))

      )$
    </input>

    <\textput>
      Verifichiamo:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      R:expand(rodrigues(v,%pi/3+1.5))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>+<frac|200|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>+<frac|121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>>>>>>>>
    </unfolded-io>

    <\textput>
      Controlliamo che � davvero una matrice di rotazione:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      Verifichiamo una rotazione generica attorno all'asse <math|x>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      rx: rodrigues(matrix([1],[1],[0]),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|1-cos
      <around*|(|\<vartheta\>|)>|2>>|<cell|<frac|1-cos
      <around*|(|\<vartheta\>|)>|2>>|<cell|<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|2>>>>|<row|<cell|<frac|1-cos
      <around*|(|\<vartheta\>|)>|2>>|<cell|1-<frac|1-cos
      <around*|(|\<vartheta\>|)>|2>>|<cell|-<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|\<vartheta\>|)>|<sqrt|2>>>|<cell|cos
      <around*|(|\<vartheta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      isRot(rx)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|16)Procedura:> Calcolare l'asse di una matrice
      di rotazione

      L'asse di rotazione viene determinato dall'autovettore relativo
      all'autovalore 1. In particolare, occorre imporre:

      <\equation*>
        <around*|(|\<lambda\>I-R|)>*v=R*<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>>>>=<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>
        con \<lambda\>=1
      </equation*>

      e trovare i coefficienti <math|a,b,c> di <math|v> affinch� il prodotto
      <math|<around*|(|I-R|)>*v=\<b-0\>> e
      <math|v\<neq\><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>>.\ 

      Il vettore <math|v> normalizzato risultante � l'asse di rotazione.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|input>
      getAxis(R):=block(

      [II, v, i, u, norm,c],

      \ \ /*Verifichiamo che la matrice data � di rotazione*/

      \ \ if (isRot(R) = false) then (

      \ \ \ \ error("La matrice inserita non � di rotazione.")

      \ \ ) else (

      \ \ \ \ /*Calcolo autovalori e autovettori*/

      \ \ \ \ eigs:myEigens(R),\ 

      \ \ \ \ for i:1 thru length(eigs[1]) do(

      /*Cerco l'autovettore relativo all'autovalore 1. Unico per ipotesi.*/

      \ \ \ \ \ \ if eigs[1][i] = 1 then( /*scorro autovalori per trovare
      lambda=1*/

      \ \ \ \ \ \ \ \ \ v:expand(eigs[2][i]), \ \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ \ [norm, u] : normalize(v),

      \ \ \ \ \ \ \ \ \ return([v/norm, norm, u])

      \ \ \ \ \ \ )

      \ \ \ \ )

      \ \ ) \ \ \ \ \ \ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      res:simp(getAxis(R))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>,<frac|<sqrt|321>|5*2<rsup|<frac|3|2>>>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|17) Procedura:> Determinare l'angolo di una
      matrice di rotazione

      Per calcolare l'angolo di rotazione, occorre risolvere il seguente
      sistema:

      <space|14em><math|\<space\><around*|{|<tabular|<tformat|<table|<row|<cell|R=I+S<rsup|2><around*|(|v|)>*<around*|(|1-c|)>+S<around*|(|v|)>*s>>|<row|<cell|R<rsup|T>=I+S<rsup|2><around*|(|v|)>*<around*|(|1-c|)>-S<around*|(|v|)>*s>>>>>|\<nobracket\>>>

      <\equation*>
        <around*|(|a|)><frac|R-R<rsup|T>|2>=S<around*|(|v|)>*s
      </equation*>

      <\equation*>
        <around*|(|b|)><frac|R+R<rsup|T>|2>-I=S<rsup|2><around*|(|v|)>*<around*|(|1-c|)>
      </equation*>

      L'angolo \<theta\> viene determinata dalla seguente formula:

      <\equation*>
        <around*|(|c|)>\<theta\>=atan2<around*|(|s,c|)>
      </equation*>

      In cui <math|s> viene calcolato prendendo un qualsiasi elemento
      <math|a<rsub|i,j>\<neq\>0 >con <math|a<rsub|i,j>\<in\>S<around*|(|v|)>>
      con il corrispettivo elemento <math|b<rsub|i,j> >nella matrice
      <math|<around*|(|a|)><frac|R-R<rsup|T>|2>> e risolvendo l'equazione:

      <\equation*>
        b<rsub|i,j>=a<rsub|i,j>*sin<around*|(|\<theta\>|)>
      </equation*>

      Invece c, viene calcolato prendendo un qualsiasi elemento
      <math|c<rsub|i,j>\<neq\>0> con <math|c<rsub|i,j>\<in\>S<rsup|2><around*|(|v|)>>
      con il corrispettivo elemento <math|d<rsub|i,j>> nella matrice
      <math|<around*|(|b|)><frac|R+R<rsup|T>|2>-I >e risolvendo l'equazione:

      <\equation*>
        c<rsub|i,j><around*|(|1-cos<around*|(|\<theta\>|)>|)>=d<rsub|i,j>
      </equation*>
    </textput>

    \;

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|input>
      getAngle(R):=block(

      [Rplus, Rminus, S1, S2, dim, Rt, v, c:0, s:0, norm, u, angle,cc,Rm],

      \ \ \ \ \ \ \ \ Rm:matrix_input(R),

      \ \ \ \ \ \ \ \ dim:size(Rm),

      \ \ \ \ \ \ \ \ Rt:transpose(Rm),

      \ \ \ \ \ \ \ \ I:ident(dim[1]),

      \ \ \ \ \ \ \ \ Rminus:trigsimp(factor((Rm-Rt)/2)),

      \ \ \ \ \ \ \ \ Rplus:trigsimp(factor((Rm+Rt)/2-I)), \ 

      \ \ \ \ \ \ \ \ [v, norm, u]:getAxis(Rm), \ 

      \ \ \ \ \ \ \ \ S1:S(u),

      \ \ \ \ \ \ \ \ if(isRot(R) = false) then (

      \ \ \ \ \ \ \ \ error("La matrice inserita non di rotazione.")),
      \ \ \ \ 

      \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S1[i][j]#0) then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ s:Rminus[i][j]/S1[i][j],

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(s))

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ S2:S1.S1,

      \ \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S2[i][j]#0) then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ c:expand(1-Rplus[i][j]/S2[i][j]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(c))

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ angle:simp(atan2mod(expand(s),expand(c))),

      \ \ \ \ \ \ \ \ return(expand(angle))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      angle:getAngle(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><frac|\<pi\>|3>+<frac|3|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      angle
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><frac|\<pi\>|3>+<frac|3|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|input>
      v:matrix([1],[0],[0])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      angle:%pi/3
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >><frac|\<pi\>|3>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      Rr:rodrigues(v,angle)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|<frac|1|2>>|<cell|-<frac|<sqrt|3>|2>>>|<row|<cell|0>|<cell|<frac|<sqrt|3>|2>>|<cell|<frac|1|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|unfolded-io>
      getAxis(Rr)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o47>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,1,<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|unfolded-io>
      getAngle(Rr)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o48>)
      >><frac|\<pi\>|3>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|unfolded-io>
      angle:alpha
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o49>)
      >>\<alpha\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|unfolded-io>
      Ra:rodrigues(v,angle)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o50>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<alpha\>|)>>|<cell|-sin
      <around*|(|\<alpha\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<alpha\>|)>>|<cell|cos <around*|(|\<alpha\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      getAxis(Ra)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>,1,<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      getAngle(Ra)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >>\<alpha\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>53) >
    <|unfolded-io>
      v:matrix([aa],[bb],[cc])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o53>)
      >><matrix|<tformat|<table|<row|<cell|<math-up|aa>>>|<row|<cell|<math-up|bb>>>|<row|<cell|<math-up|cc>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
    <|unfolded-io>
      angle:alpha
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o54>)
      >>\<alpha\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>55) >
    <|unfolded-io>
      Rsym:rodrigues(v,angle)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o55>)
      >><matrix|<tformat|<table|<row|<cell|<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<around*|(|-<frac|<math-up|cc><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|<math-up|bb><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>|)>+1>|<cell|<frac|<math-up|aa>*<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|bb>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|sin
      <around*|(|\<alpha\>|)>*<math-up|cc>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>>|<cell|<frac|sin
      <around*|(|\<alpha\>|)>*<math-up|bb>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>+<frac|<math-up|aa>*<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|cc>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>>|<row|<cell|<frac|sin
      <around*|(|\<alpha\>|)>*<math-up|cc>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>+<frac|<math-up|aa>*<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|bb>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>|<cell|<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<around*|(|-<frac|<math-up|cc><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|<math-up|aa><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>|)>+1>|<cell|<frac|<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|bb>*<math-up|cc>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|<math-up|aa>*sin
      <around*|(|\<alpha\>|)>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>>>|<row|<cell|<frac|<math-up|aa>*<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|cc>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|sin
      <around*|(|\<alpha\>|)>*<math-up|bb>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>>|<cell|<frac|<math-up|aa>*sin
      <around*|(|\<alpha\>|)>|<sqrt|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>+<frac|<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<math-up|bb>*<math-up|cc>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>>|<cell|<around*|(|1-cos
      <around*|(|\<alpha\>|)>|)>*<around*|(|-<frac|<math-up|bb><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>-<frac|<math-up|aa><rsup|2>|<math-up|cc><rsup|2>+<math-up|bb><rsup|2>+<math-up|aa><rsup|2>>|)>+1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>56) >
    <|unfolded-io>
      getAxis(Rsym)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o56>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>|<row|<cell|<frac|<math-up|bb>|<math-up|aa>*<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>|<row|<cell|<frac|<math-up|cc>|<math-up|aa>*<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>>>>,<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>,<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>|<row|<cell|<frac|<math-up|bb>|<math-up|aa>*<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>|<row|<cell|<frac|<math-up|cc>|<math-up|aa>*<sqrt|<frac|<math-up|cc><rsup|2>|<math-up|aa><rsup|2>>+<frac|<math-up|bb><rsup|2>|<math-up|aa><rsup|2>>+1>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>57) >
    <|unfolded-io>
      getAngle(Rsym)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o57>)
      >>arctan <around*|(|<frac|<math-up|aa>*tan
      <around*|(|\<alpha\>|)>|<around*|\||<math-up|aa>|\|>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>58) >
    <|unfolded-io>
      subst(aa=1,simp(getAngle(Rsym)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o58>)
      >>\<alpha\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>59) >
    <|unfolded-io>
      subst(aa=-1,simp(getAngle(Rsym)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o59>)
      >>-\<alpha\>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Procedura 18)> Data una matrice di rotazione
      calcolare contemporaneamente asse ed angolo
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>60) >
    <|input>
      getRotData(R):=block(

      [angle, axes],

      \ \ \ \ \ \ \ \ axes:getAxis(R),

      \ \ \ \ \ \ \ \ angle:getAngle(R),

      \ \ \ \ \ \ \ \ return([axes[3],angle])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>61) >
    <|unfolded-io>
      R
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o61>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>+<frac|200|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>|321>+<frac|121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+1.5|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|\<pi\>|3>+1.5|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>62) >
    <|unfolded-io>
      data:getRotData(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o62>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>+<frac|3|2>|]>>>
    </unfolded-io>

    <\textput>
      Verifichiamo il risultato
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>63) >
    <|unfolded-io>
      rodData:trigreduce(rodrigues(data[1],data[2]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o63>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|)>|321>>|<cell|<frac|55*<around*|(|2<rsup|<frac|3|2>>-2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*<around*|(|2<rsup|<frac|3|2>>-2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>64) >
    <|unfolded-io>
      expand(rodData)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o64>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|321>+<frac|200|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>|321>-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|321>+<frac|121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|\<pi\>|3>+<frac|3|2>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>65) >
    <|unfolded-io>
      isRot(rodData)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o65>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Procedura 19)> Implementare la parametrizzazione
      di Cayley

      La parametrizzazione di Cayley permette di esprimere, attraverso la
      matrice <math|S> antisimmetrica, la corrispettiva matrice di rotazione
      <math|R> e viceversa. La parametrizzazione di Cayley avviene tramite le
      seguenti relazioni:

      <\equation*>
        <around*|(|1|)>S\<longrightarrow\>R=<around*|(|I+S|)>*<around*|(|I-S|)><rsup|-1>\<Longrightarrow\>R<space|1em>
        � \ di rotazione
      </equation*>

      <\equation*>
        <around*|(|2|)>R\<longrightarrow\>S=<around*|(|R+I|)><rsup|-1>*<around*|(|R-I|)>\<Longrightarrow\>S<space|1em>�
        una matrice antisimmetrica
      </equation*>

      In particolare, dato un asse di rotazione <math|v> occorre prima
      calcolare la matrice antisimmetrica S sul versore corrispondente
      moltiplicato per la relazione descritta da <math|<around*|(|!|)>> ed in
      seguito applicare la (1) per ottenere la corrispondente matrice di
      rotazione.\ 

      Alternativamente, data una matrice di rotazione <math|R> occorre
      applicare (2) per ottenere la matrice antisimmetrica corrispondente e,
      in seguito, selezionare all'interno della matrice <math|S> gli elementi
      dell'asse di rotazione <math|v>. Quest'ultimi corrispondono a:

      <\equation*>
        S=<matrix|<tformat|<table|<row|<cell|0<space|1em>-c<space|1em><with|color|red|b>>>|<row|<cell|<with|color|red|c><space|1em>0<space|1em>-a>>|<row|<cell|-b<space|1em><with|color|red|a><space|1em>0>>>>>\<longrightarrow\>v=<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>>>>
      </equation*>

      Ottenuto il vettore <math|v> � possibile calcolare il versore e
      l'angolo di rotazione. Infatti:

      <\equation*>
        v=<frac|v|<around*|\<\|\|\>|v|\<\|\|\>>>*<around*|\<\|\|\>|v|\<\|\|\>><space|1em>in
        cui<space|1em><frac|v|<around*|\<\|\|\>|v|\<\|\|\>>>\<assign\>versore
        di rotazione<space|1em><around*|\<\|\|\>|v|\<\|\|\>>\<assign\>angolo
        di rotazione
      </equation*>

      <strong|<em|N.B.: >><math|<around*|\<\|\|\>|v|\<\|\|\>>> � la norma-2
      del vettore <math|v>

      Per calcolare correttamente l'angolo di rotazione data la norma del
      vettore <math|v>, poniamo <math|v>=\<alpha\>. Quindi, sussistono le
      seguenti relazioni:

      <\eqnarray*>
        <tformat|<table|<row|<cell|<around*|(|!|)>>|<cell|\<alpha\>=<frac|sin<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>\<longrightarrow\>\<alpha\><rsup|2>=<frac|1-cos<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>>|<cell|>>|<row|<cell|<around*|(|i|)>>|<cell|cos<around*|(|\<theta\>|)>=<frac|1-\<alpha\><rsup|2>|1+\<alpha\><rsup|2>>\<equiv\><frac|1-<around*|\<\|\|\>|v|\<\|\|\>><rsup|2>|1+<around*|\<\|\|\>|v|\<\|\|\>><rsup|2>>>|<cell|>>>>
      </eqnarray*>

      <\math>
        Data la pluralit� delle soluzioni occorre calcolare anche il
        sin<around*|(|\<theta\>|)>:

        <\text>
          <\equation*>
            sin<around*|(|\<theta\>|)><rsup|2>=1-cos<around*|(|\<theta\>|)><rsup|2>
          </equation*>
        </text>
      </math>

      Sostituendo <math|<around*|(|i|)>>:

      <\equation*>
        sin<around*|(|\<theta\>|)>=\<pm\><frac|2*\<alpha\>|1+\<alpha\><rsup|2>>
      </equation*>

      In cui il segno di sin(\<theta\>) deve soddisfare la condizione in cui
      <math|<around*|\<\|\|\>|v|\<\|\|\>>>\<gtr\>0 cio�:
      <math|<frac|sin<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>\<gtr\>0>.

      Dopodich� l'angolo � univocamente identificato tramite la funzione
      atan2:

      <\equation*>
        <around*|(|ii|)>\<theta\>=atan2<around*|(|\<pm\><frac|2*\<alpha\>|1+\<alpha\><rsup|2>>,<frac|1-\<alpha\><rsup|2>|1+\<alpha\><rsup|2>>|)>=atan2<around*|(|sin<around*|(|\<theta\>|)>,cos<around*|(|\<theta\>|)>|)>
      </equation*>

      \;
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>66) >
    <|input>
      cayley(ax,angle):=block(

      \ \ \ \ [cay,I,dim,s,norm, vers, theta],

      \ \ \ \ \ /*Normalizzo il vettore e ottengo norma e versore*/

      \ \ \ \ \ [norm, vers]: normalize(ax),

      \ \ \ \ \ /* Calcolo antisimmetrica con l'angolo corretto*/ \ 

      \ \ \ \ s:S(vers*sin(angle)/(cos(angle)+1)),

      \ \ \ \ I:identfor(s),\ 

      \ \ \ \ cay:expand(I+s).invert(expand(I-s)),

      return(scanmap(trigsimp,factor(cay)))

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>67) >
    <|input>
      cayleyS(S):=block([I],

      \ \ \ \ \ \ I:identfor(S),

      \ \ \ \ \ \ return(scanmap(trigsimp,factor(expand(I+S).invert(expand(I-S)))))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      v:matrix([sqrt(2)],[1.1],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><matrix|<tformat|<table|<row|<cell|<sqrt|2>>>|<row|<cell|1.1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      angle:%pi/3+1.5
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><frac|\<pi\>|3>+1.5>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      M:cayley(v,angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+200|321>>|<cell|-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-55*2<rsup|<frac|3|2>>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|55*2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-55*2<rsup|<frac|3|2>>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      isRot(M)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      factor(ratsimp(M))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+200|321>>|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-1|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-1|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      getRotData(ratsimp(M))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>+<frac|3|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      [norm,ax]:normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|<frac|<sqrt|321>|10>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      S:S(ax*sin(ratsimp(angle))/(cos(ratsimp(angle))+1))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+1|)>>>>|<row|<cell|0>|<cell|0>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+1|)>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+1|)>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+1|)>>>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      Cs:factor(cayleyS(S))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+200|321>>|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-1|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>-1|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>+121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>>>>>>>>
    </unfolded-io>

    <\textput>
      Inversa tramite getRotData di Rodriguez
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>76) >
    <|unfolded-io>
      getRotData(M)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o76>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>+<frac|3|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>77) >
    <|unfolded-io>
      v: matrix([1.1],[1],[q])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o77>)
      >><matrix|<tformat|<table|<row|<cell|1.1>>|<row|<cell|1>>|<row|<cell|q>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>78) >
    <|unfolded-io>
      angle:theta
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o78>)
      >>\<vartheta\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>79) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o79>)
      >><around*|[|<sqrt|q<rsup|2>+<frac|221|100>>,<matrix|<tformat|<table|<row|<cell|<frac|11|10*<sqrt|q<rsup|2>+<frac|221|100>>>>>|<row|<cell|<frac|1|<sqrt|q<rsup|2>+<frac|221|100>>>>>|<row|<cell|<frac|q|<sqrt|q<rsup|2>+<frac|221|100>>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>80) >
    <|unfolded-io>
      norm(matrix([(11/(10*sqrt(q^2+(221/100))))],
      [(1/(sqrt(q^2+(221/100))))], [(q/(sqrt(q^2+(221/100))))]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o80>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>81) >
    <|unfolded-io>
      M:cayley(v,angle)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o81>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|100*q<rsup|2>+100|)>*cos
      <around*|(|\<vartheta\>|)>+121|100*q<rsup|2>+221>>|<cell|-<frac|10*q*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>+110*cos <around*|(|\<vartheta\>|)>-110|100*q<rsup|2>+221>>|<cell|<frac|10*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>-110*q*cos
      <around*|(|\<vartheta\>|)>+110*q|100*q<rsup|2>+221>>>|<row|<cell|<frac|10*q*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>-110*cos <around*|(|\<vartheta\>|)>+110|100*q<rsup|2>+221>>|<cell|<frac|<around*|(|100*q<rsup|2>+121|)>*cos
      <around*|(|\<vartheta\>|)>+100|100*q<rsup|2>+221>>|<cell|-<frac|11*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>+100*q*cos
      <around*|(|\<vartheta\>|)>-100*q|100*q<rsup|2>+221>>>|<row|<cell|-<frac|10*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>+110*q*cos
      <around*|(|\<vartheta\>|)>-110*q|100*q<rsup|2>+221>>|<cell|<frac|11*<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>-100*q*cos
      <around*|(|\<vartheta\>|)>+100*q|100*q<rsup|2>+221>>|<cell|<frac|221*cos
      <around*|(|\<vartheta\>|)>+100*q<rsup|2>|100*q<rsup|2>+221>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>82) >
    <|unfolded-io>
      isRot(M)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o82>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>83) >
    <|unfolded-io>
      getRotData(M)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o83>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>|<row|<cell|<frac|10|11*<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>|<row|<cell|<frac|10*q|11*<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>>>>,\<vartheta\>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|input>
      invCayley(R):=block([Rc,I,S,v,nm,cosTheta,sinTheta,theta,cond],

      \ \ \ Rc:matrix_input(R),

      \ \ \ if isRot(Rc) then(

      \ \ \ \ \ I:ident(3),

      \ \ \ \ \ /*Applico Calyley Inverso*/

      \ \ \ \ \ S:matrix_input(invert(Rc+I).(Rc-I)),

      \ \ \ \ \ v:getAsimVect(S),

      \ \ \ \ \ nm:factor(norm(v)^2),

      \ \ \ \ \ cosTheta:trigsimp(trigexpand(expand((1-nm)/(1+nm)))),

      \ \ \ \ \ sinTheta:trigsimp(trigexpand(expand((2*sqrt(nm))/(1+nm)))),

      \ \ \ \ \ theta:atan2mod(sinTheta,cosTheta),

      \ \ \ \ \ return([scanmap(trigsimp,v/nm),trigsimp(trigexpand(theta))])

      \ \ \ )

      \ \ \ else(error("La matrice non � di rotazione"))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>85) >
    <|unfolded-io>
      [ax,angle]:invCayley(M)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o85>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|11*cos
      <around*|(|\<vartheta\>|)>+11|<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>>>>|<row|<cell|<frac|10*cos
      <around*|(|\<vartheta\>|)>+10|<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>>>>|<row|<cell|<frac|10*q*cos
      <around*|(|\<vartheta\>|)>+10*q|<sqrt|100*q<rsup|2>+221>*sin
      <around*|(|\<vartheta\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|\<vartheta\>|)>|\|>|cos
      <around*|(|\<vartheta\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>86) >
    <|unfolded-io>
      factor(ax/ax[1,1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o86>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<frac|10|11>>>|<row|<cell|<frac|10*q|11>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>87) >
    <|unfolded-io>
      getRotData(M)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o87>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>|<row|<cell|<frac|10|11*<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>|<row|<cell|<frac|10*q|11*<sqrt|<frac|100*q<rsup|2>|121>+<frac|221|121>>>>>>>>,\<vartheta\>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>88) >
    <|unfolded-io>
      v
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o88>)
      >><matrix|<tformat|<table|<row|<cell|1.1>>|<row|<cell|1>>|<row|<cell|q>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>89) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o89>)
      >><around*|[|<sqrt|q<rsup|2>+<frac|221|100>>,<matrix|<tformat|<table|<row|<cell|<frac|11|10*<sqrt|q<rsup|2>+<frac|221|100>>>>>|<row|<cell|<frac|1|<sqrt|q<rsup|2>+<frac|221|100>>>>>|<row|<cell|<frac|q|<sqrt|q<rsup|2>+<frac|221|100>>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>90) >
    <|unfolded-io>
      v:matrix([1],[1],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o90>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>91) >
    <|unfolded-io>
      theta:9
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o91>)
      >>9>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>92) >
    <|unfolded-io>
      Rc:cayley(v,theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o92>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|9|)>+1|2>>|<cell|-<frac|cos
      <around*|(|9|)>-1|2>>|<cell|<frac|sin
      <around*|(|9|)>|<sqrt|2>>>>|<row|<cell|-<frac|cos
      <around*|(|9|)>-1|2>>|<cell|<frac|cos
      <around*|(|9|)>+1|2>>|<cell|-<frac|sin
      <around*|(|9|)>|<sqrt|2>>>>|<row|<cell|-<frac|sin
      <around*|(|9|)>|<sqrt|2>>>|<cell|<frac|sin
      <around*|(|9|)>|<sqrt|2>>>|<cell|cos <around*|(|9|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>93) >
    <|unfolded-io>
      [ax,a]:trigsimp(invCayley(Rc))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o93>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|<sqrt|2>*cos
      <around*|(|9|)>+<sqrt|2>|2*sin <around*|(|9|)>>>>|<row|<cell|<frac|<sqrt|2>*cos
      <around*|(|9|)>+<sqrt|2>|2*sin <around*|(|9|)>>>>|<row|<cell|0>>>>>,9|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>94) >
    <|unfolded-io>
      ax/ax[1,1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o94>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>95) >
    <|unfolded-io>
      getRotData(Rc)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o95>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,9|]>>>
    </unfolded-io>

    <\textput>
      I due algoritmo a contronto
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>96) >
    <|unfolded-io>
      v:matrix([b[x]],[b[y]],[b[z]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o96>)
      >><matrix|<tformat|<table|<row|<cell|b<rsub|x>>>|<row|<cell|b<rsub|y>>>|<row|<cell|b<rsub|z>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>97) >
    <|unfolded-io>
      angle:gamma
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o97>)
      >>\<gamma\>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>98) >
    <|input>
      Rlaplace:expLaplace(S(v),angle)
    </input>

    <\unfolded-io>
      <math|<with|math-display|true|<text|Is
      >b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2><text|positive or
      zero? >>>

      \;
    <|unfolded-io>
      positive
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o98>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|-<frac|b<rsub|z>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|y>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|b<rsub|y>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>|<row|<cell|<frac|b<rsub|z>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|y>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|<around*|(|b<rsub|z><rsup|2>+b<rsub|x><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|-<frac|b<rsub|x>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|y>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>|<row|<cell|-<frac|b<rsub|y>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|b<rsub|x>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|y>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|<around*|(|b<rsub|y><rsup|2>+b<rsub|x><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|z><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>99) >
    <|unfolded-io>
      getRotData(Rlaplace)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o99>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>|<row|<cell|<frac|b<rsub|y>|b<rsub|x>*<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>|<row|<cell|<frac|b<rsub|z>|b<rsub|x>*<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>>>>,arctan
      <around*|(|<frac|b<rsub|x>*tan <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>|<around*|\||b<rsub|x>|\|>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>100) >
    <|unfolded-io>
      invCayley(Rlaplace)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o100>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|b<rsub|x>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>|<row|<cell|<frac|b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>|<row|<cell|<frac|b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|z>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>|\|>|cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>101) >
    <|unfolded-io>
      Rjordan:trigrat(expVect(S(v),gamma))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o101>)
      >><matrix|<tformat|<table|<row|<cell|<frac|<around*|(|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|-<frac|b<rsub|z>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|y>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|b<rsub|y>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>|<row|<cell|<frac|b<rsub|z>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|y>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|<around*|(|b<rsub|z><rsup|2>+b<rsub|x><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|-<frac|b<rsub|x>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|y>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>|<row|<cell|-<frac|b<rsub|y>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|x>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|b<rsub|x>*<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>-b<rsub|y>*b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>*b<rsub|z>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>|<cell|<frac|<around*|(|b<rsub|y><rsup|2>+b<rsub|x><rsup|2>|)>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|z><rsup|2>|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>102) >
    <|unfolded-io>
      getRotData(Rjordan)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o102>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>|<row|<cell|<frac|b<rsub|y>|b<rsub|x>*<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>|<row|<cell|<frac|b<rsub|z>|b<rsub|x>*<sqrt|<frac|b<rsub|z><rsup|2>|b<rsub|x><rsup|2>>+<frac|b<rsub|y><rsup|2>|b<rsub|x><rsup|2>>+1>>>>>>>,arctan
      <around*|(|<frac|b<rsub|x>*tan <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>|<around*|\||b<rsub|x>|\|>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>103) >
    <|unfolded-io>
      invCayley(Rjordan)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o103>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|b<rsub|x>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|x>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>|<row|<cell|<frac|b<rsub|y>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|y>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>|<row|<cell|<frac|b<rsub|z>*cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>+b<rsub|z>|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*sin
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>|\|>|cos
      <around*|(|<sqrt|b<rsub|z><rsup|2>+b<rsub|y><rsup|2>+b<rsub|x><rsup|2>>*\<gamma\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>104) >
    <|unfolded-io>
      v:matrix([2],[0],[0.23])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o104>)
      >><matrix|<tformat|<table|<row|<cell|2>>|<row|<cell|0>>|<row|<cell|0.23>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>105) >
    <|unfolded-io>
      theta:1
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o105>)
      >>1>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>106) >
    <|unfolded-io>
      Rr: rodrigues(v,theta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o106>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|529*<around*|(|1-cos
      <around*|(|1|)>|)>|40529>>|<cell|-<frac|23*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|<frac|4600*<around*|(|1-cos
      <around*|(|1|)>|)>|40529>>>|<row|<cell|<frac|23*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|cos
      <around*|(|1|)>>|<cell|-<frac|200*sin
      <around*|(|1|)>|<sqrt|40529>>>>|<row|<cell|<frac|4600*<around*|(|1-cos
      <around*|(|1|)>|)>|40529>>|<cell|<frac|200*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|1-<frac|40000*<around*|(|1-cos
      <around*|(|1|)>|)>|40529>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>107) >
    <|unfolded-io>
      getRotData(Rr)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o107>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|200|<sqrt|40529>>>>|<row|<cell|0>>|<row|<cell|<frac|23|<sqrt|40529>>>>>>>,1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>108) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o108>)
      >><around*|[|<frac|<sqrt|40529>|100>,<matrix|<tformat|<table|<row|<cell|<frac|200|<sqrt|40529>>>>|<row|<cell|0>>|<row|<cell|<frac|23|<sqrt|40529>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>109) >
    <|unfolded-io>
      Rc:cayley(v,theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o109>)
      >><matrix|<tformat|<table|<row|<cell|<frac|529*cos
      <around*|(|1|)>+40000|40529>>|<cell|-<frac|23*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|-<frac|4600*cos
      <around*|(|1|)>-4600|40529>>>|<row|<cell|<frac|23*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|cos
      <around*|(|1|)>>|<cell|-<frac|200*sin
      <around*|(|1|)>|<sqrt|40529>>>>|<row|<cell|-<frac|4600*cos
      <around*|(|1|)>-4600|40529>>|<cell|<frac|200*sin
      <around*|(|1|)>|<sqrt|40529>>>|<cell|<frac|40000*cos
      <around*|(|1|)>+529|40529>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>110) >
    <|unfolded-io>
      invCayley(Rc)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o110>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|200*<sqrt|40529>*cos
      <around*|(|1|)>+200*<sqrt|40529>|40529*sin
      <around*|(|1|)>>>>|<row|<cell|0>>|<row|<cell|<frac|23*<sqrt|40529>*cos
      <around*|(|1|)>+23*<sqrt|40529>|40529*sin <around*|(|1|)>>>>>>>,1|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>111) >
    <|unfolded-io>
      v:matrix([1],[0],[pp])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o111>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|0>>|<row|<cell|<math-up|pp>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>112) >
    <|unfolded-io>
      float(mod(9-2*%pi,2*%pi))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o112>)
      >>2.716814692820414>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>113) >
    <|unfolded-io>
      float(radians(9))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o113>)
      >><math-up|radians><around*|(|9.0|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>114) >
    <|unfolded-io>
      theta:%pi/7
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o114>)
      >><frac|\<pi\>|7>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>115) >
    <|unfolded-io>
      Rr:rodrigues(v,theta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o115>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|<around*|(|1-cos
      <around*|(|<frac|\<pi\>|7>|)>|)>*<math-up|pp><rsup|2>|<math-up|pp><rsup|2>+1>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|<frac|<around*|(|1-cos
      <around*|(|<frac|\<pi\>|7>|)>|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>>|<row|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|<around*|(|1-cos
      <around*|(|<frac|\<pi\>|7>|)>|)>*<around*|(|-<frac|<math-up|pp><rsup|2>|<math-up|pp><rsup|2>+1>-<frac|1|<math-up|pp><rsup|2>+1>|)>+1>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|<frac|<around*|(|1-cos
      <around*|(|<frac|\<pi\>|7>|)>|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|1-<frac|1-cos
      <around*|(|<frac|\<pi\>|7>|)>|<math-up|pp><rsup|2>+1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>116) >
    <|unfolded-io>
      getRotData(Rr)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o116>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|0>>|<row|<cell|<frac|<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>117) >
    <|unfolded-io>
      invCayley(Rr)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o117>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>|<row|<cell|0>>|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<math-up|pp>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>118) >
    <|unfolded-io>
      Rc:cayley(v,theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o118>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+1|<math-up|pp><rsup|2>+1>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|-<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>-1|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>>|<row|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|cos
      <around*|(|<frac|\<pi\>|7>|)>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|-<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>-1|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|<frac|<math-up|pp><rsup|2>+cos
      <around*|(|<frac|\<pi\>|7>|)>|<math-up|pp><rsup|2>+1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>119) >
    <|unfolded-io>
      invCayley(Rc)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o119>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>|<row|<cell|0>>|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<math-up|pp>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>120) >
    <|unfolded-io>
      getRotData(Rc)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o120>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|0>>|<row|<cell|<frac|<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>121) >
    <|unfolded-io>
      [norm,ax]:normalize(v)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o121>)
      >><around*|[|<sqrt|<math-up|pp><rsup|2>+1>,<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|0>>|<row|<cell|<frac|<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>122) >
    <|unfolded-io>
      Rlaplace:rotExp(S(ax),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o122>)
      >><matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+1|<math-up|pp><rsup|2>+1>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|-<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>-1|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>>|<row|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|cos
      <around*|(|<frac|\<pi\>|7>|)>>|<cell|-<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|-<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>-1|)>*<math-up|pp>|<math-up|pp><rsup|2>+1>>|<cell|<frac|sin
      <around*|(|<frac|\<pi\>|7>|)>|<sqrt|<math-up|pp><rsup|2>+1>>>|<cell|<frac|<math-up|pp><rsup|2>+cos
      <around*|(|<frac|\<pi\>|7>|)>|<math-up|pp><rsup|2>+1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>123) >
    <|unfolded-io>
      getRotData(Rlaplace)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o123>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|<math-up|pp><rsup|2>+1>>>>|<row|<cell|0>>|<row|<cell|<frac|<math-up|pp>|<sqrt|<math-up|pp><rsup|2>+1>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>124) >
    <|unfolded-io>
      invCayley(Rlaplace)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o124>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>|<row|<cell|0>>|<row|<cell|<frac|<around*|(|cos
      <around*|(|<frac|\<pi\>|7>|)>+1|)>*<math-up|pp>*<sqrt|<math-up|pp><rsup|2>+1>|sin
      <around*|(|<frac|\<pi\>|7>|)>*<math-up|pp><rsup|2>+sin
      <around*|(|<frac|\<pi\>|7>|)>>>>>>>,<frac|\<pi\>|7>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>125) >
    <|unfolded-io>
      Rjordan:expVect(S(ax),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o125>)
      >><matrix|<tformat|<table|<row|<cell|-<frac|<around*|(|\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>-1|)>*<math-up|pp><rsup|2>-2|2*<math-up|pp><rsup|2>+2>>|<cell|<frac|<around*|(|\<mathi\>*\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathi\>*\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+2*\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>|7>>-\<mathi\>|)>*<math-up|pp>*<sqrt|<math-up|pp><rsup|2>+1>|2*<math-up|pp><rsup|2>+2>>|<cell|<frac|<around*|(|\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+1|)>*<math-up|pp>|2*<math-up|pp><rsup|2>+2>>>|<row|<cell|-<frac|<around*|(|\<mathi\>*\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathi\>*\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+2*\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>|7>>-\<mathi\>|)>*<math-up|pp>*<sqrt|<math-up|pp><rsup|2>+1>|2*<math-up|pp><rsup|2>+2>>|<cell|-<frac|\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>-1|2>>|<cell|<frac|<around*|(|\<mathi\>*\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathi\>*\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+2*\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>|7>>-\<mathi\>|)>*<sqrt|<math-up|pp><rsup|2>+1>|2*<math-up|pp><rsup|2>+2>>>|<row|<cell|<frac|<around*|(|\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+1|)>*<math-up|pp>|2*<math-up|pp><rsup|2>+2>>|<cell|-<frac|<around*|(|\<mathi\>*\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>+\<mathi\>*\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>-\<mathi\>*\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+2*\<mathi\>*\<mathe\><rsup|<frac|\<mathi\>*\<pi\>|7>>-\<mathi\>|)>*<sqrt|<math-up|pp><rsup|2>+1>|2*<math-up|pp><rsup|2>+2>>|<cell|<frac|2*<math-up|pp><rsup|2>-\<mathe\><rsup|<frac|5*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|4*\<mathi\>*\<pi\>|7>>-\<mathe\><rsup|<frac|3*\<mathi\>*\<pi\>|7>>+\<mathe\><rsup|<frac|2*\<mathi\>*\<pi\>|7>>+1|2*<math-up|pp><rsup|2>+2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>126) >
    <|unfolded-io>
      v:matrix([1.4],[1.1],[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o126>)
      >><matrix|<tformat|<table|<row|<cell|1.4>>|<row|<cell|1.1>>|<row|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>127) >
    <|unfolded-io>
      angle:sqrt(2)*alpha
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o127>)
      >><sqrt|2>*\<alpha\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>128) >
    <|unfolded-io>
      Rr:rodrigues(v,angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o128>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|221*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>|<cell|<frac|154*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>-<frac|10*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>>|<cell|<frac|11*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>+<frac|140*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>>|<row|<cell|<frac|10*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>+<frac|154*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>|<cell|1-<frac|296*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>|<cell|<frac|110*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>-<frac|14*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>>>|<row|<cell|<frac|140*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>-<frac|11*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>>|<cell|<frac|14*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>|<sqrt|417>>+<frac|110*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>|<cell|1-<frac|317*<around*|(|1-cos
      <around*|(|<sqrt|2>*\<alpha\>|)>|)>|417>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>129) >
    <|unfolded-io>
      getRotData(Rr)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o129>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14|<sqrt|417>>>>|<row|<cell|<frac|11|<sqrt|417>>>>|<row|<cell|<frac|10|<sqrt|417>>>>>>>,<sqrt|2>*\<alpha\>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>130) >
    <|unfolded-io>
      invCayley(Rr)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o130>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+14*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|11*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+11*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|10*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+10*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|<sqrt|2>*\<alpha\>|)>|\|>|cos
      <around*|(|<sqrt|2>*\<alpha\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>131) >
    <|unfolded-io>
      Rc:cayley(v,angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o131>)
      >><matrix|<tformat|<table|<row|<cell|<frac|221*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+196|417>>|<cell|-<frac|10*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+154*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-154|417>>|<cell|<frac|11*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-140*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+140|417>>>|<row|<cell|<frac|10*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-154*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+154|417>>|<cell|<frac|296*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+121|417>>|<cell|-<frac|14*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+110*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-110|417>>>|<row|<cell|-<frac|11*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+140*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-140|417>>|<cell|<frac|14*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-110*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+110|417>>|<cell|<frac|317*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+100|417>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>132) >
    <|unfolded-io>
      getRotData(Rc)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o132>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14|<sqrt|417>>>>|<row|<cell|<frac|11|<sqrt|417>>>>|<row|<cell|<frac|10|<sqrt|417>>>>>>>,<sqrt|2>*\<alpha\>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>133) >
    <|unfolded-io>
      invCayley(Rc)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o133>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+14*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|11*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+11*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|10*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+10*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|<sqrt|2>*\<alpha\>|)>|\|>|cos
      <around*|(|<sqrt|2>*\<alpha\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>134) >
    <|unfolded-io>
      [norm,ax]:normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o134>)
      >><around*|[|<frac|<sqrt|417>|10>,<matrix|<tformat|<table|<row|<cell|<frac|14|<sqrt|417>>>>|<row|<cell|<frac|11|<sqrt|417>>>>|<row|<cell|<frac|10|<sqrt|417>>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>135) >
    <|unfolded-io>
      Rlaplace:rotExp(S(ax),angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o135>)
      >><matrix|<tformat|<table|<row|<cell|<frac|221*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+196|417>>|<cell|-<frac|10*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+154*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-154|417>>|<cell|<frac|11*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-140*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+140|417>>>|<row|<cell|<frac|10*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-154*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+154|417>>|<cell|<frac|296*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+121|417>>|<cell|-<frac|14*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+110*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-110|417>>>|<row|<cell|-<frac|11*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>+140*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>-140|417>>|<cell|<frac|14*<sqrt|417>*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>-110*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+110|417>>|<cell|<frac|317*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+100|417>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>136) >
    <|unfolded-io>
      getRotData(Rlaplace)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o136>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14|<sqrt|417>>>>|<row|<cell|<frac|11|<sqrt|417>>>>|<row|<cell|<frac|10|<sqrt|417>>>>>>>,<sqrt|2>*\<alpha\>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>137) >
    <|unfolded-io>
      invCayley(Rlaplace)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o137>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|14*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+14*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|11*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+11*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>|<row|<cell|<frac|10*<sqrt|417>*cos
      <around*|(|<sqrt|2>*\<alpha\>|)>+10*<sqrt|417>|417*sin
      <around*|(|<sqrt|2>*\<alpha\>|)>>>>>>>,arctan
      <around*|(|<frac|<around*|\||sin <around*|(|<sqrt|2>*\<alpha\>|)>|\|>|cos
      <around*|(|<sqrt|2>*\<alpha\>|)>>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>138) >
    <|unfolded-io>
      Rt:expLaplace(S(matrix([0],[0],[1])),ratsimp(%pi/3+1.5))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o138>)
      >><matrix|<tformat|<table|<row|<cell|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>>|<cell|-sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>>|<cell|0>>|<row|<cell|sin
      <around*|(|<frac|2*\<pi\>+9|6>|)>>|<cell|cos
      <around*|(|<frac|2*\<pi\>+9|6>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>139) >
    <|unfolded-io>
      isRot(Rt)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o139>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>140) >
    <|unfolded-io>
      getRotData(Rt)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o140>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|1>>>>>,<frac|\<pi\>|3>+<frac|3|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>141) >
    <|unfolded-io>
      v:matrix([1],[1],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o141>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>142) >
    <|unfolded-io>
      angle:%pi/3
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o142>)
      >><frac|\<pi\>|3>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>143) >
    <|unfolded-io>
      [norm,ax]:normalize(v)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o143>)
      >><around*|[|<sqrt|2>,<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>144) >
    <|unfolded-io>
      b:expVect(S(ax),angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o144>)
      >><matrix|<tformat|<table|<row|<cell|<frac|3|4>>|<cell|<frac|1|4>>|<cell|<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>>|<row|<cell|<frac|1|4>>|<cell|<frac|3|4>>|<cell|-<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>>|<row|<cell|-<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>|<cell|<frac|<sqrt|3>|2<rsup|<frac|3|2>>>>|<cell|<frac|1|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>145) >
    <|unfolded-io>
      getRotData(b)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o145>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,<frac|\<pi\>|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>146) >
    <|unfolded-io>
      b:expVect(S(v),angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o146>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>+2*\<mathe\><rsup|<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>+1|)>|4>>|<cell|-<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-2*\<mathe\><rsup|<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>+1|)>|4>>|<cell|-<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|<sqrt|2>*\<mathi\>*\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-<sqrt|2>*\<mathi\>|)>|4>>>|<row|<cell|-<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-2*\<mathe\><rsup|<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>+1|)>|4>>|<cell|<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>+2*\<mathe\><rsup|<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>+1|)>|4>>|<cell|<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|<sqrt|2>*\<mathi\>*\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-<sqrt|2>*\<mathi\>|)>|4>>>|<row|<cell|<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|<sqrt|2>*\<mathi\>*\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-<sqrt|2>*\<mathi\>|)>|4>>|<cell|-<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|<sqrt|2>*\<mathi\>*\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>-<sqrt|2>*\<mathi\>|)>|4>>|<cell|<frac|\<mathe\><rsup|-<frac|<sqrt|2>*\<mathi\>*\<pi\>|3>>*<around*|(|\<mathe\><rsup|<frac|2<rsup|<frac|3|2>>*\<mathi\>*\<pi\>|3>>+1|)>|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>147) >
    <|unfolded-io>
      getRotData(trigrat(b))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o147>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,<frac|<sqrt|2>*\<pi\>|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>148) >
    <|unfolded-io>
      invCayley(trigrat(b))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o148>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>+1|<sqrt|2>*sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>>>>|<row|<cell|<frac|cos
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>+1|<sqrt|2>*sin
      <around*|(|<frac|<sqrt|2>*\<pi\>|3>|)>>>>|<row|<cell|0>>>>>,<frac|<sqrt|2>*\<pi\>|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>149) >
    <|unfolded-io>
      v:matrix([1],[1],[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o149>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|1>>|<row|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>150) >
    <|unfolded-io>
      angle:10*%pi/3
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o150>)
      >><frac|10*\<pi\>|3>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>153) >
    <|unfolded-io>
      Rc:cayley(v,angle)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o153>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|1>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>154) >
    <|unfolded-io>
      invCayley(Rc)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o154>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|1|3>>>|<row|<cell|-<frac|1|3>>>|<row|<cell|-<frac|1|3>>>>>>,<frac|2*\<pi\>|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      getRotData(trigrat(expVect(S(normalize(matrix([1],[1],[0]))[2]),theta)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|0>>>>>,\<vartheta\>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|input>
      \;
    </input>
  </session>

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
    <associate|page-orientation|landscape>
  </collection>
</initial>