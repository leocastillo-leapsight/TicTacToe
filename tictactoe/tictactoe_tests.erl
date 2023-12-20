-module(tictactoe_tests).
-include_lib("eunit/include/eunit.hrl").

start_game_test() ->
    {ok, Pid} = tictactoe:start_link(),
    ok = tictactoe:play(Pid, {x, 1, 1}),
    ok = tictactoe:play(Pid, {o, 2, 2}),
    ok = tictactoe:play(Pid, {x, 1, 2}),
    ok = tictactoe:play(Pid, {o, 2, 1}),
    ok = tictactoe:play(Pid, {x, 1, 3}),
    ok = tictactoe:play(Pid, {o, 2, 3}),
    ok = tictactoe:play(Pid, {x, 3, 1}),
    ok = tictactoe:play(Pid, {o, 3, 2}),
    ok = tictactoe:play(Pid, {x, 3, 3}),
    ok = tictactoe:reset(Pid).