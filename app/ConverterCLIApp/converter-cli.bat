@echo off
rem ---------------------------------------------------------------------------
rem
rem   JAVA_HOME       Must point at your Java Development Kit installation.
rem                   Required to run the with the "debug" argument.
rem
rem ---------------------------------------------------------------------------

::first check if java exists in PATH, if not exit
java -version >nul 2>&1 && (
	::then check if JAVA_HOME variable is set, if so use it
	IF NOT "%JAVA_HOME%" == "" (
		::check if there is the java executable in JAVA_HOME
		if exist "%JAVA_HOME%\bin\java.exe" ( 
			echo found java executable in JAVA_HOME
			set _java="%JAVA_HOME%\bin\java.exe"
			goto runJava
		)
	)
	echo Java executable found in PATH
	set _java=java
) || (
	echo Java does not exist.
	echo You need Java installation in order to launch Converter application.
	exit /b
)

:runJava
set CLASSPATH=.\converter-cli.jar;.\config\*
%_java%  -Xmx1024m -classpath %Classpath%; com.intrasoft.converterCLI.ConverterCLI %*
rem echo Exit Code: %ERRORLEVEL%