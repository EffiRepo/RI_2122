<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Robot Antropomorfo - Cinematica Inversa>>

  <\session|maxima|default>
    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      antrop:[[q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,0,D<rsub|3>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      dr:rename(DH(antrop),1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|-c<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>|<cell|s<rsub|1>>|<cell|c<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|s<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|-s<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>|<cell|-c<rsub|1>>|<cell|s<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>>>|<row|<cell|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>>|<cell|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>>|<cell|0>|<cell|D<rsub|3>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>+D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|unfolded-io>
      eq:flatten([getEq(dr),c[1]^2+s[1]^2-1,c[2]^2+s[2]^2-1,c[3]^2+s[3]^2-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o3>)
      >><around*|[|x-c<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0,y-s<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0,z-D<rsub|3>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>-D<rsub|2>*s<rsub|2>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1,s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1|]>>>
    </unfolded-io>

    <\textput>
      Equazioni per calcolare la cinematica inversa:

      <center|<math|<choice|<tformat|<table|<row|<cell|x-c<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0>>|<row|<cell|y-s<rsub|1>*<around*|(|D<rsub|3>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>+D<rsub|2>*c<rsub|2>|)>=0>>|<row|<cell|z-D<rsub|3>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>+D<rsub|2>*s<rsub|2>+L<rsub|1>=0>>|<row|<cell|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>|<row|<cell|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>|<row|<cell|s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0>>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      eq1:factor(expand(eliminate([eq[1],eq[2],eq[4]],[c[1],s[1]]))[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><around*|(|s<rsub|2>*D<rsub|3>*s<rsub|3>-c<rsub|2>*D<rsub|3>*c<rsub|3>-D<rsub|2>*c<rsub|2>|)><rsup|2>*<around*|(|y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+2*D<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>-c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*D<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*c<rsub|2><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      p:part(eq1,2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >>y<rsup|2>+x<rsup|2>-s<rsub|2><rsup|2>*D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+2*c<rsub|2>*s<rsub|2>*D<rsub|3><rsup|2>*c<rsub|3>*s<rsub|3>+2*D<rsub|2>*c<rsub|2>*s<rsub|2>*D<rsub|3>*s<rsub|3>-c<rsub|2><rsup|2>*D<rsub|3><rsup|2>*c<rsub|3><rsup|2>-2*D<rsub|2>*c<rsub|2><rsup|2>*D<rsub|3>*c<rsub|3>-D<rsub|2><rsup|2>*c<rsub|2><rsup|2>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      eq2:eliminate([p,eq[3],eq[5],eq[6]],[c[2],s[2],s[3]])$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|unfolded-io>
      part(eq2[1],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o7>)
      >><around*|(|D<rsub|3><rsup|4>*c<rsub|3><rsup|4>+4*D<rsub|2>*D<rsub|3><rsup|3>*c<rsub|3><rsup|3>+6*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+4*D<rsub|2><rsup|3>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|4>|)><rsup|16>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|unfolded-io>
      part(eq2[1],2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o8>)
      >><around*|(|16*D<rsub|2><rsup|4>*D<rsub|3><rsup|4>*c<rsub|3><rsup|4>+<around*|(|32*D<rsub|2><rsup|3>*D<rsub|3><rsup|5>+32*D<rsub|2><rsup|5>*D<rsub|3><rsup|3>|)>*c<rsub|3><rsup|3>+<around*|(|24*D<rsub|2><rsup|2>*D<rsub|3><rsup|6>+48*D<rsub|2><rsup|4>*D<rsub|3><rsup|4>+24*D<rsub|2><rsup|6>*D<rsub|3><rsup|2>|)>*c<rsub|3><rsup|2>+<around*|(|8*D<rsub|2>*D<rsub|3><rsup|7>+24*D<rsub|2><rsup|3>*D<rsub|3><rsup|5>+24*D<rsub|2><rsup|5>*D<rsub|3><rsup|3>+8*D<rsub|2><rsup|7>*D<rsub|3>|)>*c<rsub|3>+D<rsub|3><rsup|8>+4*D<rsub|2><rsup|2>*D<rsub|3><rsup|6>+6*D<rsub|2><rsup|4>*D<rsub|3><rsup|4>+4*D<rsub|2><rsup|6>*D<rsub|3><rsup|2>+D<rsub|2><rsup|8>|)><rsup|16>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      part(eq2[1],3)$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|unfolded-io>
      part(eq2[1],4)
    <|unfolded-io>
      \;

      part: fell off the end.

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      C3:solve(part(eq2[1],3),c[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|c<rsub|3>=<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-D<rsub|3><rsup|2>-D<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*D<rsub|2>*D<rsub|3>>,0=c<rsub|3><rsup|2>*<around*|(|D<rsub|2><rsup|2>*<around*|(|D<rsub|3><rsup|2>*<around*|(|6*z<rsup|4>+x<rsup|2>*<around*|(|20*z<rsup|2>-4*y<rsup|2>|)>+20*y<rsup|2>*z<rsup|2>-2*y<rsup|4>-2*x<rsup|4>|)>+D<rsub|3><rsup|4>*<around*|(|-12*z<rsup|2>-44*y<rsup|2>-44*x<rsup|2>|)>+6*D<rsub|3><rsup|6>|)>+L<rsub|1>*<around*|(|D<rsub|2><rsup|2>*<around*|(|D<rsub|3><rsup|2>*<around*|(|-24*z<rsup|3>-40*y<rsup|2>*z-40*x<rsup|2>*z|)>+24*D<rsub|3><rsup|4>*z|)>+D<rsub|3><rsup|4>*<around*|(|16*y<rsup|2>*z+16*x<rsup|2>*z|)>+56*D<rsub|2><rsup|4>*D<rsub|3><rsup|2>*z|)>+L<rsub|1><rsup|2>*<around*|(|D<rsub|2><rsup|2>*<around*|(|D<rsub|3><rsup|2>*<around*|(|36*z<rsup|2>+20*y<rsup|2>+20*x<rsup|2>|)>-12*D<rsub|3><rsup|4>|)>+D<rsub|3><rsup|4>*<around*|(|-8*y<rsup|2>-8*x<rsup|2>|)>-28*D<rsub|2><rsup|4>*D<rsub|3><rsup|2>|)>+D<rsub|3><rsup|4>*<around*|(|-8*y<rsup|2>*z<rsup|2>+x<rsup|2>*<around*|(|-8*z<rsup|2>-48*y<rsup|2>|)>-24*y<rsup|4>-24*x<rsup|4>|)>+D<rsub|2><rsup|4>*<around*|(|D<rsub|3><rsup|2>*<around*|(|-28*z<rsup|2>-20*y<rsup|2>-20*x<rsup|2>|)>+28*D<rsub|3><rsup|4>|)>-24*L<rsub|1><rsup|3>*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>*z+D<rsub|3><rsup|6>*<around*|(|-8*y<rsup|2>-8*x<rsup|2>|)>+26*D<rsub|2><rsup|6>*D<rsub|3><rsup|2>+6*L<rsub|1><rsup|4>*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>|)>+c<rsub|3><rsup|3>*<around*|(|D<rsub|2>*<around*|(|D<rsub|3><rsup|3>*<around*|(|4*z<rsup|4>+x<rsup|2>*<around*|(|24*z<rsup|2>-24*y<rsup|2>|)>+24*y<rsup|2>*z<rsup|2>-12*y<rsup|4>-12*x<rsup|4>|)>+D<rsub|3><rsup|5>*<around*|(|-8*z<rsup|2>-8*y<rsup|2>-8*x<rsup|2>|)>+4*D<rsub|3><rsup|7>|)>+L<rsub|1>*<around*|(|D<rsub|2>*<around*|(|D<rsub|3><rsup|3>*<around*|(|-16*z<rsup|3>-48*y<rsup|2>*z-48*x<rsup|2>*z|)>+16*D<rsub|3><rsup|5>*z|)>+64*D<rsub|2><rsup|3>*D<rsub|3><rsup|3>*z|)>+L<rsub|1><rsup|2>*<around*|(|D<rsub|2>*<around*|(|D<rsub|3><rsup|3>*<around*|(|24*z<rsup|2>+24*y<rsup|2>+24*x<rsup|2>|)>-8*D<rsub|3><rsup|5>|)>-32*D<rsub|2><rsup|3>*D<rsub|3><rsup|3>|)>+D<rsub|2><rsup|3>*<around*|(|32*D<rsub|3><rsup|5>-32*D<rsub|3><rsup|3>*z<rsup|2>|)>-16*L<rsub|1><rsup|3>*D<rsub|2>*D<rsub|3><rsup|3>*z+44*D<rsub|2><rsup|5>*D<rsub|3><rsup|3>+4*L<rsub|1><rsup|4>*D<rsub|2>*D<rsub|3><rsup|3>|)>+c<rsub|3>*<around*|(|D<rsub|2><rsup|3>*<around*|(|D<rsub|3>*<around*|(|4*z<rsup|4>+x<rsup|2>*<around*|(|8*z<rsup|2>+8*y<rsup|2>|)>+8*y<rsup|2>*z<rsup|2>+4*y<rsup|4>+4*x<rsup|4>|)>+D<rsub|3><rsup|3>*<around*|(|-8*z<rsup|2>-40*y<rsup|2>-40*x<rsup|2>|)>+4*D<rsub|3><rsup|5>|)>+L<rsub|1>*<around*|(|D<rsub|2><rsup|3>*<around*|(|D<rsub|3>*<around*|(|-16*z<rsup|3>-16*y<rsup|2>*z-16*x<rsup|2>*z|)>+16*D<rsub|3><rsup|3>*z|)>+D<rsub|2>*D<rsub|3><rsup|3>*<around*|(|32*y<rsup|2>*z+32*x<rsup|2>*z|)>+24*D<rsub|2><rsup|5>*D<rsub|3>*z|)>+L<rsub|1><rsup|2>*<around*|(|D<rsub|2><rsup|3>*<around*|(|D<rsub|3>*<around*|(|24*z<rsup|2>+8*y<rsup|2>+8*x<rsup|2>|)>-8*D<rsub|3><rsup|3>|)>+D<rsub|2>*D<rsub|3><rsup|3>*<around*|(|-16*y<rsup|2>-16*x<rsup|2>|)>-12*D<rsub|2><rsup|5>*D<rsub|3>|)>+D<rsub|2>*<around*|(|D<rsub|3><rsup|3>*<around*|(|-16*y<rsup|2>*z<rsup|2>+x<rsup|2>*<around*|(|32*y<rsup|2>-16*z<rsup|2>|)>+16*y<rsup|4>+16*x<rsup|4>|)>+D<rsub|3><rsup|5>*<around*|(|-16*y<rsup|2>-16*x<rsup|2>|)>|)>+D<rsub|2><rsup|5>*<around*|(|D<rsub|3>*<around*|(|-12*z<rsup|2>-12*y<rsup|2>-12*x<rsup|2>|)>+12*D<rsub|3><rsup|3>|)>-16*L<rsub|1><rsup|3>*D<rsub|2><rsup|3>*D<rsub|3>*z+8*D<rsub|2><rsup|7>*D<rsub|3>+4*L<rsub|1><rsup|4>*D<rsub|2><rsup|3>*D<rsub|3>|)>+c<rsub|3><rsup|4>*<around*|(|D<rsub|3><rsup|4>*<around*|(|z<rsup|4>+x<rsup|2>*<around*|(|10*z<rsup|2>+18*y<rsup|2>|)>+10*y<rsup|2>*z<rsup|2>+9*y<rsup|4>+9*x<rsup|4>|)>+L<rsub|1>*<around*|(|D<rsub|3><rsup|4>*<around*|(|-4*z<rsup|3>-20*y<rsup|2>*z-20*x<rsup|2>*z|)>+4*D<rsub|3><rsup|6>*z+36*D<rsub|2><rsup|2>*D<rsub|3><rsup|4>*z|)>+L<rsub|1><rsup|2>*<around*|(|D<rsub|3><rsup|4>*<around*|(|6*z<rsup|2>+10*y<rsup|2>+10*x<rsup|2>|)>-2*D<rsub|3><rsup|6>-18*D<rsub|2><rsup|2>*D<rsub|3><rsup|4>|)>+D<rsub|3><rsup|6>*<around*|(|-2*z<rsup|2>+6*y<rsup|2>+6*x<rsup|2>|)>+D<rsub|2><rsup|2>*<around*|(|D<rsub|3><rsup|4>*<around*|(|-18*z<rsup|2>+22*y<rsup|2>+22*x<rsup|2>|)>+18*D<rsub|3><rsup|6>|)>-4*L<rsub|1><rsup|3>*D<rsub|3><rsup|4>*z+D<rsub|3><rsup|8>+41*D<rsub|2><rsup|4>*D<rsub|3><rsup|4>+L<rsub|1><rsup|4>*D<rsub|3><rsup|4>|)>+D<rsub|2><rsup|4>*<around*|(|z<rsup|4>+x<rsup|2>*<around*|(|2*z<rsup|2>+2*y<rsup|2>|)>+2*y<rsup|2>*z<rsup|2>+D<rsub|3><rsup|2>*<around*|(|-2*z<rsup|2>-10*y<rsup|2>-10*x<rsup|2>|)>+y<rsup|4>+x<rsup|4>+D<rsub|3><rsup|4>|)>+L<rsub|1>*<around*|(|D<rsub|2><rsup|4>*<around*|(|-4*z<rsup|3>-4*y<rsup|2>*z-4*x<rsup|2>*z+4*D<rsub|3><rsup|2>*z|)>+D<rsub|2><rsup|2>*D<rsub|3><rsup|2>*<around*|(|16*y<rsup|2>*z+16*x<rsup|2>*z|)>+4*D<rsub|2><rsup|6>*z|)>+D<rsub|2><rsup|2>*<around*|(|D<rsub|3><rsup|2>*<around*|(|-8*y<rsup|2>*z<rsup|2>+x<rsup|2>*<around*|(|16*y<rsup|2>-8*z<rsup|2>|)>+8*y<rsup|4>+8*x<rsup|4>|)>+D<rsub|3><rsup|4>*<around*|(|-8*y<rsup|2>-8*x<rsup|2>|)>|)>+L<rsub|1><rsup|2>*<around*|(|D<rsub|2><rsup|4>*<around*|(|6*z<rsup|2>+2*y<rsup|2>+2*x<rsup|2>-2*D<rsub|3><rsup|2>|)>+D<rsub|2><rsup|2>*D<rsub|3><rsup|2>*<around*|(|-8*y<rsup|2>-8*x<rsup|2>|)>-2*D<rsub|2><rsup|6>|)>+D<rsub|2><rsup|6>*<around*|(|-2*z<rsup|2>-2*y<rsup|2>-2*x<rsup|2>+2*D<rsub|3><rsup|2>|)>+c<rsub|3><rsup|5>*<around*|(|D<rsub|2>*<around*|(|D<rsub|3><rsup|5>*<around*|(|-4*z<rsup|2>+12*y<rsup|2>+12*x<rsup|2>|)>+4*D<rsub|3><rsup|7>|)>+8*L<rsub|1>*D<rsub|2>*D<rsub|3><rsup|5>*z+20*D<rsub|2><rsup|3>*D<rsub|3><rsup|5>-4*L<rsub|1><rsup|2>*D<rsub|2>*D<rsub|3><rsup|5>|)>-4*L<rsub|1><rsup|3>*D<rsub|2><rsup|4>*z+D<rsub|3><rsup|4>*<around*|(|16*y<rsup|4>+32*x<rsup|2>*y<rsup|2>+16*x<rsup|4>|)>+4*D<rsub|2><rsup|2>*D<rsub|3><rsup|6>*c<rsub|3><rsup|6>+D<rsub|2><rsup|8>+L<rsub|1><rsup|4>*D<rsub|2><rsup|4>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      c3:map(rhs,[first(C3)])[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-D<rsub|3><rsup|2>-D<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*D<rsub|2>*D<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      [s31,s32]:map(rhs,(solve(subst(c[3]=c3,eq[6]),s[3])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|-<frac|<sqrt|-z<rsup|4>+4*L<rsub|1>*z<rsup|3>-2*y<rsup|2>*z<rsup|2>-2*x<rsup|2>*z<rsup|2>+2*D<rsub|3><rsup|2>*z<rsup|2>+2*D<rsub|2><rsup|2>*z<rsup|2>-6*L<rsub|1><rsup|2>*z<rsup|2>+4*L<rsub|1>*y<rsup|2>*z+4*L<rsub|1>*x<rsup|2>*z-4*L<rsub|1>*D<rsub|3><rsup|2>*z-4*L<rsub|1>*D<rsub|2><rsup|2>*z+4*L<rsub|1><rsup|3>*z-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*D<rsub|3><rsup|2>*y<rsup|2>+2*D<rsub|2><rsup|2>*y<rsup|2>-2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*D<rsub|3><rsup|2>*x<rsup|2>+2*D<rsub|2><rsup|2>*x<rsup|2>-2*L<rsub|1><rsup|2>*x<rsup|2>-D<rsub|3><rsup|4>+2*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>+2*L<rsub|1><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*D<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*D<rsub|2>*D<rsub|3>>,<frac|<sqrt|-z<rsup|4>+4*L<rsub|1>*z<rsup|3>-2*y<rsup|2>*z<rsup|2>-2*x<rsup|2>*z<rsup|2>+2*D<rsub|3><rsup|2>*z<rsup|2>+2*D<rsub|2><rsup|2>*z<rsup|2>-6*L<rsub|1><rsup|2>*z<rsup|2>+4*L<rsub|1>*y<rsup|2>*z+4*L<rsub|1>*x<rsup|2>*z-4*L<rsub|1>*D<rsub|3><rsup|2>*z-4*L<rsub|1>*D<rsub|2><rsup|2>*z+4*L<rsub|1><rsup|3>*z-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*D<rsub|3><rsup|2>*y<rsup|2>+2*D<rsub|2><rsup|2>*y<rsup|2>-2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*D<rsub|3><rsup|2>*x<rsup|2>+2*D<rsub|2><rsup|2>*x<rsup|2>-2*L<rsub|1><rsup|2>*x<rsup|2>-D<rsub|3><rsup|4>+2*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>+2*L<rsub|1><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*D<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*D<rsub|2>*D<rsub|3>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      c3:map(rhs,[first(C3)])[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-D<rsub|3><rsup|2>-D<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*D<rsub|2>*D<rsub|3>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      q31:atan2(s31,c3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >>-<math-up|atan2><around*|(|<frac|<sqrt|-z<rsup|4>+4*L<rsub|1>*z<rsup|3>-2*y<rsup|2>*z<rsup|2>-2*x<rsup|2>*z<rsup|2>+2*D<rsub|3><rsup|2>*z<rsup|2>+2*D<rsub|2><rsup|2>*z<rsup|2>-6*L<rsub|1><rsup|2>*z<rsup|2>+4*L<rsub|1>*y<rsup|2>*z+4*L<rsub|1>*x<rsup|2>*z-4*L<rsub|1>*D<rsub|3><rsup|2>*z-4*L<rsub|1>*D<rsub|2><rsup|2>*z+4*L<rsub|1><rsup|3>*z-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*D<rsub|3><rsup|2>*y<rsup|2>+2*D<rsub|2><rsup|2>*y<rsup|2>-2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*D<rsub|3><rsup|2>*x<rsup|2>+2*D<rsub|2><rsup|2>*x<rsup|2>-2*L<rsub|1><rsup|2>*x<rsup|2>-D<rsub|3><rsup|4>+2*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>+2*L<rsub|1><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*D<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*D<rsub|2>*D<rsub|3>>,<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-D<rsub|3><rsup|2>-D<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*D<rsub|2>*D<rsub|3>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      q32:atan2(s32,c3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      ><with|font-family|rm|atan2>><around*|(|<frac|<sqrt|-z<rsup|4>+4*L<rsub|1>*z<rsup|3>-2*y<rsup|2>*z<rsup|2>-2*x<rsup|2>*z<rsup|2>+2*D<rsub|3><rsup|2>*z<rsup|2>+2*D<rsub|2><rsup|2>*z<rsup|2>-6*L<rsub|1><rsup|2>*z<rsup|2>+4*L<rsub|1>*y<rsup|2>*z+4*L<rsub|1>*x<rsup|2>*z-4*L<rsub|1>*D<rsub|3><rsup|2>*z-4*L<rsub|1>*D<rsub|2><rsup|2>*z+4*L<rsub|1><rsup|3>*z-y<rsup|4>-2*x<rsup|2>*y<rsup|2>+2*D<rsub|3><rsup|2>*y<rsup|2>+2*D<rsub|2><rsup|2>*y<rsup|2>-2*L<rsub|1><rsup|2>*y<rsup|2>-x<rsup|4>+2*D<rsub|3><rsup|2>*x<rsup|2>+2*D<rsub|2><rsup|2>*x<rsup|2>-2*L<rsub|1><rsup|2>*x<rsup|2>-D<rsub|3><rsup|4>+2*D<rsub|2><rsup|2>*D<rsub|3><rsup|2>+2*L<rsub|1><rsup|2>*D<rsub|3><rsup|2>-D<rsub|2><rsup|4>+2*L<rsub|1><rsup|2>*D<rsub|2><rsup|2>-L<rsub|1><rsup|4>>|2*D<rsub|2>*D<rsub|3>>,<frac|z<rsup|2>-2*L<rsub|1>*z+y<rsup|2>+x<rsup|2>-D<rsub|3><rsup|2>-D<rsub|2><rsup|2>+L<rsub|1><rsup|2>|2*D<rsub|2>*D<rsub|3>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      [c21,s21,c22,s22]:map(rhs,flatten(solve([p,eq[3]],[c[2],s[2]])))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><around*|[|-<frac|-D<rsub|3>*s<rsub|3>*z+<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*D<rsub|3>*s<rsub|3>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>,<frac|<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*z+D<rsub|3>*s<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*D<rsub|3>*c<rsub|3>-L<rsub|1>*D<rsub|2>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>,<frac|D<rsub|3>*s<rsub|3>*z+<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*D<rsub|3>*s<rsub|3>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>,-<frac|<around*|(|-D<rsub|3>*c<rsub|3>-D<rsub|2>|)>*z+D<rsub|3>*s<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*D<rsub|3>*c<rsub|3>+L<rsub|1>*D<rsub|2>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      q21:atan2(s21,c21)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      ><with|font-family|rm|atan2>><around*|(|<frac|<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*z+D<rsub|3>*s<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*D<rsub|3>*c<rsub|3>-L<rsub|1>*D<rsub|2>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>,-<frac|-D<rsub|3>*s<rsub|3>*z+<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*D<rsub|3>*s<rsub|3>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      q22:atan2(s22,c22)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >>-<math-up|atan2><around*|(|<frac|<around*|(|-D<rsub|3>*c<rsub|3>-D<rsub|2>|)>*z+D<rsub|3>*s<rsub|3>*<sqrt|y<rsup|2>+x<rsup|2>>+L<rsub|1>*D<rsub|3>*c<rsub|3>+L<rsub|1>*D<rsub|2>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>,<frac|D<rsub|3>*s<rsub|3>*z+<around*|(|D<rsub|3>*c<rsub|3>+D<rsub|2>|)>*<sqrt|y<rsup|2>+x<rsup|2>>-L<rsub|1>*D<rsub|3>*s<rsub|3>|D<rsub|3><rsup|2>*s<rsub|3><rsup|2>+D<rsub|3><rsup|2>*c<rsub|3><rsup|2>+2*D<rsub|2>*D<rsub|3>*c<rsub|3>+D<rsub|2><rsup|2>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      [c1,s1]:map(rhs,(facsum(flatten(solve([eq[1],eq[2]],[c[1],s[1]])),[D[3]])))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|-<frac|x|D<rsub|3>*<around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>|)>-D<rsub|2>*c<rsub|2>>,-<frac|y|D<rsub|3>*<around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>|)>-D<rsub|2>*c<rsub|2>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      q1:atan2(s1,c1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >>-<math-up|atan2><around*|(|<frac|y|D<rsub|3>*<around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>|)>-D<rsub|2>*c<rsub|2>>,-<frac|x|D<rsub|3>*<around*|(|s<rsub|2>*s<rsub|3>-c<rsub|2>*c<rsub|3>|)>-D<rsub|2>*c<rsub|2>>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
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