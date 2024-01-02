-module(tictactoe).

-include_lib("eunit/include/eunit.hrl").

-export([start_link/0, new/0, play/4, check/1, welcome_message/0, print_board/1, test_check/0, run_tests/0]).

start_link() ->
    {ok, Pid} = gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    Pid.

new() ->
    welcome_message(),
    {undefined, undefined, undefined,
    undefined, undefined, undefined,
    undefined, undefined, undefined}.
    
play(Who, X, Y, Board) ->
    UpdatedBoard = setelement((Y - 1) * 3 + X, Board, Who),
    print_board(UpdatedBoard),
    UpdatedBoard.

check(Board) ->
    case Board of
        {x, x, x,
         _, _, _,
         _, _, _} -> {victory, x};

        {_, _, _,
         x, x, x,
         _, _, _} -> {victory, x};

        {_, _, _,
         _, _, _,
         x, x, x} -> {victory, x};

        {x, _, _,
         x, _, _,
         x, _, _} -> {victory, x};

        {_, x, _,
         _, x, _,
         _, x, _} -> {victory, x};

        {_, _, x,
         _, _, x,
         _, _, x} -> {victory, x};

        {x, _, _,
         _, x, _,
         _, _, x} -> {victory, x};

        {_, _, x,
         _, x, _,
         x, _, _} -> {victory, x};

        {o, o, o,
         _, _, _,
         _, _, _} -> {victory, o};

        {_, _, _,
         o, o, o,
         _, _, _} -> {victory, o};

        {_, _, _,
         _, _, _,
         o, o, o} -> {victory, o};

        {o, _, _,
         o, _, _,
         o, _, _} -> {victory, o};

        {_, o, _,
         _, o, _,
         _, o, _} -> {victory, o};

        {_, _, o,
         _, _, o,
         _, _, o} -> {victory, o};

        {o, _, _,
         _, o, _,
         _, _, o} -> {victory, o};

        {_, _, o,
         _, o, _,
         o, _, _} -> {victory, o};

        {A, B, C,
         D, E, F,
         G, H, I} when A =/= undefined, B =/= undefined, C =/= undefined,
                       D =/= undefined, E =/= undefined, F =/= undefined,
                       G =/= undefined, H =/= undefined, I =/= undefined ->
            draw;

        _ -> ok
    end.

%% Testing
test_check() ->
    [
        ?_assertEqual({victory, x}, check({x, x, x, undefined, undefined, undefined, undefined, undefined, undefined})),
        ?_assertEqual({victory, x}, check({undefined, undefined, undefined, x, x, x, undefined, undefined, undefined})),
        ?_assertEqual({victory, o}, check({o, undefined, undefined, o, undefined, undefined, o, undefined, undefined}))
    ].

run_tests() ->
    eunit:test(tictactoe).

welcome_message() ->
    io:format("Bienvenido al Tic Tac Toe de Leo Castillo!~n~n").

print_board(Board) ->
    Rows = [[get_value(Board, Row, Col) || Col <- [1, 2, 3]] || Row <- [1, 2, 3]],
    print_rows(Rows).

get_value(Board, Row, Col) ->
    element((Row - 1) * 3 + Col, Board).

print_rows([]) -> ok;
print_rows([Row | RestRows]) ->
    print_row(Row),
    print_rows(RestRows).

print_row([Cell1, Cell2, Cell3]) ->
    DisplayCell = fun(Cell) ->
        case Cell of
            x -> $x;
            o -> $o;
            _ -> $'  % Espacio para valores indefinidos
        end
    end,
    io:format("~c | ~c | ~c~n", [DisplayCell(Cell1), DisplayCell(Cell2), DisplayCell(Cell3)]).