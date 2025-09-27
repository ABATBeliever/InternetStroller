; -----------------------------------------------------------------------------
; mod_openini.as - iniファイル操作モジュール
; Version 1.0 [2024.02.29]
; Copyright (c) 2024 Lala Madotuki
; -----------------------------------------------------------------------------
; iniファイルの読み書きを行うモジュールです。
; -----------------------------------------------------------------------------
; コピペ用
; #include "mod_openini.as"
; -----------------------------------------------------------------------------

#include "kernel32.as"
// iniファイルを指定
#deffunc setini_file str _file, int _p
	sdim file,strlen(_file)+1: file=_file
	size=_p: if size=0 { size=300 }	// 省略時は 300bytes
	return

// 設定ファイルから読み出し(数値)
#defcfunc getini_int str _sec, str _key, int _def
	return int(getini_str(_sec,_key,str(_def)))

// 設定ファイルから読み出し(文字列)
#defcfunc getini_str str _sec, str _key, str _def, local _buf
	sdim _buf,size
	GetPrivateProfileString _sec,_key,_def,varptr(_buf),size,file
	return _buf

// 設定ファイルに書き込み(数値)
#deffunc setini_int str _sec, str _key, int _p
	setini_str _sec,_key,str(_p)
	return

// 設定ファイルに書き込み(文字列)
#deffunc setini_str str _sec, str _key, str _p
	WritePrivateProfileString _sec,_key,_p,file
	return