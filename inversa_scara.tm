<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      assume(L[1]\<gtr\>0,D[1]\<gtr\>0,D[2]\<gtr\>0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|L<rsub|1>\<gtr\>0,D<rsub|1>\<gtr\>0,D<rsub|2>\<gtr\>0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      scara:[[q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,D<rsub|1>|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      dh:rename(DH(scara),1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|-c<rsub|1>*s<rsub|2>-s<rsub|1>*c<rsub|2>>|<cell|0>|<cell|D<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>+D<rsub|1>*c<rsub|1>>>|<row|<cell|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>>|<cell|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>>|<cell|0>|<cell|D<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>+D<rsub|1>*s<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq:flatten([getEq(dh),[c[1]^2+s[1]^2-1,c[2]^2+s[2]^2-1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|[|X-D<rsub|2>*<around*|(|c<rsub|1>*c<rsub|2>-s<rsub|1>*s<rsub|2>|)>-D<rsub|1>*c<rsub|1>=0,Y-D<rsub|2>*<around*|(|c<rsub|1>*s<rsub|2>+s<rsub|1>*c<rsub|2>|)>-D<rsub|1>*s<rsub|1>=0,Z-q<rsub|3>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      <math|q<rsub|3>> è univocamente determinato dalla seguente espressione
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      q3:map(rhs,solve(eq[3],q[3]))[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>Z-L<rsub|1>>>
    </unfolded-io>

    <\textput>
      Con <math|q<rsub|3>> noto, possiamo semplificare ed ottenere la
      seguente espressione:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      p:factor(eliminate([eq[1],eq[2],eq[5],eq[4]],[c[1],s[1],s[2]]))[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><around*|(|D<rsub|2>*c<rsub|2>+D<rsub|1>|)><rsup|8>*<around*|(|2*D<rsub|1>*D<rsub|2>*c<rsub|2>+D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)><rsup|4>*<around*|(|Y<rsup|2>+X<rsup|2>-2*D<rsub|1>*D<rsub|2>*c<rsub|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|4>>>
    </unfolded-io>

    <\textput>
      Selezioniamo quella che dipende da <math|X> e <math|Y> e risolviamo per
      determinare <math|c<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      pp:part(p,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|(|Y<rsup|2>+X<rsup|2>-2*D<rsub|1>*D<rsub|2>*c<rsub|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|4>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      c2:map(rhs,solve(pp,c[2]))[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><frac|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|unfolded-io>
      s2:[sqrt(1-c2^2),-sqrt(1-c2^2)]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o9>)
      >><around*|[|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>,-<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>|]>>>
    </unfolded-io>

    <\textput>
      Noto <math|q<rsub|3>>, allora abbiamo due soluzioni per
      <math|q<rsub|2>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      q2:[atan2(s2[1],c2),atan2(s2[2],c2)]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><around*|[|<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>,-<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Con <math|q<rsub|2>> noto, riscriviamo le equazioni precedenti per
      ottenere espressioni che dipendono solo da <math|s<rsub|1>>,
      <math|c<rsub|1>>. Per un valore fissato di <math|q<rsub|2>>, otteniamo
      due soluzioni per <math|q<rsub|1>>.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      eqq1:facsum(ratsimp(expand(psubst([c[2]=c2,s[2]=s2[1]],eq))),[s[1],c[1]])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >><around*|[|<frac|s<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-c<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>+2*D<rsub|1>*X|2*D<rsub|1>>=0,-<frac|c<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+s<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>-2*D<rsub|1>*Y|2*D<rsub|1>>=0,Z-q<rsub|3>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      [c11,s11]:map(rhs,flatten(solve([eqq1[1],eqq1[2]],[c[1],s[1]])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><around*|[|<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+X*Y<rsup|2>+X<rsup|3>+<around*|(|D<rsub|1><rsup|2>-D<rsub|2><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,-<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-Y<rsup|3>+<around*|(|-X<rsup|2>+D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      eqq2:facsum(ratsimp(expand(psubst([c[2]=c2,s[2]=s2[2]],eq))),[s[1],c[1]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >><around*|[|-<frac|s<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+c<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>-2*D<rsub|1>*X|2*D<rsub|1>>=0,<frac|c<rsub|1>*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-s<rsub|1>*<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>+2*D<rsub|1>*Y|2*D<rsub|1>>=0,Z-q<rsub|3>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      [c12,s12]:map(rhs,flatten(solve([eqq2[1],eqq2[2]],[c[1],s[1]])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><around*|[|-<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-X*Y<rsup|2>-X<rsup|3>+<around*|(|D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+Y<rsup|3>+<around*|(|X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      q1:[atan2(s11,c11),atan2(s12,c12)]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><around*|[|-<math-up|atan2><around*|(|<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-Y<rsup|3>+<around*|(|-X<rsup|2>+D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+X*Y<rsup|2>+X<rsup|3>+<around*|(|D<rsub|1><rsup|2>-D<rsub|2><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|)>,<math-up|atan2><around*|(|<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+Y<rsup|3>+<around*|(|X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,-<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-X*Y<rsup|2>-X<rsup|3>+<around*|(|D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|)>|]>>>
    </unfolded-io>

    <\textput>
      Complessivamente la soluzione della cinematica inversa è:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      sol1:[q1[1],q2[1],q3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><around*|[|-<math-up|atan2><around*|(|<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-Y<rsup|3>+<around*|(|-X<rsup|2>+D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+X*Y<rsup|2>+X<rsup|3>+<around*|(|D<rsub|1><rsup|2>-D<rsub|2><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|)>,<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>,Z-L<rsub|1>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      sol2:[q1[2],q2[2],q3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|<math-up|atan2><around*|(|<frac|X*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>+Y<rsup|3>+<around*|(|X<rsup|2>-D<rsub|2><rsup|2>+D<rsub|1><rsup|2>|)>*Y|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>,-<frac|Y*<sqrt|-Y<rsup|4>+<around*|(|-2*X<rsup|2>+2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*Y<rsup|2>-X<rsup|4>+<around*|(|2*D<rsub|2><rsup|2>+2*D<rsub|1><rsup|2>|)>*X<rsup|2>-D<rsub|2><rsup|4>+2*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>-D<rsub|1><rsup|4>>-X*Y<rsup|2>-X<rsup|3>+<around*|(|D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)>*X|2*D<rsub|1>*Y<rsup|2>+2*D<rsub|1>*X<rsup|2>>|)>,-<math-up|atan2><around*|(|<sqrt|1-<frac|<around*|(|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|)><rsup|2>|4*D<rsub|1><rsup|2>*D<rsub|2><rsup|2>>>,<frac|Y<rsup|2>+X<rsup|2>-D<rsub|2><rsup|2>-D<rsub|1><rsup|2>|2*D<rsub|1>*D<rsub|2>>|)>,Z-L<rsub|1>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
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