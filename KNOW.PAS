TYPE Vlist = Array[1..10000] of Boolean;
     Matran = Array[1..10000,1..10000] of Boolean;

VAR f:Text; n,i,j,x,y:Integer; Visited:Vlist; A:Matran; c:Boolean;

PROCEDURE DFS(u:Integer);
Var v:Integer;
Begin
    Visited[u]:=true;
    For v:=1 to n do
        If (A[u,v]) and (not Visited[v]) then
            DFS(v);
End;

BEGIN
    Assign(f,'KNOW.INP');
    Reset(f);
    FillChar(A,SizeOf(A),false);
    FillChar(Visited,SizeOf(Visited),false);
    Readln(f,n);
    While not EOF(f) do
    Begin
        Readln(f,x,y);
        A[x,y]:=true;
        A[y,x]:=true;
    End;
    Close(f);

    Assign(f,'KNOW.OUT');
    Rewrite(f);
    c:=true;
    DFS(1);
    For i:=1 to n do
        If Visited[i]=false then
        Begin
            c:=false;
            Break;
        End;
    If c then
        Writeln(f,1)
    else
        Writeln(f,0);
    Close(f);
END.
