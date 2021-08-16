;----------------------------------------------------------------
;キーバインドを無効にするウィンドウかどうか判断する
; ahk_classはauto hot key付属のAU3_Spy.exeを使用して調べる。
;  引数 なし
;  戻り値 1:キーバインドを無効にするウィンドウ
;         0:キーバインドを有効にするウィンドウ
;----------------------------------------------------------------
is_disable_window()
{
	;gvim
	IfWinActive,ahk_class Vim
	{
		return 1
	}
	;tera term
	IfWinActive,ahk_class VTWin32
	{
		return 1
	}
	;vmware player
	IfWinActive,ahk_class VMPlayerFrame
	{
		return 1
	}
	return 0
}
;----------------------------------------------------------------
;キーを送信する
; キーバインドを無効にするウィンドウでは、送信されたキーをそのまま使用する
; キーバインドを有効にするウィンドウでは、送信されたキーを置き換える
;
;  引数 original_key:キーバインドを無効にするウィンドウの場合、送信するキー
;       replace_key:キーバインドを有効にするウィンドウの場合、送信するキー
;  戻り値 なし
;----------------------------------------------------------------
send_key(original_key,replace_key)
{
	if (is_disable_window())
	{
		Send,%original_key%
		return
	}
	Send,%replace_key%
	return
}
<!j::send_key("!j","{Down}")
<!+j::send_key("!+j","+{Down}")
<!k::send_key("!k","{Up}")
<!+k::send_key("!+k","+{Up}")
<!h::send_key("!h","{Left}")
<!+h::send_key("!+f","+{Left}")
<!l::send_key("!l","{Right}")
<!+l::send_key("!+l","+{Right}")
<!d::send_key("!d","{Del}")
<!+d::send_key("!+d","+{Del}")
<!0::send_key("!0","{Home}")
<!+0::send_key("!+0","+{Home}")
<!e::send_key("!e","{End}")
<!+e::send_key("!+e","+{End}")
!Space::MouseClick, Right