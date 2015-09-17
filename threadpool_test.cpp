#include "ThreadPool.h"

//#include "threadpool.h"

#include <iostream>

using namespace std;

const int MAX_TASKS = 4;

void hello(void* arg)
{
  int* x = (int*) arg;
  cout << "Hello " << *x << endl;
//  cout << "\n";
}

int main(int argc, char* argv[])
{
  ThreadPool tp(2);
  int ret = tp.initialize_threadpool();
  if (ret == -1) {
    cerr << "Failed to initialize thread pool!" << endl;
    return 0;
  }

  for (int i = 0; i < MAX_TASKS; i++) {
    int* x = new int();
    *x = i+1;
    Task* t = new Task(&hello, (void*) x);
//    cout << "Adding to pool, task " << i+1 << endl;
    tp.add_task(t);
//    cout << "Added to pool, task " << i+1 << endl;
  }

  sleep(2);

  tp.destroy_threadpool();

  // TODO: delete worker objects

  cout << "Exiting app..." << endl;

  return 0;
}
