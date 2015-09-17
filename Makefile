OBJPATH=bin/obj
EXAMPLEPATH=bin/example

all:
	g++ CondVar.cpp -lpthread -c -o $(OBJPATH)/CondVar.o
	g++ Mutex.cpp -lpthread -c -o $(OBJPATH)/Mutex.o
	g++ Task.cpp -lpthread -c -o $(OBJPATH)/Task.o
	g++ ThreadPool.cpp -lpthread -c -o $(OBJPATH)/ThreadPool.o
	g++ $(OBJPATH)/CondVar.o $(OBJPATH)/Mutex.o $(OBJPATH)/Task.o $(OBJPATH)/ThreadPool.o threadpool_test.cpp -lpthread -o $(EXAMPLEPATH)threadpool_test

#all:
#	g++ threadpool.cpp -lpthread -fpic -c -o bin/obj/threadpool.o
#	g++ -L./bin bin/obj/threadpool.o -lpthread threadpool_test.cpp -o bin/example/threadpool_test

#threadpool:
#	g++ threadpool.cpp -lpthread -fpic -c -o bin/obj/threadpool.o
#	g++ -shared -fPIC bin/obj/threadpool.o -o bin/lib/libthreadpool.so
#example:
#	g++ -L./bin/lib -lthreadpool threadpool_test.cpp -o threadpool_test
