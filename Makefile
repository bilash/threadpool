all:
	g++ threadpool.cpp -lpthread -fpic -c -o bin/obj/threadpool.o
	g++ -L./bin bin/obj/threadpool.o -lpthread threadpool_test.cpp -o bin/example/threadpool_test

#threadpool:
#	g++ threadpool.cpp -lpthread -fpic -c -o bin/obj/threadpool.o
#	g++ -shared -fPIC bin/obj/threadpool.o -o bin/lib/libthreadpool.so
#example:
#	g++ -L./bin/lib -lthreadpool threadpool_test.cpp -o threadpool_test
