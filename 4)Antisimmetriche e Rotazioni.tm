<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <doc-data|<doc-title|--Procedure\U>|<\doc-subtitle>
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

      if not(nonscalarp(v)) or length(v) \<less\> 3 or listp(v) then

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

      if sz[1]#sz[2] then error("Inserire una matrice quadrata"), \ \ \ \ 

      st: transpose(S),

      if st = -S then return(true)

      else return(false) \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      isAsim(S)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-bf|true>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      S:S(matrix([0.14564],[sqrt(%pi)*theta[i]],[rho*1/431]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|\<rho\>|431>>|<cell|<sqrt|\<pi\>>*\<vartheta\><rsub|i>>>|<row|<cell|<frac|\<rho\>|431>>|<cell|0>|<cell|-0.14564>>|<row|<cell|-<sqrt|\<pi\>>*\<vartheta\><rsub|i>>|<cell|0.14564>|<cell|0>>>>>>>
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

      /*Verifico che la matrice è antisimmetrica*/

      if isAsim(S) then(

      /*Mappo le componenti della matrice antisimmetrica nel vettore*/

      \ \ v[1,1]:S[3,2],

      \ \ v[2,1]:S[1,3],

      \ \ v[3,1]:S[2,1],

      \ \ return(v)

      ) else (

      \ \ error("La matrice non è antisimmetrica")

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      getAsimVect(S)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><matrix|<tformat|<table|<row|<cell|0.14564>>|<row|<cell|<sqrt|\<pi\>>*\<vartheta\><rsub|i>>>|<row|<cell|<frac|\<rho\>|431>>>>>>>>
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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
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
      primo membro del risultato per come è stata definita.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      prod2:vect_prod(vv,ww)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >>e<rsub|x>*v<rsub|y>*w<rsub|z>-v<rsub|x>*e<rsub|y>*w<rsub|z>-e<rsub|x>*w<rsub|y>*v<rsub|z>+w<rsub|x>*e<rsub|y>*v<rsub|z>+v<rsub|x>*w<rsub|y>*e<rsub|z>-w<rsub|x>*v<rsub|y>*e<rsub|z>>>
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
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
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

      \ \ \ \ \ sIImA:invert(s*II-A), \ \ \ \ 

      \ \ \ \ \ iltA:zerofor(A),

      \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ for j:1 thru sz[2] do(

      \ \ \ \ \ \ \ \ \ iltA[i,j]:ilt(sIImA[i,j],s,t)

      \ \ \ \ \ \ \ )

      \ \ \ \ \ ),

      \ \ \ \ \ return(mySimp(iltA))

      )$
    </input>

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

      Dove <math|\<mathe\><rsup|J<rsub|A>t>> è l'esponenziale di matrice
      della forma di jordan <math|J<rsub|A>> della matrice <math|A>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      expVect(A,t):=block(

      [sz, V, eigVec, Vi, D, expD, res, theta],

      \ \ \ \ \ \ sz:size(A),

      \ \ \ \ \ \ if(sz[1]#sz[2]) then error("Matrix not Square"),

      /*Definiamo una matrice vuota pronta a contenere vettori colonna di
      dimensione 3*/

      \ \ \ \ \ \ V:zeromatrix(sz[1],0),

      \ \ \ \ \ \ eigVec:myEigens(A)[2],

      \ \ \ \ \ \ /*Controlliamo la presenza di eventuali blocchi di Jordan e
      andiamo \ \ \ \ \ \ \ \ \ in recovery usando expLaplace*/

      \ \ \ \ \ \ if(length(eigVec)#3) then return(expLaplace(A,t)),

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ \ V:addcol(V, eigVec[i])

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ Vi:invert(V),\ 

      \ \ \ \ \ \ D:Vi.A.V,

      \ \ \ \ \ \ expD:D,

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ expD[i,i]:exp(expD[i,i]*t)

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ res:V.expD.Vi,

      \ \ \ \ \ \ return(mySimp(res))

      )$
    </input>

    <\textput>
      Definiamo una matrice <math|A> e verifichiamo il risultato delle due
      procedure.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      A:matrix([1,1,0],[0,2,2],[0,0,3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|2>>|<row|<cell|0>|<cell|0>|<cell|3>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      length(myEigens(A)[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>3>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      expLaplace(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)><rsup|2>*\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      expVect(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)><rsup|2>*\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      a:matrix([0,1,0],[1,0,0],[0,0,-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      expand(expVect(a,t))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      expLaplace(a,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|t>-1|)>*<around*|(|\<mathe\><rsup|t>+1|)>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|t>-1|)>*<around*|(|\<mathe\><rsup|t>+1|)>|2>>|<cell|<frac|\<mathe\><rsup|-t>*<around*|(|\<mathe\><rsup|2*t>+1|)>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|14)Procedura:> verificare che le matrici di
      rotazione sono parametrizzate da esponenziali di matrici
      antisimmetriche. Ovvero

      <\equation*>
        R<rsub|v><around*|(|\<vartheta\>|)>=\<mathe\><rsup|S<rsub|><around*|(|v|)>\<vartheta\>>
      </equation*>

      Dobbiamo eseguire i seguenti passi:

      1) Calcolo della matrice <math|S<around*|(|k|)> con k
      \<in\><around*|{|e<rsub|x>,e<rsub|y>,e<rsub|z>|}> con
      e<rsub|x>,e<rsub|y>,e<rsub|z> versori dei rispettivi assi x,y,z>:

      <space|9em><math|S<around*|(|e<rsub|x>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0-1>>|<row|<cell|0<space|1em>1<space|1em>0>>>>>;S<around*|(|e<rsub|y>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>1>>|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|-1<space|1em>0<space|1em>0>>>>>;S<around*|(|e<rsub|z>|)>=<matrix|<tformat|<table|<row|<cell|0-1<space|1em>0>>|<row|<cell|1<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0<space|1em>0>>>>>.>

      2)Calcolo della matrice <math|s*I-S<around*|(|k|)>> di Laplace con s
      variabile di Laplace e I matrice identità
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
      <with|color|red|(<with|math-font-family|rm|%i>24) >
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
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      v:matrix([1],[sqrt(2)],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<sqrt|2>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      S:S(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<sqrt|2>>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|-<sqrt|2>>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      R:mySimp(demoivre(rotExp(S,t)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*cos
      <around*|(|<sqrt|3>*t|)>+1|3>>|<cell|-<frac|<sqrt|2>*<around*|(|cos
      <around*|(|<sqrt|3>*t|)>-1|)>|3>>|<cell|<frac|<sqrt|2>*sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*<around*|(|cos
      <around*|(|<sqrt|3>*t|)>-1|)>|3>>|<cell|<frac|cos
      <around*|(|<sqrt|3>*t|)>+2|3>>|<cell|-<frac|sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>|<cell|<frac|sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>|<cell|cos
      <around*|(|<sqrt|3>*t|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
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

      Dove <math|<wide|u|\<vect\>>> è un versore.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|input>
      normalize(v):=block(

      [norm:0, u, i, sz, vv],

      sz:size(v),

      /*Mi assicuro che v sia un vettore colonna*/

      if nonscalarp(v) and sz[2] = 1 \ then(

      \ \ vv:ratsimp(v),\ 

      \ \ norm:sqrt(transpose(vv).vv),

      \ \ u:ratsimp(vv/norm)

      ),

      return([norm,u])\ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      v:matrix([sqrt(2)],[1.1],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><matrix|<tformat|<table|<row|<cell|<sqrt|2>>>|<row|<cell|1.1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      Verifico il risultato espresso in [norma, versore]
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|<frac|<sqrt|321>|10>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|input>
      rodrigues(v,theta):=block(

      [S,II,S2,rodr,norm,u,theta1],

      /*normaliziamo il vettore*/

      [norm,u]:ratsimp(normalize(v)),

      /*calcoliamo l'antisimmetrica sul versore*/

      \ S:S(u),

      \ II:ident(size(v)[1]),

      \ S2:expand(trigreduce(expand(S.S))),

      \ /*implementiamo la formula di rodrigues, moltiplicando l'angolo per
      la norma di v*/

      \ theta1: ratsimp(theta),

      \ rodr:II+S2*(1-cos(norm*theta1))+S*sin(norm*theta1),

      \ return((rodr))

      )$
    </input>

    <\textput>
      Verifichiamo:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      R:rodrigues(v,%pi/3+1.5)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>>>>>>>>
    </unfolded-io>

    <\textput>
      Controlliamo che è davvero una matrice di rotazione:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      Verifichiamo una rotazione generica attorno all'asse <math|x>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      rx: rodrigues(matrix([1],[0],[0]),theta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos <around*|(|\<vartheta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      isRot(rx)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
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

      e trovare i coefficienti <math|a,b,c> di <math|v> affinché il prodotto
      <math|<around*|(|I-R|)>*v=\<b-0\>> e
      <math|v\<neq\><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|0>>>>>>.\ 

      Il vettore <math|v> normalizzato risultante è l'asse di rotazione.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|input>
      getAxis(R):=block(

      [II, v, i, u, norm,c],algebraic:true,

      \ \ /*Verifichiamo che la matrice data è di rotazione*/

      \ \ if (isRot(R) = false) then (

      \ \ \ \ error("La matrice inserita non è di rotazione.")

      \ \ ) else (

      \ \ \ \ /*Calcolo autovalori e autovettori*/

      \ \ \ \ eigs:myEigens(R),

      \ \ \ \ for i:1 thru length(eigs[1]) do(

      /*Cerco l'autovettore relativo all'autovalore 1. Unico per ipotesi.*/

      \ \ \ \ \ \ if eigs[1][i] = 1 then( /*scorro autovalori per trovare
      lambda=1*/

      \ \ \ \ \ \ \ \ \ v:simp(eigs[2][i]), \ \ \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ \ [norm, u] : ratsimp(normalize(v)),

      \ \ \ \ \ \ \ \ \ return([v, norm, u])

      \ \ \ \ \ \ )

      \ \ \ \ )

      \ \ ) \ \ \ \ \ \ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      res:getAxis(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<frac|11|5*2<rsup|<frac|3|2>>>>>|<row|<cell|0>>>>>,<frac|<sqrt|321>|5*2<rsup|<frac|3|2>>>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
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
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|input>
      myAtan2(y,x):=block(

      [s, sp, c, cp, myAtan, res, xx:ratsimp(x), yy:ratsimp(y)],

      \ \ \ \ if y = 0 and x = 0 then

      \ \ \ \ \ \ error("Gli argomenti non possono essere entrambi zero"),

      \ \ \ \ if x = 0 and 1 = y then return(%pi/2)

      \ \ \ \ elseif x = 0 and -1 = y then return(-%pi/2),

      \ \ \ \ /*x != 0*/

      \ \ \ \ myAtan:trigreduce(trigsimp(simp(atan(yy/xx)))),

      \ \ \ \ /*print("atan(",yy/xx,")=",myAtan),*/

      \ \ \ \ s:ratsimp(sin(myAtan)), sp:ratsimp(sin(myAtan+%pi)),

      \ \ \ \ c:ratsimp(cos(myAtan)), cp:ratsimp(cos(myAtan+%pi)),

      \ \ \ \ /*x\<gtr\>0, y\<gtr\>0*/

      \ \ \ \ if c = xx and s = yy then return(myAtan)

      \ \ \ \ /*x\<less\>0, y\<less\>0*/

      \ \ \ \ elseif cp = xx and sp = yy then return(myAtan-%pi)

      \ \ \ \ /*x\<less\>0, y\<gtr\>0*/

      \ \ \ \ elseif cp = xx and s = yy then return(myAtan+%pi)

      \ \ \ \ /*x\<gtr\>0, y\<less\>0*/

      \ \ \ \ elseif c = xx and sp = yy then return(-myAtan) \ \ \ 

      \ \ \ \ else error("Nessun caso coperto")

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|input>
      getAngle(R):=block(

      [Rplus, Rminus, S1, S2, dim, Rt, v, c, s, norm, u, angle,cc],

      \ \ \ \ \ \ \ \ dim:size(R),

      \ \ \ \ \ \ \ \ Rt:transpose(R),

      \ \ \ \ \ \ \ \ I:ident(dim[1]),

      \ \ \ \ \ \ \ \ Rminus:trigsimp((R-Rt)/2),

      \ \ \ \ \ \ \ \ Rplus:trigsimp((R+Rt)/2-I), \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ [v, norm, u]:getAxis(R), \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ S1:S(u), s:0, c:0,

      \ \ \ \ \ \ \ \ if(isRot(R) = false) then\ 

      \ \ \ \ \ \ \ \ error("La matrice inserita non è di rotazione."),
      \ \ \ \ 

      \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S1[i][j]#0) then

      \ \ \ \ \ \ \ \ \ \ \ \ \ s:Rminus[i][j]/S1[i][j],

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(s)

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ S2:S1.S1,

      \ \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S2[i][j]#0) then

      \ \ \ \ \ \ \ \ \ \ \ \ \ c:expand(1-Rplus[i][j]/S2[i][j]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(c)

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ angle:simp(atan2(expand(s),expand(c))),

      \ \ \ \ \ \ \ \ return(expand(angle/norm))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      angle:getAngle(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >>-<frac|5*2<rsup|<frac|3|2>>*\<pi\>|<sqrt|321>>+<frac|<sqrt|2>*\<pi\>|3>+<frac|3|<sqrt|2>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Procedura 18)> Data una matrice di rotazione
      calcolare contemporaneamente asse ed angolo
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|input>
      getRotData(R):=block(

      [angle, axes],

      \ \ \ \ \ \ \ \ axes:getAxis(R),

      \ \ \ \ \ \ \ \ angle:getAngle(R),

      \ \ \ \ \ \ \ \ return([axes[1],angle])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      R
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
    <|unfolded-io>
      data:getRotData(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o44>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<frac|11|5*2<rsup|<frac|3|2>>>>>|<row|<cell|0>>>>>,-<frac|5*2<rsup|<frac|3|2>>*\<pi\>|<sqrt|321>>+<frac|<sqrt|2>*\<pi\>|3>+<frac|3|<sqrt|2>>|]>>>
    </unfolded-io>

    <\textput>
      Verifichiamo il risultato
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      rodData:trigreduce(rodrigues(data[1],data[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|)>|321>>|<cell|<frac|55*<around*|(|2<rsup|<frac|3|2>>-2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*<around*|(|2<rsup|<frac|3|2>>-2<rsup|<frac|3|2>>*cos
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*\<pi\>|30>-\<pi\>+<frac|3*<sqrt|321>|20>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<around*|(|60-2*<sqrt|321>|)>*\<pi\>-9*<sqrt|321>|60>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      factor(expand(trigreduce(trigexpand(rodData ))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><matrix|<tformat|<table|<row|<cell|-<frac|121*cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>-200|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>|321>>|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>|321>>|<cell|-<frac|200*cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>-121|321>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|unfolded-io>
      isRot(rodData)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o47>)
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
        è \ di rotazione
      </equation*>

      <\equation*>
        <around*|(|2|)>R\<longrightarrow\>S=<around*|(|R+I|)><rsup|-1>*<around*|(|R-I|)>\<Longrightarrow\>S<space|1em>è
        una matrice antisimmetrica
      </equation*>

      In particolare, dato un asse di rotazione <math|v> occorre prima
      calcolare la matrice antisimmetrica S ed in seguito applicare la (1)
      per ottenere la corrispondente matrice di rotazione.\ 

      Alternativamente, data una matrice di rotazione <math|R> occorre
      applicare (2) per ottenere la matrice antisimmetrica corrispondente e,
      in seguito, selezionare all'interno della matrice <math|S> gli elementi
      dell'asse di rotazione <math|v>. Quest'ultimi corrispondono a:

      <\equation*>
        S=<matrix|<tformat|<table|<row|<cell|0<space|1em>-c<space|1em><with|color|red|b>>>|<row|<cell|<with|color|red|c><space|1em>0<space|1em>-a>>|<row|<cell|-b<space|1em><with|color|red|a><space|1em>0>>>>>\<longrightarrow\>v=<matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>>>>
      </equation*>

      Ottenuto il vettore <math|v> è possibile calcolare il versore e
      l'angolo di rotazione. Infatti:

      <\equation*>
        v=<frac|v|<around*|\<\|\|\>|v|\<\|\|\>>>*<around*|\<\|\|\>|v|\<\|\|\>><space|1em>in
        cui<space|1em><frac|v|<around*|\<\|\|\>|v|\<\|\|\>>>\<assign\>versore
        di rotazione<space|1em><around*|\<\|\|\>|v|\<\|\|\>>\<assign\>angolo
        di rotazione
      </equation*>

      <strong|<em|N.B.: >><math|<around*|\<\|\|\>|v|\<\|\|\>>> è la norma-2
      del vettore <math|v>

      Per calcolare correttamente l'angolo di rotazione data la norma del
      vettore <math|v>, poniamo <math|v>=\<alpha\>. Quindi, sussistono le
      seguenti relazioni:

      <\eqnarray*>
        <tformat|<table|<row|<cell|>|<cell|\<alpha\>=<frac|sin<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>\<longrightarrow\>\<alpha\><rsup|2>=<frac|1-cos<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>>|<cell|>>|<row|<cell|<around*|(|i|)>>|<cell|cos<around*|(|\<theta\>|)>=<frac|1-\<alpha\><rsup|2>|1+\<alpha\><rsup|2>>\<equiv\><frac|1-<around*|\<\|\|\>|v|\<\|\|\>><rsup|2>|1+<around*|\<\|\|\>|v|\<\|\|\>><rsup|2>>>|<cell|>>>>
      </eqnarray*>

      <\math>
        Data la pluralità delle soluzioni occorre calcolare anche il
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
      <math|<around*|\<\|\|\>|v|\<\|\|\>>>\<gtr\>0 cioé:
      <math|<frac|sin<around*|(|\<theta\>|)>|1+cos<around*|(|\<theta\>|)>>\<gtr\>0>.

      Dopodiché l'angolo è univocamente identificato tramite la funzione
      atan2:

      <\equation*>
        <around*|(|ii|)>\<theta\>=atan2<around*|(|\<pm\><frac|2*\<alpha\>|1+\<alpha\><rsup|2>>,<frac|1-\<alpha\><rsup|2>|1+\<alpha\><rsup|2>>|)>=atan2<around*|(|sin<around*|(|\<theta\>|)>,cos<around*|(|\<theta\>|)>|)>
      </equation*>

      \;
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|input>
      cayley(S):=block(

      \ \ \ \ [cay,I,dim],

      \ \ \ \ dim:size(S),

      \ \ \ \ if isAsim(S) then(

      \ \ \ \ I:ident(dim[1]),

      \ \ \ \ cay:(I+S).invert(I-S),

      \ \ \ \ return(cay))

      \ \ \ \ else(error("La matrice non è antisimmetrica"))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|unfolded-io>
      S
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o49>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<sqrt|2>>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|-<sqrt|2>>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|unfolded-io>
      cayley(S)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o50>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|<sqrt|2>>>>|<row|<cell|<frac|1|<sqrt|2>>>|<cell|<frac|1|2>>|<cell|-<frac|1|2>>>|<row|<cell|-<frac|1|<sqrt|2>>>|<cell|<frac|1|2>>|<cell|-<frac|1|2>>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|input>
      invCayley(R):=block([I,S,v,norm,cosTheta,sinTheta,theta,cond],

      \ \ \ if isRot(R) then(

      \ \ \ \ \ I:ident(3),

      \ \ \ \ \ R:ratsimp(R),

      \ \ \ \ \ S:mySimp(invert(R+I).(R-I)),

      \ \ \ \ \ v:matrix([S[3][2]],[S[1][3]],[S[2][1]]),

      \ \ \ \ \ norm:(v.v),

      \ \ \ \ \ cosTheta:trigsimp((1-norm)/(1+norm)),

      \ \ \ \ \ sinTheta:trigsimp((2*sqrt(norm))/(1+norm)),

      \ \ \ \ \ cond:sinTheta/(1+cosTheta),

      \ \ \ \ \ if cond\<gtr\>0 then (theta:trigsimp(myAtan2(sinTheta,cosTheta)))

      \ \ \ \ \ else (theta:trigsimp(myAtan2(-sinTheta,cosTheta))),

      \ \ \ \ \ return([S,theta])

      \ \ \ )

      \ \ \ else(error("La matrice non è di rotazione"))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      R
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>53) >
    <|unfolded-io>
      S:invCayley(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o53>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>>>>|<row|<cell|0>|<cell|0>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>|<sqrt|321>*<around*|(|cos
      <around*|(|<frac|<sqrt|321>*<around*|(|2*\<pi\>+9|)>|60>|)>+1|)>>>|<cell|0>>>>>,-<frac|2*<sqrt|321>*\<pi\>+9*<sqrt|321>|60>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
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
  </collection>
</initial>