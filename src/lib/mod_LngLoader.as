//LngLoader 2025 ABATBeliever
#module
	#deffunc Loadlng str p1
		tmp@=""
		LoadlngNameList=""
		LoadlngPassageList=""
		exist dir_cur+"\\i18n\\"+p1										//存在確認
		if strsize=-1{tmp@="Fail":return}
	
		notesel Loadlng_buffer										//ロード
		noteload dir_cur+"\\i18n\\"+p1

		LoadlngMax=notemax
		repeat LoadlngMax											//分析
			sdim tmp												//tmp解放
			noteget tmp,cnt
			split tmp,"=",tmp
			if length(tmp)<2{continue}
			strrep tmp(1),"*","="
                        strrep tmp(1),"<br>","\n"
			LoadlngNameList(cnt)   =tmp(0)
			LoadlngPassageList(cnt)=tmp(1)
		loop

		noteunsel													//note解放
	return

	#defcfunc getText str p1
		tmp=""
		repeat LoadlngMax
			if LoadlngNameList(cnt)=p1{tmp=LoadlngPassageList(cnt):break}
			if cnt=LoadlngMax-1{
				dialog "The language file is damaged.\n\nExit(Y)/Ignore(N)",3,"LngLoader: ["+p1+"]"
				if stat=6 {end}
			}
		loop
	return tmp

#global