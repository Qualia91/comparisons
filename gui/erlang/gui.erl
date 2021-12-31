-module(gui).
-author(boc_dev).

-include_lib("wx/include/wx.hrl").

-export([main/0]).

-spec main() -> ok.
main() ->
    wx:new(),
    Frame = wxFrame:new(wx:null(), ?wxID_ANY, "Adder"),
    MainSizer = wxBoxSizer:new(?wxVERTICAL),
    Label = wxTextCtrl:new(Frame, ?wxID_ANY, 
         [{value, integer_to_list(0)}]),
    Button = wxButton:new(Frame, ?wxID_ANY, 
        [{label, "+ 1"}]),
    wxSizer:add(MainSizer, Label, 
        [{flag, ?wxALL bor ?wxEXPAND}, {border, 5}]),
    wxSizer:add(MainSizer, Button, 
        [{flag, ?wxEXPAND bor ?wxALL}, {border, 5}]),
    wxButton:connect(Button, command_button_clicked, 
        [{callback, fun handle_click/2}, 
         {userData, #{label => Label, env => wx:get_env()}}
        ]),
    wxWindow:setSizer(Frame, MainSizer),
    wxFrame:show(Frame).

handle_click(#wx{userData = #{label := L, env := E}}, _) ->
    wx:set_env(E),
    Value = wxTextCtrl:getValue(L),
    wxTextCtrl:setValue(L, 
        integer_to_list(list_to_integer(Value) + 1)).