%%  coding: latin-1
%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: oe_cos_naming_ext
%% Source: /net/isildur/ldisk/daily_build/17_prebuild_master-opu_o.2014-04-07_20/otp_src_17/lib/orber/COSS/CosNaming/cos_naming_ext.idl
%% IC vsn: 4.3.5
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module(oe_cos_naming_ext).
-ic_compiled("4_3_5").


-include_lib("orber/include/ifr_types.hrl").

%% Interface functions

-export([oe_register/0, oe_unregister/0, oe_get_module/5]).
-export([oe_dependency/0]).



oe_register() ->
    OE_IFR = orber_ifr:find_repository(),

    register_tests(OE_IFR),

    _OE_1 = oe_get_top_module(OE_IFR, "IDL:omg.org/CosNaming:1.0", "CosNaming", "1.0"),

    _OE_2 = orber_ifr:'ModuleDef_create_interface'(_OE_1, "IDL:omg.org/CosNaming/NamingContextExt:1.0", "NamingContextExt", "1.0", [orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext:1.0")]),

    orber_ifr:'InterfaceDef_create_alias'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/StringName:1.0", "StringName", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'InterfaceDef_create_alias'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/Address:1.0", "Address", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'InterfaceDef_create_alias'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/URLString:1.0", "URLString", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0})),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/to_string:1.0", "to_string", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), 'OP_NORMAL', [#parameterdescription{name="n", type={tk_sequence,
                                      {tk_struct,
                                       "IDL:omg.org/CosNaming/NameComponent:1.0",
                                       "NameComponent",
                                       [{"id",{tk_string,0}},
                                        {"kind",{tk_string,0}}]},
                                      0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_struct,
                                                "IDL:omg.org/CosNaming/NameComponent:1.0",
                                                "NameComponent",
                                                [{"id",{tk_string,0}},
                                                 {"kind",{tk_string,0}}]},
                                               0}), mode='PARAM_IN'}
], [orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0")], []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/to_name:1.0", "to_name", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_sequence,
                                               {tk_struct,
                                                "IDL:omg.org/CosNaming/NameComponent:1.0",
                                                "NameComponent",
                                                [{"id",{tk_string,0}},
                                                 {"kind",{tk_string,0}}]},
                                               0}), 'OP_NORMAL', [#parameterdescription{name="sn", type={tk_string,0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), mode='PARAM_IN'}
], [orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0")], []),

    orber_ifr:'InterfaceDef_create_exception'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/InvalidAddress:1.0", "InvalidAddress", "1.0", []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/to_url:1.0", "to_url", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), 'OP_NORMAL', [#parameterdescription{name="sn", type={tk_string,0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), mode='PARAM_IN'}
, #parameterdescription{name="addr", type={tk_string,0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), mode='PARAM_IN'}
], [orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0"), orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContextExt/InvalidAddress:1.0")], []),

    orber_ifr:'InterfaceDef_create_operation'(_OE_2, "IDL:omg.org/CosNaming/NamingContextExt/resolve_str:1.0", "resolve_str", "1.0", orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_objref,[],"Object"}), 'OP_NORMAL', [#parameterdescription{name="n", type={tk_string,0}, type_def=orber_ifr:'Repository_create_idltype'(OE_IFR, {tk_string,0}), mode='PARAM_IN'}
], [orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0"), orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/CannotProceed:1.0"), orber_ifr:lookup_id(OE_IFR,"IDL:omg.org/CosNaming/NamingContext/NotFound:1.0")], []),

    ok.


%% General IFR registration checks.
register_tests(OE_IFR)->
  re_register_test(OE_IFR),
  include_reg_test(OE_IFR).


%% IFR type Re-registration checks.
re_register_test(OE_IFR)->
  case orber_ifr:'Repository_lookup_id'(OE_IFR,"IDL:omg.org/CosNaming/NamingContextExt:1.0") of
    []  ->
      true;
    _ ->
      exit({allready_registered,"IDL:omg.org/CosNaming/NamingContextExt:1.0"})
 end.


%% IFR registration checks for included idl files.
include_reg_test(OE_IFR) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR,"IDL:omg.org/CosNaming:1.0") of
    [] ->
      exit({unregistered,"IDL:omg.org/CosNaming:1.0"});
    _  ->
      true
  end,
  true.


%% Fetch top module reference, register if unregistered.
oe_get_top_module(OE_IFR, ID, Name, Version) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR, ID) of
    [] ->
      orber_ifr:'Repository_create_module'(OE_IFR, ID, Name, Version);
    Mod  ->
      Mod
   end.

%% Fetch module reference, register if unregistered.
oe_get_module(OE_IFR, OE_Parent, ID, Name, Version) ->
  case orber_ifr:'Repository_lookup_id'(OE_IFR, ID) of
    [] ->
      orber_ifr:'ModuleDef_create_module'(OE_Parent, ID, Name, Version);
    Mod  ->
      Mod
   end.



oe_unregister() ->
    OE_IFR = orber_ifr:find_repository(),

    oe_destroy(OE_IFR, "IDL:omg.org/CosNaming/NamingContextExt:1.0"),
    oe_destroy_if_empty(OE_IFR, "IDL:omg.org/CosNaming:1.0"),
    ok.


oe_destroy_if_empty(OE_IFR,IFR_ID) ->
    case orber_ifr:'Repository_lookup_id'(OE_IFR, IFR_ID) of
	[] ->
	    ok;
	Ref ->
	    case orber_ifr:contents(Ref, 'dk_All', 'true') of
		[] ->
		    orber_ifr:destroy(Ref),
		    ok;
		_ ->
		    ok
	    end
    end.

oe_destroy(OE_IFR,IFR_ID) ->
    case orber_ifr:'Repository_lookup_id'(OE_IFR, IFR_ID) of
	[] ->
	    ok;
	Ref ->
	    orber_ifr:destroy(Ref),
	    ok
    end.



%% Idl file dependency list function
oe_dependency() ->

    {"/net/isildur/ldisk/daily_build/17_prebuild_master-opu_o.2014-04-07_20/otp_src_17/lib/orber/COSS/CosNaming/cos_naming_ext.idl",
     ["cos_naming.idl"]}.

