{application, tictactoe,
  [
   {description, "Tic Tac Toe Game"},
   {vsn, "1.0"},
   {modules, [tictactoe, tictactoe_app, tictactoe_sup]},
   {registered, [tictactoe, tictactoe_sup]},
   {applications, [kernel, stdlib]},
   {env, []}
  ]
}.
