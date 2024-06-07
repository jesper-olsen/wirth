
Program power;
{decimal representation of negative powers of 2}

Const 
  n = 10;

Type 
  digit = 0..9;

Var 
  i, k, r: integer;
  d: array [1..n] Of digit;
Begin
  For i := 1 To n Do
    d[i] := 0;

  For k := 1 To n Do
    Begin
      write('.');
      r := 0;
      For i := 1 To k - 1 Do
        Begin
          r := 10 * r + d[i];
          d[i] := r Div 2;
          r := r - 2 * d[i];
          write(chr(d[i] + ord('0')))
        End;
      d[k] := 5;
      writeln('5')
    End
End.
