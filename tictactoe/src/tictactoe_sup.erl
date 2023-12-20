-module(tictactoe_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Children = [
        {tictactoe, {tictactoe, start_link, []}, permanent, 5000, worker, [tictactoe]}
    ],
    {ok, {SupervisorSpec, _}} = supervisor:check_childspecs(Children),
    {ok, SupervisorSpec}.
