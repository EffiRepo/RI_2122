<TeXmacs|2.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <doc-data|<doc-title|--Procedure\U>|<\doc-subtitle>
    Matrice Antisimmetrica e legame con Matrici di Rotazione,

    Formula di Rodrigues e Parametrizzazione di Caley
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
      <with|color|red|(<with|math-font-family|rm|%i>46) >
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
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|unfolded-io>
      vv:matrix([v[x]],[v[y]],[v[z]])
    <|unfolded-io>
      \;

      \;

      \ <math|<with|math-display|true|<text|<verbatim|a><verbatim|p><verbatim|p><verbatim|l><verbatim|y><verbatim|:><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|s><verbatim|c><verbatim|r><verbatim|i><verbatim|p><verbatim|t><verbatim|
      ><verbatim|m><verbatim|u><verbatim|s><verbatim|t><verbatim|
      ><verbatim|b><verbatim|e><verbatim| ><verbatim|a><verbatim|n><verbatim|
      ><verbatim|i><verbatim|n><verbatim|t><verbatim|e><verbatim|g><verbatim|e><verbatim|r><verbatim|;><verbatim|
      ><verbatim|f><verbatim|o><verbatim|u><verbatim|n><verbatim|d><verbatim|:><verbatim|
      >>x>>

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|unfolded-io>
      S:S(vv)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o48>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|z>>|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>|<cell|0>|<cell|-v<rsub|x>>>|<row|<cell|-v<rsub|y>>|<cell|v<rsub|x>>|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.1)Procedura:> Verificare una matrice sia
      antisimmetrica
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|input>
      isAsim(M):=block(

      [sz:size(M), t, i, j, diagCheck, sideCheck, b],

      /*Verifichiamo che la matrice inserita sia quadrata*/ \ \ \ \ \ \ \ 

      if sz[1]#sz[2] or sz[1] \<less\> 2 or sz[2] \<less\> 2 then
      error("Inserire una matrice quadrata"),

      /*Per verificare che una qualsiasi matrice m x n quadrata sia
      antisimmetrica usiamo una tecnica ricorsiva.*/

      /*caso base:*/

      if sz[1] = 2 then(

      /*Controllo che la diagonale sia tutta nulla*/

      \ \ diagCheck: M[1,1] = M[2,2] and M[1,1] = 0,

      /*Controllo che gli elementi fuori diagonale

      \ \ siano uguali a meno del segno*/

      \ \ sideCheck: M[1,2] = -M[2,1],

      /*Uniamo le due condizioni necessarie*/

      \ \ b: diagCheck and sideCheck,

      \ \ return(is(b))

      ) else (

      /*caso generale*/

      \ \ j:1,

      \ \ diagCheck: M[j,j] = 0,

      \ \ for t:1 thru sz[1] do(

      /*Calcolo i = t mod(n)*/

      \ \ \ \ i:remainder(t,sz[1]),

      \ \ \ \ if i = 0 then i:n,

      \ \ \ \ sideCheck: M[i,j] = -M[j,i], \ \ \ 

      \ \ \ \ b: diagCheck and sideCheck,

      \ /*Se la condizione è violata esco, altrimenti rilancio con la
      sottomatrice ottenuta cancellando la prima riga e la prima colonna*/

      \ \ \ \ if b = false then return(b) else
      return(isAsim(submatrix(i,M,j))) \ \ \ 

      \ \ )

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|unfolded-io>
      isAsim(S)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o50>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.2)Procedura:> data una matrice antisimmetrica
      <math|S<around*|(|v|)>> determinare il vettore <math|v>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
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
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      getAsimVect(S)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|x>>>|<row|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>>>>>>>
    </unfolded-io>

    <\textput>
      <\with|font-shape|right>
        <with|font-series|bold|12.3)Procedura:> calcolare il prodotto
        vettoriale <math|v\<times\>w> come prodotto matriciale

        <center|<center|><math|v\<times\>w=S<around*|(|v|)>\<cdot\>w>>
      </with>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>53) >
    <|input>
      antiSimProduct(v,w):=block(

      [S,Sw],

      \ S:S(v),

      \ Sw:S.w,

      \ return(Sw)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
    <|unfolded-io>
      ww:matrix([w[x]],[w[y]],[w[z]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o54>)
      >><matrix|<tformat|<table|<row|<cell|w<rsub|x>>>|<row|<cell|w<rsub|y>>>|<row|<cell|w<rsub|z>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>55) >
    <|unfolded-io>
      prod1:antiSimProduct(vv,ww)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o55>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      Calcolo il prodotto vettoriale con la mia procedura. Prendiamo il primo
      membro del risultato per come è stata definita.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>56) >
    <|unfolded-io>
      prod2:vect_prod(vv,ww)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o56>)
      >>e<rsub|x>*v<rsub|y>*w<rsub|z>-v<rsub|x>*e<rsub|y>*w<rsub|z>-e<rsub|x>*w<rsub|y>*v<rsub|z>+w<rsub|x>*e<rsub|y>*v<rsub|z>+v<rsub|x>*w<rsub|y>*e<rsub|z>-w<rsub|x>*v<rsub|y>*e<rsub|z>>>
    </unfolded-io>

    <\textput>
      Per verificare il risultato, applichiamo una sostituzione per eliminare
      i versori simbolici
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>57) >
    <|unfolded-io>
      psubst([e[x]=matrix([1],[0],[0]),e[y]=matrix([0],[1],[0]),e[z]=matrix([0],[0],[1])],prod2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o57>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|13)Procedura:> calcolare l'esponenziale di
      matrice, <math|\<mathe\><rsup|A\<nosymbol\>t>> usando la trasformata di
      Laplace
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>58) >
    <|input>
      expLaplace(A,t):=block(

      [sz, II, s, sIImA, sIImAT, i, iltA], load("my_lib"),

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
      <with|color|red|(<with|math-font-family|rm|%i>59) >
    <|input>
      expVect(A,t):=block(

      [sz, V, eigVec, Vi, D, expD, res, theta],

      \ \ \ \ \ \ sz:size(A),

      \ \ \ \ \ \ if(sz[1]#sz[2]) then error("Matrix not Square"),

      /*Definiamo una matrice vuota pronta a contenere vettori colonna di
      dimensione 3*/

      \ \ \ \ \ \ V:zeromatrix(sz[1],0),

      \ \ \ \ \ \ eigVec:myEigens(A)[2],

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
      <with|color|red|(<with|math-font-family|rm|%i>60) >
    <|unfolded-io>
      A:matrix([1,1,0],[0,2,2],[0,0,3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o60>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|2>>|<row|<cell|0>|<cell|0>|<cell|3>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>61) >
    <|unfolded-io>
      expLaplace(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o61>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)><rsup|2>*\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>62) >
    <|unfolded-io>
      expVect(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o62>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)><rsup|2>*\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>63) >
    <|unfolded-io>
      a:matrix([0,1,0],[1,0,0],[0,0,-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o63>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>64) >
    <|unfolded-io>
      expand(expVect(a,t))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o64>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>65) >
    <|unfolded-io>
      expLaplace(a,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o65>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
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
      <with|color|red|(<with|math-font-family|rm|%i>66) >
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
      <with|color|red|(<with|math-font-family|rm|%i>67) >
    <|unfolded-io>
      v:matrix([1],[sqrt(2)],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o67>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<sqrt|2>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>68) >
    <|unfolded-io>
      S:S(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o68>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<sqrt|2>>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|-<sqrt|2>>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>69) >
    <|unfolded-io>
      R:mySimp(demoivre(rotExp(S,t)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o69>)
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
      <with|color|red|(<with|math-font-family|rm|%i>70) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o70>)
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
      <with|color|red|(<with|math-font-family|rm|%i>71) >
    <|input>
      normalize(v):=block(

      [norm:0, u, i, sz, vv],

      sz:size(v),

      /*Mi assicuro che v sia un vettore colonna*/

      if nonscalarp(v) and sz[2] = 1 \ then(

      \ \ vv:ratsimp(v), \ norm:sqrt(transpose(vv).vv),

      \ \ /*Applico una semplificazione numerica, dividendo il vettore per
      una sua componente non nulla, al fine di migliorare l'output*/

      \ \ norm:sqrt(transpose(vv).vv),

      \ \ u:ratsimp(vv/norm)

      ),

      return([norm,u])\ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>72) >
    <|unfolded-io>
      v:matrix([sqrt(2)],[1.1],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o72>)
      >><matrix|<tformat|<table|<row|<cell|<sqrt|2>>>|<row|<cell|1.1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      Verifico il risultato espresso in [norma, versore]
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>73) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o73>)
      >><around*|[|<frac|<sqrt|321>|10>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>74) >
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
      <with|color|red|(<with|math-font-family|rm|%i>75) >
    <|unfolded-io>
      R:rodrigues(v,%pi/3+1.5)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o75>)
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
      <with|color|red|(<with|math-font-family|rm|%i>76) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o76>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      Verifichiamo una rotazione generica attorno all'asse <math|x>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>77) >
    <|unfolded-io>
      rx: rodrigues(matrix([1],[0],[0]),theta)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o77>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos <around*|(|\<vartheta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>78) >
    <|unfolded-io>
      isRot(rx)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o78>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|16)Procedura:> Calcolare l'asse di una matrice
      di rotazione
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>79) >
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
      <with|color|red|(<with|math-font-family|rm|%i>80) >
    <|unfolded-io>
      res:getAxis(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o80>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<frac|11|5*2<rsup|<frac|3|2>>>>>|<row|<cell|0>>>>>,<frac|<sqrt|321>|5*2<rsup|<frac|3|2>>>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|17) Procedura:> Determinare l'angolo di una
      matrice di rotazione
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>81) >
    <|input>
      myAtan2(y,x):=block(

      [s, sp, c, cp, myAtan, res, xx:ratsimp(x), yy:ratsimp(y)],

      \ \ \ \ if y = 0 and x = 0 then

      \ \ \ \ \ \ error("Gli argomenti non possono essere entrambi zero"),

      \ \ \ \ if x = 0 and 1 = y then return(%pi/2)

      \ \ \ \ elseif x = 0 and -1 = y then return(-%pi/2),

      \ \ \ \ /*x != 0*/

      \ \ \ \ myAtan:trigreduce(trigsimp(simp(atan(yy/xx)))),

      \ \ \ \ print("atan(",yy/xx,")=",myAtan),

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
      <with|color|red|(<with|math-font-family|rm|%i>82) >
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
      <with|color|red|(<with|math-font-family|rm|%i>83) >
    <|unfolded-io>
      angle:getAngle(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o83>)
      >>-<frac|5*2<rsup|<frac|3|2>>*\<pi\>|<sqrt|321>>+<frac|<sqrt|2>*\<pi\>|3>+<frac|3|<sqrt|2>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|Procedura 18)> Data una matrice di rotazione
      calcolare contemporaneamente asse ed angolo
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>84) >
    <|input>
      getRotData(R):=block(

      [angle, axes],

      \ \ \ \ \ \ \ \ axes:getAxis(R),

      \ \ \ \ \ \ \ \ angle:getAngle(R),

      \ \ \ \ \ \ \ \ return([axes[1],angle])

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>85) >
    <|unfolded-io>
      data:getRotData(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o85>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<frac|11|5*2<rsup|<frac|3|2>>>>>|<row|<cell|0>>>>>,-<frac|5*2<rsup|<frac|3|2>>*\<pi\>|<sqrt|321>>+<frac|<sqrt|2>*\<pi\>|3>+<frac|3|<sqrt|2>>|]>>>
    </unfolded-io>

    <\textput>
      Verifichiamo il risultato
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>86) >
    <|unfolded-io>
      rodData:rodrigues(data[1],data[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o86>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|)>|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|)>|321>>|<cell|-<frac|11*sin
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|)>|321>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|<sqrt|321>>>>|<row|<cell|<frac|11*sin
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|<sqrt|321>>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<around*|(|5*2<rsup|<frac|5|2>>*<sqrt|321>-107*2<rsup|<frac|3|2>>|)>*\<pi\>-963*<sqrt|2>|5*2<rsup|<frac|5|2>>*<sqrt|321>>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>87) >
    <|unfolded-io>
      factor(expand(trigreduce(trigexpand(rodData ))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o87>)
      >><matrix|<tformat|<table|<row|<cell|<frac|121*cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>+200|321>>|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>-1|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>|<sqrt|321>>>>|<row|<cell|-<frac|55*2<rsup|<frac|3|2>>*<around*|(|cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>-1|)>|321>>|<cell|<frac|200*cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>+121|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<around*|(|2*<sqrt|321>-60|)>*\<pi\>+9*<sqrt|321>|60>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>88) >
    <|unfolded-io>
      isRot(rodData)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o88>)
      >><math-bf|true>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>89) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
  </collection>
</initial>