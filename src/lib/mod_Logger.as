#module LogManager
	#deffunc WriteLogRAW  str p1     //生書き込み 内容
		LogStore+="\n"+p1
		#ifdef dIsThisBuildDebug@
			title "*DEBUG devtool: "+p1
		#endif
	return
	
	#deffunc WriteLog str p1, str p2 //ログ書き込み 中身 品種
		LogStore+="\n"+"["+p2+"] "+strf("%02d/%02d/%02d ", gettime(0), gettime(1), gettime(3))+strf("%02d:%02d:%02d ", gettime(4), gettime(5), gettime(6))+p1
		#ifdef dIsThisBuildDebug@
			title "*DEBUG devtool: "+p1
		#endif
	return
	
	#defcfunc ShowLog
	return LogStore
	
	#deffunc ResetLog
		sdim LogStore
		LogStore = "mod_devtool LogManager v0.1"
		WriteLogRAW strf("%s %s %s", dApplicationName@, dApplicationVersion@, dApplicationVersionInt@)	
		#ifdef dIsThisBuildDebug@
			WriteLog "このビルドはデバッグビルドです","INFO"
		#endif
	return
#global

ResetLog