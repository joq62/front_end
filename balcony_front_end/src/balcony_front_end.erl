-module(balcony_front_end).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2]).
 
init(Req, State) ->
    io:format("~p~n",[{?MODULE,?FUNCTION_NAME,?LINE,State}]),
    {cowboy_websocket, Req, State}.  %Perform websocket setup

%websocket_init(State) ->
 %   io:format("~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
  %  {ok, State}.
websocket_init(State) ->
    io:format("~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
    Temp=balcony:read(),
    {reply, {text,io_lib:format("~w", [Temp])},State }.

websocket_handle({text, <<"decrease_temp">>}, State) ->
    NewTemp=balcony:decrease(),
    {reply, 
     {text, io_lib:format("~w", [NewTemp]) },State};

websocket_handle({text, <<"increase_temp">>}, State) ->
    NewTemp=balcony:increase(),
    {reply, 
     {text, io_lib:format("~w", [NewTemp]) },State};


websocket_handle(Other, State) ->  %Ignore
    io:format("[Other,State~p~n",[{?MODULE,?LINE,Other,State}]),
    {ok, State}.


websocket_info({text, Text}, State) ->
    {reply, {text, Text}, State};
websocket_info(_Other, State) ->
    {ok, State}.
