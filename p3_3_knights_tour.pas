Program knightstour (output);

{ n=5; x0,y0 = 1,1
    1    6   15   10   21
   14    9   20    5   16
   19    2    7   22   11
    8   13   24   17    4
   25   18    3   12   23
}

{ n=5; x0,y0 = 3,3
   23   10   15    4   25
   16    5   24    9   14
   11   22    1   18    3
    6   17   20   13    8
   21   12    7    2   19
}

{ n=6; x0,y0 = 1,1
    1   16    7   26   11   14
   34   25   12   15    6   27
   17    2   33    8   13   10
   32   35   24   21   28    5
   23   18    3   30    9   20
   36   31   22   19    4   29
}

Const n = 6; {board size}
  nsq = n*n;
  x0=1; y0=1; {start pos}

Type index = 1..n;

Var i,j: index;
  q: boolean;
  s: set Of index;
  a,b: array [1..8] Of integer;
  h: array [index, index] Of integer;

Procedure 
Try
  (i: integer; x,y: index; Var q: boolean);

  Var k,u,v: integer;
    q1: boolean;
  Begin
    k := 0;
    Repeat
      k := k+1;
      q1 := false;
      u := x +a[k];
      v := y +b[k];
      If (u In s) And (v In s) Then
        If h[u,v] = 0 Then
          Begin
            h[u,v] := i;
            If i < nsq Then
              Begin
                Try
                  (i+1,u,v,q1);
                  If Not q1 Then h[u,v] := 0
              End
            Else q1 := true
          End
    Until q1 Or (k=8);
    q := q1
  End {try} ;

  Begin
    s := [];
    For i := 1 To n Do
        s := s + [i];
    a[1] := 2;
    b[1] := 1;
    a[2] := 1;
    b[2] := 2;
    a[3] := -1;
    b[3] := 2;
    a[4] := -2;
    b[4] := 1;
    a[5] := -2;
    b[5] := -1;
    a[6] := -1;
    b[6] := -2;
    a[7] := 1;
    b[7] := -2;
    a[8] := 2;
    b[8] := -1;
    For i := 1 To n Do
      For j:= 1 To n Do
        h[i,j] := 0;
    h[x0,y0] := 1;
    Try
      (2,x0,y0,q);
      If q Then
        For i := 1 To n Do
          Begin
            For j := 1 To n Do
              write(h[i,j]:5);
            writeln
          End
          Else writeln(' NO SOLUTION ')
  End.
