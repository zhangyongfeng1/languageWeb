%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2013. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
%%
-module(error_handler_SUITE).

-export([all/0,suite/0,groups/0,init_per_suite/1,end_per_suite/1,
	 init_per_group/2,end_per_group/2,
	 undefined_function_handler/1]).

%% Callback from error_handler.
-export(['$handle_undefined_function'/2]).

suite() -> [{ct_hooks,[ts_install_cth]}].

all() ->
    [undefined_function_handler].

groups() ->
    [].

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.

init_per_group(_GroupName, Config) ->
    Config.

end_per_group(_GroupName, Config) ->
    Config.


%%-----------------------------------------------------------------

undefined_function_handler(_) ->
    42 = ?MODULE:forty_two(),
    42 = (id(?MODULE)):forty_two(),
    {ok,{a,b,c}} = ?MODULE:one_arg({a,b,c}),
    {ok,{a,b,c}} = (id(?MODULE)):one_arg({a,b,c}),
    {'EXIT',{undef,[{?MODULE,undef_and_not_handled,[[1,2,3]],[]}|_]}} =
	(catch ?MODULE:undef_and_not_handled([1,2,3])),
    ok.

'$handle_undefined_function'(forty_two, []) ->
    42;
'$handle_undefined_function'(one_arg, [Arg]) ->
    {ok,Arg};
'$handle_undefined_function'(Func, Args) ->
    error_handler:raise_undef_exception(?MODULE, Func, Args).

id(I) ->
    I.
