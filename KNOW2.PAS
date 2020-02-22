TYPE Mang = Array[1..100000000] of Longint;

VAR f:Text; x,y,n,i:Longint; A:Mang; c:Boolean; ok:Byte;

BEGIN
    Assign(f,'KNOW2.INP');
    Reset(f);
    ok:=1;
    c:=False;
    n:=0;
    While not EOF(f) do
    Begin
        Readln(f,x,y);
        If c then
        Begin
            ok:=0;
            For i:=1 to n do
            Begin
                If A[i]=x then
                Begin
                    ok:=1;
                    Inc(n);
                    A[n]:=y;
                End
                Else If A[i]=y then
                Begin
                    ok:=1;
                    Inc(n);
                    A[n]:=x;
                End;
            End;
        End Else
        Begin
            c:=True;
            Inc(n,2);
            A[1]:=x;
            A[2]:=y;
        End;
        If ok=0 then Break;
    End;
    Close(f);

    Assign(f,'KNOW2.OUT');
    Rewrite(f);
    Writeln(f,ok);
    Close(f);
END.
