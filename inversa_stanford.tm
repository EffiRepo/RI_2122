<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|Robot Sferico di Stanford>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      stanf:[[q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,L<rsub|2>,<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dh:rename(DH(stanf),0)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*s<rsub|2>>|<cell|c<rsub|1>*s<rsub|2>*q<rsub|3>-s<rsub|1>*L<rsub|2>>>|<row|<cell|s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*s<rsub|2>>|<cell|s<rsub|1>*s<rsub|2>*q<rsub|3>+c<rsub|1>*L<rsub|2>>>|<row|<cell|-s<rsub|2>>|<cell|0>|<cell|c<rsub|2>>|<cell|c<rsub|2>*q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:flatten([getEq(dh),c[1]^2+s[1]^2-1,c[2]^2+s[2]^2-1])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|x-c<rsub|1>*s<rsub|2>*q<rsub|3>+s<rsub|1>*L<rsub|2>=0,y-s<rsub|1>*s<rsub|2>*q<rsub|3>-c<rsub|1>*L<rsub|2>=0,z-c<rsub|2>*q<rsub|3>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Eliminiamo variabili trigonometriche
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      p:eliminate(eq,[c[1],s[1],s[2],c[2]])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >>q<rsub|3><rsup|288>*<around*|(|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>-L<rsub|1><rsup|2>|)><rsup|48>*<around*|(|-z<rsup|2>+2*L<rsub|1>*z+q<rsub|3><rsup|2>+L<rsub|2><rsup|2>-L<rsub|1><rsup|2>|)><rsup|48>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|48>>>
    </unfolded-io>

    <\textput>
      Seleziono il fattore che dipende da <math|X,Y,Z> contemporaneamente. Le
      altre sono soluzioni singolari.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      p:part(p,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><around*|(|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>|)><rsup|48>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      p:part(p,1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >>z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-q<rsub|3><rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>
    </unfolded-io>

    <\textput>
      Risolvo per determinare <math|q<rsub|3>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      q3:map(rhs,solve(p,q[3]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|[|-<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>,<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>|]>>>
    </unfolded-io>

    <\textput>
      Con <math|q<rsub|3>> noto, eliminiamolo insieme alle variabili in
      <math|q<rsub|1>> per determinare una soluzione in <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      eqq:(eliminate(eq,[c[1],s[1],q[3]])[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >>s<rsub|2><rsup|4>*<around*|(|z-L<rsub|1>|)><rsup|4>*<around*|(|s<rsub|2><rsup|2>*<around*|(|-z<rsup|2>+2*L<rsub|1>*z-L<rsub|1><rsup|2>|)>+c<rsub|2><rsup|2>*y<rsup|2>+c<rsub|2><rsup|2>*x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>*<around*|(|s<rsub|2><rsup|2>*<around*|(|z<rsup|2>-2*L<rsub|1>*z+L<rsub|1><rsup|2>|)>+L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\textput>
      Selezioniamo il terzo fattore poiché dipende da \ <math|X,Y,Z>
      contemporaneamente
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      eqq:part(eqq,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|(|s<rsub|2><rsup|2>*<around*|(|-z<rsup|2>+2*L<rsub|1>*z-L<rsub|1><rsup|2>|)>+c<rsub|2><rsup|2>*y<rsup|2>+c<rsub|2><rsup|2>*x<rsup|2>-L<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)><rsup|2>>>
    </unfolded-io>

    <\textput>
      Risolviamo per determinare le soluzioni in <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      sol2:flatten(solve([eqq,eq[5]],[c[2],s[2]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o10>)
      >><around*|[|c<rsub|2>=-<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=-<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=-<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=-<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,c<rsub|2>=<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,s<rsub|2>=<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\textput>
      In particolare, osserviamo che per ogni valore di <math|c<rsub|2>>
      abbiamo due possibili valori di <math|s<rsub|2>>, pertanto ricostruiamo
      <math|q<rsub|2>> come segue
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      [c21,c22]:map(rhs,[sol2[1],sol2[5]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|-<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      [s211,s212]:map(rhs,[sol2[2],sol2[4]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|-<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    <\textput>
      Le soluzioni fino ad ora trovate sono le seguenti:

      <center|<math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|atan2<around*|(|s<rsub|211>,c<rsub|21>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|atan2<around*|(|s<rsub|212>,c<rsub|21>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|atan2<around*|(|s<rsub|211>,c<rsub|22>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|atan2<around*|(|s<rsub|212>,c<rsub|22>|)>>>>>>>>

      \;

      \;

      Soluzioni che non vengono considerate dato che uguali a
      <math|s<rsub|211>,s<rsub|212>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      [s221,s222]:map(rhs,[sol2[6],sol2[8]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|-<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|]>>>
    </unfolded-io>

    \;

    <\textput>
      Relative a <math|q<rsub|31>:>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      q21: [atan2(s211,c21),atan2(s212,c21)]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|-<math-up|atan2><around*|(|<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,-<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>,<math-up|atan2><around*|(|<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,-<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Relative a <math|q<rsub|32>:>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      q22: [atan2(s211,c22),atan2(s212,c22)]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|-<math-up|atan2><around*|(|<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>,<math-up|atan2><around*|(|<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>,<frac|z-L<rsub|1>|<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Per queste 4 soluzioni dobbiamo calcolare il valore di
      <math|q<rsub|1>>:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      [s1,c1]:map(rhs,flatten(solve([eq[1],eq[2]],[s[1],c[1]])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|-<frac|L<rsub|2>*x-s<rsub|2>*q<rsub|3>*y|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*y+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      q1:atan2(s1,c1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >>-<math-up|atan2><around*|(|<frac|L<rsub|2>*x-s<rsub|2>*q<rsub|3>*y|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>,<frac|L<rsub|2>*y+s<rsub|2>*q<rsub|3>*x|s<rsub|2><rsup|2>*q<rsub|3><rsup|2>+L<rsub|2><rsup|2>>|)>>>
    </unfolded-io>

    <\textput>
      Determino soluzioni finali:

      <center|<math|<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|atan2<around*|(|s<rsub|211>,c<rsub|21>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|31>>>|<row|<cell|atan2<around*|(|s<rsub|212>,c<rsub|21>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|atan2<around*|(|s<rsub|211>,c<rsub|22>|)>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|32>>>|<row|<cell|atan2<around*|(|s<rsub|212>,c<rsub|22>|)>>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      q11:psubst([q[3]=q3[1],s[2]=s211],q1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >>-<math-up|atan2><around*|(|<frac|L<rsub|2>*x-y*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|y<rsup|2>+x<rsup|2>>,<frac|x*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>+L<rsub|2>*y|y<rsup|2>+x<rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      q12:psubst([q[3]=q3[1],s[2]=s212],q1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >>-<math-up|atan2><around*|(|<frac|y*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>+L<rsub|2>*x|y<rsup|2>+x<rsup|2>>,<frac|L<rsub|2>*y-x*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|y<rsup|2>+x<rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      q13:psubst([q[3]=q3[2],s[2]=s211],q1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >>-<math-up|atan2><around*|(|<frac|y*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>+L<rsub|2>*x|y<rsup|2>+x<rsup|2>>,<frac|L<rsub|2>*y-x*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|y<rsup|2>+x<rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      q14:psubst([q[3]=q3[2],s[2]=s212],q1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >>-<math-up|atan2><around*|(|<frac|L<rsub|2>*x-y*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>|y<rsup|2>+x<rsup|2>>,<frac|x*<sqrt|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>*<sqrt|<frac|y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-L<rsub|2><rsup|2>+L<rsub|1><rsup|2>>>+L<rsub|2>*y|y<rsup|2>+x<rsup|2>>|)>>>
    </unfolded-io>

    <\textput>
      Verifichiamo che le soluzioni trovate siano corrette.

      Supponiamo un robot standford con <math|L<rsub|1>=1,L<rsub|2>=3> che
      deve raggiunger eun punto <matrix|<tformat|<table|<row|<cell|3>>|<row|<cell|2>>|<row|<cell|4>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      verifica:ratsimp(psubst([L[1]=1,L[2]=3,x=3,y=2,z=4],[q3[1],q21[1],q11]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|-<sqrt|13>,arctan <around*|(|<frac|2|3>|)>-\<pi\>,-arctan
      <around*|(|<frac|5|12>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      stanfV:(psubst([L[1]=1,L[2]=3,q[1]=verifica[3],q[2]=verifica[2],q[3]=verifica[1]],stanf))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><around*|[|<around*|[|-arctan <around*|(|<frac|5|12>|)>,1,-<frac|\<pi\>|2>,0|]>,<around*|[|arctan
      <around*|(|<frac|2|3>|)>-\<pi\>,3,<frac|\<pi\>|2>,0|]>,<around*|[|0,-<sqrt|13>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      DH(stanfV)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >><matrix|<tformat|<table|<row|<cell|-<frac|36|13<rsup|<frac|3|2>>>>|<cell|<frac|5|13>>|<cell|-<frac|24|13<rsup|<frac|3|2>>>>|<cell|3>>|<row|<cell|<frac|15|13<rsup|<frac|3|2>>>>|<cell|<frac|12|13>>|<cell|<frac|10|13<rsup|<frac|3|2>>>>|<cell|2>>|<row|<cell|<frac|2|<sqrt|13>>>|<cell|0>|<cell|-<frac|3|<sqrt|13>>>|<cell|4>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      verifica:ratsimp(psubst([L[1]=1,L[2]=3,x=3,y=2,z=4],[q3[1],q21[2],q12]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><around*|[|-<sqrt|13>,\<pi\>-arctan
      <around*|(|<frac|2|3>|)>,-<frac|\<pi\>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      stanfV:(psubst([L[1]=1,L[2]=3,q[1]=verifica[3],q[2]=verifica[2],q[3]=verifica[1]],stanf))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|<around*|[|-<frac|\<pi\>|2>,1,-<frac|\<pi\>|2>,0|]>,<around*|[|\<pi\>-arctan
      <around*|(|<frac|2|3>|)>,3,<frac|\<pi\>|2>,0|]>,<around*|[|0,-<sqrt|13>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      DH(stanfV)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>|<cell|3>>|<row|<cell|<frac|3|<sqrt|13>>>|<cell|0>|<cell|-<frac|2|<sqrt|13>>>|<cell|2>>|<row|<cell|-<frac|2|<sqrt|13>>>|<cell|0>|<cell|-<frac|3|<sqrt|13>>>|<cell|4>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      verifica:ratsimp(psubst([L[1]=1,L[2]=3,x=3,y=2,z=4],[q3[2],q22[1],q13]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|<sqrt|13>,-arctan <around*|(|<frac|2|3>|)>,-<frac|\<pi\>|2>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      stanfV:(psubst([L[1]=1,L[2]=3,q[1]=verifica[3],q[2]=verifica[2],q[3]=verifica[1]],stanf))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><around*|[|<around*|[|-<frac|\<pi\>|2>,1,-<frac|\<pi\>|2>,0|]>,<around*|[|-arctan
      <around*|(|<frac|2|3>|)>,3,<frac|\<pi\>|2>,0|]>,<around*|[|0,<sqrt|13>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      DH(stanfV)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>|<cell|3>>|<row|<cell|-<frac|3|<sqrt|13>>>|<cell|0>|<cell|<frac|2|<sqrt|13>>>|<cell|2>>|<row|<cell|<frac|2|<sqrt|13>>>|<cell|0>|<cell|<frac|3|<sqrt|13>>>|<cell|4>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      verifica:ratsimp(psubst([L[1]=1,L[2]=3,x=3,y=2,z=4],[q3[2],q22[2],q14]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><around*|[|<sqrt|13>,arctan <around*|(|<frac|2|3>|)>,-arctan
      <around*|(|<frac|5|12>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      stanfV:(psubst([L[1]=1,L[2]=3,q[1]=verifica[3],q[2]=verifica[2],q[3]=verifica[1]],stanf))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><around*|[|<around*|[|-arctan <around*|(|<frac|5|12>|)>,1,-<frac|\<pi\>|2>,0|]>,<around*|[|arctan
      <around*|(|<frac|2|3>|)>,3,<frac|\<pi\>|2>,0|]>,<around*|[|0,<sqrt|13>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      DH(stanfV)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><matrix|<tformat|<table|<row|<cell|<frac|36|13<rsup|<frac|3|2>>>>|<cell|<frac|5|13>>|<cell|<frac|24|13<rsup|<frac|3|2>>>>|<cell|3>>|<row|<cell|-<frac|15|13<rsup|<frac|3|2>>>>|<cell|<frac|12|13>>|<cell|-<frac|10|13<rsup|<frac|3|2>>>>|<cell|2>>|<row|<cell|-<frac|2|<sqrt|13>>>|<cell|0>|<cell|<frac|3|<sqrt|13>>>|<cell|4>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
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