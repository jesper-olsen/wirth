Program eightqueens (output);

{Place eight queens on a chessboard so that none are under attack}

var i: integer;
    a: array [1..8] of boolean;  {no queen on row}
    b: array [2..16] of boolean; {no queen on sw-diagonal} 
    c: array [-7..7] of boolean; {no queen on se-diagonal}
    x: array [1..8] of integer;  {position (row) of queen in each column}

procedure print;
    var k: integer;
begin 
    {for each column, print the row number to place a queen}
    for k:=1 to 8 do
        write(x[k]:4);
    writeln
end {print};

procedure try(i: integer);
    var j: integer;
begin 
    for j:=1 to 8 do 
        if a[j] and b[i+j] and c[i-j] then
        begin x[i]:=j;
            a[j]:=false;
            b[i+j]:=false;
            c[i-j]:=false;
            if i<8 then try(i+1) else print;
            a[j]:=true;
            b[i+j]:=true;
            c[i-j]:=true
        end
end {try};

begin
    for i:=1 to 8 do a[i]:=true;  {no queen on row}
    for i:=2 to 16 do b[i]:=true; {sw-diagonal}
    for i:=-7 to 7 do c[i]:=true; {se-diagonal}
    try(1)
end.
