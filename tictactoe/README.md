tictactoe
=====

- An application made with Erlang/OTP 23 and Rebar3, by Leo Castillo.
- Una aplicación realizada con Erlang/OTP 23 y Rebar3, por Leo Castillo.

Build
-----

    $ rebar3 compile
    $ rebar3 shell

Start app
-----
    1> application:start(tictactoe). 
    2> Board0 = tictactoe:new().
    Bienvenido al Tic Tac Toe de Leo Castillo!

    {undefined,undefined,undefined,undefined,undefined,
           undefined,undefined,undefined,undefined}
    3> Board1 = tictactoe:play(x, 1, 1, Board0).
    4> Board2 = tictactoe:play(o, 2, 2, Board1).
    5> Board3 = tictactoe:play(x, 3, 3, Board2).
    6> tictactoe:print_board(Board3).
    7> Result = tictactoe:check(Board3).
    8> application:stop(tictactoe).
    9> q().

Nota: En éste caso, la linea 7> Devuelve "ok" porque nadie ganó. pero probando otro caso en donde hay un vencedor la pantalla imprimirá algo como "({victory, x}).
Note: In this case, line 7> Returns "ok" because no one won. but trying another case where there is a winner the screen will print something like "({victory, x}).
