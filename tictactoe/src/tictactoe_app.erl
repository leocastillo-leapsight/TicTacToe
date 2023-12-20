-module(tictactoe_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
    {ok, _} = tictactoe_sup:start_link(),
    {ok, tictactoe}.

stop(_State) ->
    ok.
