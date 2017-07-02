%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2010. All Rights Reserved.
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
%%%----------------------------------------------------------------------
%%% Purpose : A priority queue.
%%%----------------------------------------------------------------------
%%% This module implements a priority queue as defined in
%%% "Priority Queues and the STL" by Mark Nelson in Dr.Dobb's Journal, Jan 1996
%%% see http://web2.airmail.net/markn/articles/pq_stl/priority.htm for more
%%% information. (A heap implementation is planned aswell)
%%%----------------------------------------------------------------------
%%% The items of the queue is kept priority sorted, and because of that,
%%% a push() operation costs more than a pop() operation (wich only
%%% needs to return the top item of the queue(read: list)).
%%%----------------------------------------------------------------------
%%% The priority queue can be deceptively nice to use when creating for
%%% example a Huffman coding tree.
%%% See http://web2.airmail.net/markn/articles/pq_stl/priority.htm or
%%% Dr.Dobb's Journal Jan, 96 for more information on this.
%%%----------------------------------------------------------------------

%%% Used here strictly as something for dbg_SUITE to run.

-module(dbg_test).
-export([test/1, loop/1]).
-export([new/0, push/3, pop/1]).

loop(Config) ->
    test(Config),
    receive
	{dbg_test, stop} ->
	    ok;
	Other ->
	    loop(Config)
    end,
    ok.

test(Config) ->
    Q1=new(),
    Q2=push(Q1, "monkey",  3),
    Q3=push(Q2, "banana",  4),
    Q4=push(Q3, "jungle",  2),
    Q5=push(Q4, "world",   5),
    Q6=push(Q5, "universe",6),
    Q7=push(Q6, "peanut",  1),
%    io:format("~p~n",[Q7]),
    {Itm, Q8}=pop(Q7),
    ok.

%% Returns a new priority queue.
new() ->
    [].

%% Pushes a new item with a set priority into the queue.
push(Queue, Itm, Pri) ->
    insert(Queue, Itm, Pri, []).

%% Pops the item with the highest priority out of the queue.
pop([{Itm, Pri}|Queue]) ->
    {Itm, Queue}.

%% --- -- -
%% Support functions.
insert([], Itm, Pri, NewQ) ->
    lists:flatten([lists:reverse(NewQ)|[{Itm, Pri}]]);
% Itm>QItm>NewQ>Queue
insert([{QItm,QPri}|Queue], Itm, Pri, NewQ) when Pri>QPri->
    A = [{Itm, Pri}|[{QItm, QPri}]],
    lists:flatten([[A|NewQ]|Queue]);
insert([QItm|Rest], Itm, Pri, NewQ) ->
    insert(Rest, Itm, Pri, [QItm|NewQ]).
%% --- -- -
