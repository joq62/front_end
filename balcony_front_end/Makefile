PROJECT = websocket
PROJECT_DESCRIPTION = Cowboy Websocket example
PROJECT_VERSION = 1

DEPS = cowboy
dep_cowboy_commit = master

include erlang.mk 
# Joq Erlang code
c1:
	rm -rf deps;
	rm -rf */*.beam *~ */*~
websocket:
	rm -rf */*.beam *~ */*~;
	cp src/websocket.app ebin;
	erlc -o ebin src/*.erl;
	erl -pa deps/cowboy/ebin -pa deps/ranch/ebin -pa deps/cowlib/ebin -pa ebin -s websocket_boot start -sname websocket
